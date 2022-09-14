import 'package:flutter/material.dart';

import 'package:uncle_bens_diet_app/dummy_data.dart';
import 'package:uncle_bens_diet_app/views/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return SafeArea(
        child: Scaffold(
          appBar: AppBar(title: const Text(" YUM! YUM! "),centerTitle: true,),
      body: GridView(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical:30),
        children:
          DUMMY_CATEGORIES.map((e)=> CategoryItem( e.title, e.color)).toList(),
         gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200, childAspectRatio: 3/2 ,//1.5 can still work,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      ),
    ));
  }
}
