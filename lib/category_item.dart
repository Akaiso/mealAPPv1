import 'package:flutter/material.dart';
import 'package:uncle_bens_diet_app/category_meal_screen.dart';

import 'categories_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  const CategoryItem(this.id, this.title, this.color);


  //This function is used when passing data from Class properties to class constructor

  // void selectCategory(BuildContext ctx) {
  //       Navigator.of(ctx).push(MaterialPageRoute(builder: (_){
  //         return CategoryMealsScreen( categoryId: id, categoryTitle: title);
  //       } ));


  //This function is used when passing data with NamedRoute or RouteTable
void selectCategory(BuildContext ctx) {
      Navigator.of(ctx).pushNamed(CategoryMealsScreen.routeName, arguments: {'id':id, 'title': title} );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>selectCategory(context),
      splashColor: Colors.pink,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
            //Theme.of(context).textTheme.titleMedium,
            ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
