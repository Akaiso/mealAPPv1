import 'package:flutter/material.dart';

import 'package:uncle_bens_diet_app/dummy_data.dart';
import 'package:uncle_bens_diet_app/widgets/category_item.dart';
import '../models/meal.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      // appBar: AppBar(
      //   title: const Text(" YUM! YUM! "),
      //   centerTitle: true,
      // ),
      body: GridView(
        padding: const EdgeInsets.all(25),
        children: DUMMY_CATEGORIES
            .map((catData) =>
                CategoryItem(catData.id, catData.title, catData.color))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2, //1.5 can still work,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    ));
  }
}
