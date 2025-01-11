import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trailertime/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trailer Time',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          dialogBackgroundColor: Colors.white,
          textTheme: const TextTheme(
            bodyLarge: TextStyle(
              color: Colors.black,
              fontSize: 24,
            ),
            bodyMedium: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          brightness: Brightness.light,

          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple)
          //     .copyWith(background: Colors.black),
          useMaterial3: true,
          fontFamily: GoogleFonts.almendra().fontFamily),
      home: splash_screen(),
    );
  }
}
