import 'package:flutter/material.dart';
import 'package:flutterwork9/screens/home_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          displaySmall: TextStyle(
            color: Colors.white.withOpacity(0.5),
          ),
          displayMedium: TextStyle(
            color: Colors.red.shade400,
          ),
          displayLarge: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
