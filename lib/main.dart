import 'package:flutter/material.dart';

import 'views/home.dart';

const kDefaultColor = Colors.deepPurple;
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram app',
      routes: {"home": (_) => const HomePage()},
      initialRoute: "home",
    );
  }
}
