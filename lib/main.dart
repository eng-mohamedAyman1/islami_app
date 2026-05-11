import 'package:flutter/material.dart';
import 'package:islami_app/ul/home_screen.dart';
import 'package:islami_app/util/app_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        AppRoute.homeScreenRoute:(context) => HomeScreen(),
      },
      initialRoute: AppRoute.homeScreenRoute,
    );
  }
}

