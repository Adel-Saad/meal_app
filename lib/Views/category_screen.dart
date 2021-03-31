import 'package:flutter/material.dart';
import '../Views/Widgets/category_item.dart';
import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  static const String id = 'CategoriesScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView(
          children: DUMMY_CATEGORIES.map((e) {
            return CategoryItem(e.id, e.title, e.color);
          }).toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
        ),
      ),
    );
  }
}
