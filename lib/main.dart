import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/screen/home_screen.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => GetWeatherCubit(),
        child: Builder(builder: (context) {
          return BlocBuilder<GetWeatherCubit, WeatherState>(
            builder: (context, state) {
              return MaterialApp(
                theme: ThemeData(
                  useMaterial3: false,
                  primarySwatch: getThemeColor(
                      BlocProvider.of<GetWeatherCubit>(context)
                          .weatherModel
                          ?.weatherCondition),
                ),
                debugShowCheckedModeBanner: false,
                home: const HomeScreen(),
              );
            },
          );
        },),);
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  if (condition == 'Sunny' || condition == 'Hot') {
    // Sunny and hot conditions can use a bright yellow/orange color with different shades
    return Colors
        .amber; // Returning MaterialColor with lighter and darker shades
  } else if (condition == 'Heavy snow' ||
      condition == 'Cold' ||
      condition == 'Heavy rain' ||
      condition == 'Overcast') {
    // Snowy and cold conditions are grouped with blue colors
    return Colors.blue; // MaterialColor for cold or snowy weather
  } else if (condition == 'Rainy' ||
      condition == 'Foggy' ||
      condition == 'Patchy rain possible') {
    // Rainy and foggy can use grayish or bluish colors to indicate low visibility
    return Colors.blueGrey; // MaterialColor for rainy or foggy conditions
  } else if (condition == 'Cloudy' || condition == 'Hazy') {
    // Cloudy and hazy conditions are associated with soft colors like grey
    return Colors.grey; // MaterialColor for cloudy or hazy weather
  } else if (condition == 'Stormy' ||
      condition == 'Light freezing rain' ||
      condition == 'Partly cloudy') {
    // Stormy or thunderstorm conditions can use darker and more intense colors like deep orange or purple
    return Colors.orange; // MaterialColor for stormy or thunderstorm weather
  } else if (condition == 'Windy' || condition == 'Tornado') {
    // Windy and tornado conditions can use strong, intense colors like red or redAccent
    return Colors.brown; // MaterialColor for windy or tornado weather
  } else if (condition == 'Clear night' || condition == 'Cool night') {
    // Clear and cool nights can use deep blue or indigo colors
    return Colors.indigo; // MaterialColor for night-time or cool weather
  } else {
    // Default color if no condition matches
    return Colors.deepPurple; // Default MaterialColor when no condition matches
  }
}
