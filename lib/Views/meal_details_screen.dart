import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
// props ...
  static const String id = 'MealDetailsScreen';

// Main Builder .....
  @override
  Widget build(BuildContext context) {
    final mealID = ModalRoute.of(context).settings.arguments as String;
    final _selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealID);

    return Scaffold(
      appBar: AppBar(
        title: Text(_selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(8.0),
              height: MediaQuery.of(context).size.height * 0.33,
              width: double.infinity,
              child: Image.network(
                _selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            _buildTitle('Ingredients'),
            _buildContainer(
              context,
              ListView.builder(
                itemCount: _selectedMeal.ingredients.length,
                itemBuilder: (context, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(_selectedMeal.ingredients[index]),
                  ),
                ),
              ),
            ),
            _buildTitle('Steps'),
            _buildContainer(
              context,
              ListView.builder(
                itemCount: _selectedMeal.ingredients.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    ListTile(
                      title: Text(_selectedMeal.steps[index]),
                      leading: CircleAvatar(
                        child: Text('# ${index + 1}'),
                      ),
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Helping Methods ....
Widget _buildTitle(text) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 08.0),
    child: Text(
      text,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ),
  );
}

Widget _buildContainer(context, Widget child) {
  return Container(
      padding: EdgeInsets.all(08),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(15),
      ),
      height: MediaQuery.of(context).size.height * 0.20,
      width: MediaQuery.of(context).size.width * 0.85,
      child: child);
}
