import 'package:flutter/material.dart';
import 'package:meal_app/Modules/meal.dart';
import 'package:meal_app/Views/meal_details_screen.dart';

class MealItem extends StatelessWidget {
// props ...
  final String imageUrl;
  final String title;
  final String id;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

// Constructor  ---------------------------------------
  const MealItem({
    @required this.imageUrl,
    @required this.title,
    @required this.id,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
  });

// Local Methods -------------------------------------
  void selectMeal(context) {
    Navigator.of(context).pushNamed(MealDetailsScreen.id, arguments: id);
  }

  //............................................
  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Unknown';
        break;
    }
  }

  //............................................
  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      default:
        return 'Unkown';
        break;
    }
  }

// Main Build -----------------------------------------
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 10,
        shadowColor: Theme.of(context).primaryColor,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  child: Image.network(imageUrl),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                Positioned(
                  bottom: 16,
                  right: 08,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        topLeft: Radius.circular(15),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    width: 320,
                    child: Text(
                      title,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 08,
                      ),
                      Text('${duration} min'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(
                        width: 08,
                      ),
                      Text(complexityText),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 08,
                      ),
                      Text(affordabilityText),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
