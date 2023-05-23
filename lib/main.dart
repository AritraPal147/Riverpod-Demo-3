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

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
    );
  }
}
