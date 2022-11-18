import 'package:flutter/material.dart';
import 'package:receipes/models/category.dart';
import 'package:receipes/utils/app_routes.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem(this.category, {Key? key}) : super(key: key);

  void _selectCategory(BuildContext context) {
    Navigator.of(context)
        .pushNamed(AppRoutes.categories_meals, arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      onTap: () => _selectCategory(context),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
                colors: [category.color.withOpacity(0.5), category.color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child:
            Text(category.title, style: Theme.of(context).textTheme.headline6),
      ),
    );
  }
}
