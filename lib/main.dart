import 'package:flutter/material.dart';
import 'injection_container.dart' as di;

import 'features/number_trivia/presentation/pages/number_trivia_page.dart';

void main() async {
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Number Trivia",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepPurple[800],
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: Colors.deepPurple[600]),
        // buttonTheme: ButtonThemeData(
        //   buttonColor: Colors.deepPurple[800],
        //   textTheme: ButtonTextTheme.primary,
        // ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple[800],
            foregroundColor: Colors.deepPurple[600],
          ),
        ),
      ),
      home: NumberTriviaPage(),
    );
  }
}
