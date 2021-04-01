import 'package:flutter/material.dart';
import 'package:meal_app/Views/category_screen.dart';
import 'package:meal_app/Views/favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  static const String id = 'TabsScreen';
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
// props...
  int _index = 0;

  final List<Map<String, Object>> _pages = [
    {'page': CategoriesScreen(), 'title': 'Category'},
    {'page': FavoritsScreen(), 'title': 'Favorites'},
  ];

  void _selectPage(value) {
    setState(() {
      _index = value;
    });
  }

// Main Builder ...
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_index]['title']),
      ),
      body: _pages[_index]['page'],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) => _selectPage(value),
          currentIndex: _index,
          selectedItemColor: Theme.of(context).accentColor,
          unselectedItemColor: Colors.white,
          backgroundColor: Theme.of(context).primaryColor,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: 'Categories'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorits'),
          ]),
    );
  }
}
