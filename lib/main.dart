import 'package:flutter/material.dart';
import 'package:meal_app/Views/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.id,
      routes: {HomePage.id: (context) => HomePage()},
    );
  }
}
