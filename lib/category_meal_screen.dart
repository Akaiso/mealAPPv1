import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = "/category_meals";
  // final String categoryId;
  // final String categoryTitle;
  //
  // const CategoryMealsScreen({ this.categoryId,  this.categoryTitle}) ;

  //Above was commented out because we are using NamedRoute to pass data and we can extract data from the "arguments" and save in data as depicted in the build method below;

  @override
  Widget build(BuildContext context) {
    //you extract your data from the flutter class ModalRoute as thus:
    final routArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routArgs['title'];
    final categoryId = routArgs['id'];
    final categoryMeals = DUMMY_MEALS.where((meals) {
      return meals.categories.contains(categoryId);
    }).toList();


    return Scaffold(
      appBar: AppBar( title: Text(categoryTitle) ,),
      body: ListView.builder(itemBuilder: (context, index){
        return Text(categoryMeals[index].title);
      },
        itemCount: categoryMeals.length,
      )
    );
  }
}
