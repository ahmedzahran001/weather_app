import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        // backgroundColor: Colors.blue,
        title: const Text(
          'Search City',
          style: TextStyle(
              // color: Colors.white,
              ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
              var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
              getWeatherCubit.getWeather(cityName: value);
              Navigator.pop(context);
            },
            // onChanged: (value) {
            //   print(value);
            // },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 19,
                horizontal: 16,
              ),
              // labelText: "Search",
              // labelStyle: TextStyle(color: Colors.amber),
              label: Text(
                'Search',
                // style: TextStyle(color: Colors.blue),
              ),
              suffixIcon: Icon(
                Icons.search,
                // color: Colors.blue,
              ),
              hintText: "Enter City Name",
              hintStyle: TextStyle(color: Colors.black),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                // borderRadius: BorderRadius.circular(16),
              ),
              // enabledBorder: OutlineInputBorder(
              //   // borderRadius: BorderRadius.circular(16),
              //   borderSide: BorderSide(color: Colors.black),
              // ),
              // focusedBorder: OutlineInputBorder(
              //   // borderRadius: BorderRadius.circular(16),
              //   borderSide: BorderSide(color: Colors.blue),
              // ),
            ),
          ),
        ),
      ),
    );
  }
}
