import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
// import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class CategorrMealsScreen extends StatelessWidget {
  static const routeName = '/caterory-meals';
  // final String categoryId;
  // final String categoryTitle;

  // CategorrMealsScreen(
  //   this.categoryId,
  //   this.categoryTitle,
  // );

  @override
  Widget build(BuildContext context) {
    final routeAgrs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeAgrs['title'];
    final categoryId = routeAgrs['id'];
    final categoriesMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: categoriesMeals[index].id,
            title: categoriesMeals[index].title,
            imageUrl: categoriesMeals[index].imageUrl,
            duration: categoriesMeals[index].duration,
            complexity: categoriesMeals[index].complexity,
            affordability: categoriesMeals[index].affordability,
          );
        },
        itemCount: categoriesMeals.length,
      ),
    );
  }
}
