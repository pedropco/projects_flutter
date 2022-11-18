import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:receipes/components/meal_item.dart';
import '../models/meal.dart';
import '../components/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  const FavoriteScreen(this.favoriteMeals, {super.key});

  @override
  Widget build(BuildContext context) {
    return favoriteMeals.isEmpty
        ? Container(child: Text('tela de favoritos'))
        : ListView.builder(
            itemCount: favoriteMeals.length,
            itemBuilder: ((context, index) {
              return MealItem(favoriteMeals[index]);
            }));
  }
}
