import 'package:flutter/material.dart';
import 'package:meal_app/Views/category_meal_screen.dart';

class CategoryItem extends StatelessWidget {
// props ...
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id, this.title, this.color);
// helping methods ...
  void selectcategory(context) {
    Navigator.pushNamed(context, CategoryMealsScreen.id,
        arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      splashColor: Theme.of(context).primaryColor,
      onTap: () => selectcategory(context),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [color, color.withOpacity(0.5)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: EdgeInsets.all(15),
        child: Text(title),
      ),
    );
  }
}
