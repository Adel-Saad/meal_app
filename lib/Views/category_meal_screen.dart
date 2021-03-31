import 'package:flutter/material.dart';
import '../Modules/meal.dart';
import '../Views/Widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const String id = 'CategoryMealsScreen';
  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  @override
  Widget build(BuildContext context) {
    final categoryData =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = categoryData['id'];
    final categoryTitle = categoryData['title'];

    final List<Meal> mealList = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemCount: mealList.length,
        itemBuilder: (context, index) {
          return MealItem(
            id: mealList[index].id,
            complexity: mealList[index].complexity,
            affordability: mealList[index].affordability,
            duration: mealList[index].duration,
            title: mealList[index].title,
            imageUrl: mealList[index].imageUrl,
          );
        },
      ),
    );
  }
}
