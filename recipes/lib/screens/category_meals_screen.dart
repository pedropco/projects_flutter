import 'package:flutter/material.dart';
import 'package:receipes/components/meal_item.dart';
import 'package:receipes/models/meal.dart';
import '../models/category.dart';
import '../data/dummy_data.dart';

class CategoriesMealsScreen extends StatelessWidget {
  final List<Meal> meals;

  const CategoriesMealsScreen(this.meals, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;

    final categoryMeals = meals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: Center(
          child: ListView.builder(
              itemCount: categoryMeals.length,
              itemBuilder: ((context, index) {
                return MealItem(categoryMeals[index]);
              }))),
    );
  }
}
