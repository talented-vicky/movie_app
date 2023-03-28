import 'package:flutter/material.dart';

import 'package:movie_app/features/movie_api.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      // onGenerateRoute: (settings) => generateRoute(settings),
      // onUnknownRoute: routeNotGenerated,
      home: MovieAPI(),
    );
  }
}
