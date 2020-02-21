import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName =
      '/category-meals';

  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  bool _loadedInitData = false;

  // initState runs before context is created
  // but it would be ideal to use for what we are doing within didChangeDependencies
  @override
  void initState() {
    super.initState();
  }

  // didChangeDependencies has access to context already
  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
      ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
    }

    _loadedInitData = true;
    super.didChangeDependencies();
  }

  // dummy functionality, doesn't bring much value since meals are recreated on category revisit
  // but it's ok to showcase the idea
//  void _removeMeal(String mealId) {
//    setState(() {
//      displayedMeals.removeWhere((meal) => meal.id == mealId);
//    });
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          final categoryMeal = displayedMeals[index];

          return MealItem(
            id: categoryMeal.id,
            title: categoryMeal.title,
            complexity: categoryMeal.complexity,
            affordability: categoryMeal.affordability,
            duration: categoryMeal.duration,
            imageUrl: categoryMeal.imageUrl,
//            removeItem: _removeMeal,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
