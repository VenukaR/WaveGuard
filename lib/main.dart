import 'package:flutter/material.dart';
import 'package:waveguard/Screens/splashscreen.dart';
import 'package:waveguard/config/theme.dart';
import 'main_navigation.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WaveGuard',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      // textTheme: const TextTheme(
      //     bodyLarge: TextStyle(fontFamily: "poppins"),
      //     bodyMedium: TextStyle(fontFamily: "poppins"),
      //     displayLarge: TextStyle(fontFamily: "poppins"),
      //     displayMedium: TextStyle(fontFamily: "poppins"),
      // ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
