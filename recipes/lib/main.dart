import 'package:flutter/material.dart';
import 'package:receipes/data/dummy_data.dart';
import 'package:receipes/screens/meal_details_screen.dart';
import '../utils/app_routes.dart';
import '../screens/category_screens.dart';
import '../screens/category_meals_screen.dart';
import '../screens/meal_details_screen.dart';
import '../screens/tabs_screen.dart';
import '../screens/settings_screen.dart';
import '../models/settings.dart';
import '../models/meal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  List<Meal> _availableMeals = dummyMeals;
  List<Meal> _favoriteMeals = [];

  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;
      _availableMeals = dummyMeals.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;
        final filterVegan = settings.isVegan && !meal.isVegan;
        return !filterGluten &&
            !filterLactose &&
            !filterVegetarian &&
            !filterVegan;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  bool _isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos cozinhar',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Raleway',
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Colors.pink,
            secondary: Colors.amber,
          ),
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
              titleMedium: const TextStyle(
                  fontSize: 20, fontFamily: 'RobotoCondensed'))),
      routes: {
        AppRoutes.home: (context) => TabsScreen(_favoriteMeals),
        AppRoutes.categories_meals: (context) =>
            CategoriesMealsScreen(_availableMeals),
        AppRoutes.meal_detail_screen: (context) =>
            MealDetailScreen(_toggleFavorite, _isFavorite),
        AppRoutes.settings: (context) => SettingsScreen(settings, _filterMeals)
      },
      // poderia ficar do jeito abaixo também
      //home: const CategoryScreens(),
      // routes: {
      //   '/categories-meals': (ctx) => const CategoriesMealScreen(),
    );
  }
}
