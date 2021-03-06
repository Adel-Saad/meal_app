import 'package:flutter/material.dart';
import 'package:meal_app/Views/favorites_screen.dart';
import './Views/category_meal_screen.dart';
import './Views/category_screen.dart';
import './Views/meal_details_screen.dart';
import 'Views/tabs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: TabsScreen.id,
      routes: {
        CategoriesScreen.id: (contex) => CategoriesScreen(),
        CategoryMealsScreen.id: (context) => CategoryMealsScreen(),
        MealDetailsScreen.id: (context) => MealDetailsScreen(),
        FavoritsScreen.id: (context) => FavoritsScreen(),
        TabsScreen.id: (context) => TabsScreen(),
      },
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.yellow,
        canvasColor: Color.fromRGBO(255, 250, 240, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
            headline6: TextStyle(fontSize: 24, fontFamily: 'Raleway-Black')),
      ),
    );
  }
}
