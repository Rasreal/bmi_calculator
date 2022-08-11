import 'package:flutter/material.dart';
import 'pages/input_page.dart';
import 'pages/results_page.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

// @dart=2.9
void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //initial start page
      /*routes: {
        '/home': (context) => InputPage(),
        '/results': (context) => ResultsPage(),
      },*/
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xCC0A0E21),
          //shadowColor: Color(0x0A0E21),
        ),

        backgroundColor: Colors.black,
        primaryColor: Colors.yellow, //doesn't work
        hoverColor: Colors.pink, //same shit
        textTheme: TextTheme(
          bodyText2: TextStyle(
            // Text's default color
            color: Colors.white54,
            fontSize: 35,
          ),
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: InputPage(),
    );
  }
}
