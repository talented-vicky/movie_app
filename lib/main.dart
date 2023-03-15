import 'package:flutter/material.dart';

import './features/in_theater.dart';
import './router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const routeName = '/';
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) => generateRoute(settings),
      onUnknownRoute: routeNotGenerated,
      home: const InTheater(),
    );
  }
}
