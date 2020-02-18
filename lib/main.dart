import 'package:flutter/material.dart';

import 'screens/meal_details_screen.dart';
import 'screens/category_meals_screen.dart';
import 'screens/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            body1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            body2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            title: TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            )),
      ),
      // home: CategoriesScreen(),
      initialRoute: '/', // default is '/' so no need to set
      // route names might be whatever string
      // adding slash beforehand is just a borrowing from web development
      routes: {
        '/': (ctx) => TabsScreen(),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        MealDetailsScreen.routeName: (ctx) => MealDetailsScreen(),
      },
//      fired for any route not registered in routes object
//      onGenerateRoute: (settings) {
//        print(settings.arguments);
//        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
//      },
//      fired for routes not handled by routes table and onGenerateRoute function
//      onUnknownRoute: () {},
    );
  }
}
