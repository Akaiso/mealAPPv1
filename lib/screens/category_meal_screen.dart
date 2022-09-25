import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = "/category_meals";

  final List<Meal> availableMeals ;

  CategoryMealsScreen(this.availableMeals);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {

  String categoryTitle;
  List<Meal> displayedMeals;
  bool _loadedInitData = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  ///instead of initstate , the didChangeDependencies is used since it runs before the build method and the ModalRoute.of(context) is needed before the initState()
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    //this deletes the meal usser doesn't want on the list and it runs once so. if you go back to the categories screen and tap on a category, the meal shows up again
    //if(_loadedInitData == false ) is same as if(!_loadedInitData)
    if(!_loadedInitData){
    final routArgs =
    ModalRoute.of(context).settings.arguments as Map<String, String>;
    categoryTitle = routArgs['title'];
    final categoryId = routArgs['id'];
    displayedMeals = widget.availableMeals.where((meals) {
      return meals.categories.contains(categoryId);
    }).toList();
    _loadedInitData = true;}
    super.didChangeDependencies();

  }

  void _removeMeal(String mealId){
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }


  // final String categoryId;
  @override
  Widget build(BuildContext context) {
    //you extract your data from the flutter class ModalRoute as thus:
    ///this is taken to the initState function cos the removeItem function needs the mealId
    // final routArgs =
    //     ModalRoute.of(context).settings.arguments as Map<String, String>;
    // final categoryTitle = routArgs['title'];
    // final categoryId = routArgs['id'];
    // final categoryMeals = DUMMY_MEALS.where((meals) {
    //   return meals.categories.contains(categoryId);
    // }).toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(
              id: displayedMeals[index].id,
              title: displayedMeals[index].title,
              imageUrl: displayedMeals[index].imageUrl,
              duration: displayedMeals[index].duration,
              complexity: displayedMeals[index].complexity,
              affordability: displayedMeals[index].affordability,
              removeItem: _removeMeal,
            );
          },
          itemCount: displayedMeals.length,
        ));
  }
}
