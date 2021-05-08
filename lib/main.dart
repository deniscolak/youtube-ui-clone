import 'package:flutter/material.dart';
import 'package:youtube_ui_clone/constants/color_cons.dart';
import 'package:youtube_ui_clone/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kBackColor,
        backgroundColor: kBackColor,
        brightness: Brightness.dark,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedItemColor: Colors.white, backgroundColor: kBackColor),
      ),
      home: HomeScreen(),
    );
  }
}
