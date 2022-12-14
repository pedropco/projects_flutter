import 'package:flutter/material.dart';
import 'package:receipes/components/category_item.dart';
import 'package:receipes/data/dummy_data.dart';

class CategoryScreens extends StatelessWidget {
  const CategoryScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(15),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      children: DUMMY_CATEGORIES.map((cat) {
        return CategoryItem(cat);
      }).toList(),
    );
  }
}
