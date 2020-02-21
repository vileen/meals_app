import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../models/meal.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text('You have no favorites yet - start adding some!'),
      );
    }

    return ListView.builder(
      itemBuilder: (ctx, index) {
        final categoryMeal = favoriteMeals[index];

        return MealItem(
          id: categoryMeal.id,
          title: categoryMeal.title,
          complexity: categoryMeal.complexity,
          affordability: categoryMeal.affordability,
          duration: categoryMeal.duration,
          imageUrl: categoryMeal.imageUrl,
        );
      },
      itemCount: favoriteMeals.length,
    );
  }
}
