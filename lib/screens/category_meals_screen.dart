import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName =
      '/category-meals'; // convention to prevent from typos
  // final String categoryId;
  // final String categoryTitle;

  // CategoryMealsScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          final categoryMeal = categoryMeals[index];

          return MealItem(
            id: categoryMeal.id,
            title: categoryMeal.title,
            complexity: categoryMeal.complexity,
            affordability: categoryMeal.affordability,
            duration: categoryMeal.duration,
            imageUrl: categoryMeal.imageUrl,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
