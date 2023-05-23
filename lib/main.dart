import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Riverpod Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    darkTheme: ThemeData.dark(),
    themeMode: ThemeMode.dark,
    debugShowCheckedModeBanner: false,
    home: const HomePage(),
  ));
}

/// List of cities
enum City {
  stockholm,
  paris,
  tokyo,
}

/// [WeatherEmoji] is a naming of [String] to make code more
/// readable and understandable
typedef WeatherEmoji = String;

/// This function returns [Future] of [WeatherEmoji] type
/// corresponding t the [city] that is provided to it
///
/// Future.delayed is used so that an api call time can be simulated.
/// The function returns different emojis based on which city
/// is provided to it.
/// If a city is not in below given list, then '?' is returned
Future<WeatherEmoji> getWeather(City city) {
  return Future.delayed(
    const Duration(seconds: 1),
    () =>
        {
          City.stockholm: '❄️',
          City.paris: '🌧️',
          City.tokyo: '💨',
        }[city] ??
        '?',
  );
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
      ),
    );
  }
}
