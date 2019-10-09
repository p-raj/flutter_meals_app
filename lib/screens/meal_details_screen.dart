import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../models/meal.dart'

class MealDetailsScreen extends StatelessWidget {
  static const routeName = '/meal-details';

  Widget buildSectionTitle(BuildContext ctx, title) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Text(title),
    );
  }

  Widget buildSection(BuildContext ctx, Widget child) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.green)),
      height: 200,
      width: 300,
      child: child
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;

    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
        appBar: AppBar(
          title: Text('${selectedMeal.title}'),
        ),
        body: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildSection(context, 
              ListView.builder(
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: (ctx, index) => Card(
                color: Colors.blueGrey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(selectedMeal.ingredients[index]),
                ),
              ),
            ),
            ),
            buildSectionTitle(context, 'How to cook'),
            buildSection(context, 
              ListView.builder(
                itemCount: selectedMeal.steps.length,
                itemBuilder: (ctx, index) => Card(
                  color: Colors.blueGrey,
                  child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(selectedMeal.steps[index]),
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}
