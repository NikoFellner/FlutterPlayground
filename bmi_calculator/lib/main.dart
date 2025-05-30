import 'package:flutter/material.dart';
import 'screens/input_page.dart';
import 'screens/results_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFF0A0E21), scaffoldBackgroundColor: Color(0xFF0A0E21),
          appBarTheme: AppBarTheme(color: Color(0xFF0A0E21)),
          //colorScheme: ColorScheme.light(secondary: Colors.purple,), // Replacement for accentColor
      ),
      routes: {
        "/input_page": (context) => InputPage(),
        "/results_page": (context) => ResultsPage(),
      },
      initialRoute: "/input_page",
    );
  }
}
