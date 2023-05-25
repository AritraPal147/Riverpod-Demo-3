import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(ProviderScope(
    child: MaterialApp(
      title: 'Flutter Riverpod Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    ),
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

const unknownWeatherEmoji = '🤷';

/// This provider stores a state which can be changed
/// by the UI later in the code
final currentCityProvider = StateProvider<City?>(
  (ref) => null,
);

/// This provider is read by the UI
///
/// Checks if the currentCityProvider has a city or not
/// If it has a city, then [getWeather] function is called on that city
/// Else [unknownWeatherEmoji] is returned.
final weatherProvider = FutureProvider<WeatherEmoji>(
  (ref) {
    final city = ref.watch(currentCityProvider);
    if (city != null) {
      return getWeather(city);
    } else {
      return unknownWeatherEmoji;
    }
  },
);

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
      ),
    );
  }
}
