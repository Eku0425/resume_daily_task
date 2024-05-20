import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resume_daily_task/Screen/HomePage.dart';
import 'package:resume_daily_task/Screen/routs.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.black));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: AppRouts.routs,
    );
  }
}

