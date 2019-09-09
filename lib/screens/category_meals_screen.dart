import 'package:flutter/material.dart';
import 'package:meals_app/dummy-data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const String route = '/category-meals';

  const CategoryMealsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'];
    final categoryTitle = routeArgs['title'];
    final categoryMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(categoryId))
        .toList();

    return Scaffold(
        appBar: AppBar(
          title: Text('The Recipes'),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, idx) {
            return Text(categoryMeals[idx].title);
          },
          itemCount: categoryMeals.length,
        ));
  }
}
