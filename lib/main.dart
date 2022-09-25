
//@dart = 2.9


import 'package:flutter/material.dart';
import 'package:uncle_bens_diet_app/screens/categories_screen.dart';
import 'package:uncle_bens_diet_app/screens/category_meal_screen.dart';
import 'package:uncle_bens_diet_app/screens/filters_screen.dart';
import 'package:uncle_bens_diet_app/screens/meal_detail_screen.dart';
import 'package:uncle_bens_diet_app/screens/tabs_screen.dart';

import 'dummy_data.dart';
import 'models/meal.dart';


void main() => runApp(MyApp());



class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<String, bool> _filters = {
  'gluten':false,
  'lactose':false,
  'vegan':false,
  'vegetarian': false,
};

  List<Meal> _availableMeals = DUMMY_MEALS;


void _setFilters(Map<String, bool> filterData) {
  setState(() {
    _filters = filterData;

    _availableMeals = DUMMY_MEALS.where((meal){
      if(_filters['gluten'] && !meal.isGlutenFree){
        return false;
      }
      if(_filters['lactose'] && !meal.isLactoseFree){
        return false;
      }
      if(_filters['vegan'] && !meal.isVegan){
        return false;
      }
      if(_filters['vegetarian'] && !meal.isVegetarian){
        return false;
      }
      return true;
    }).toList();
  });
}



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Uncle Ben\'s diet app',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   primarySwatch: Colors.pink,
      //   accentColor: Colors.amber,
      //   canvasColor: Color.fromRGBO(255, 254, 229, 1),
      //   fontFamily: 'Raleway',
      //   textTheme: ThemeData.light().textTheme.copyWith(
              // bodyText1: TextStyle(
              //   color: Color.fromRGBO(20, 51, 51, 1),
              // ),
              // bodyText2: TextStyle(
              //   color: Color.fromRGBO(20, 51, 51, 1),
              // ),
              // titleMedium: TextStyle(
              //   fontSize: 24,
              //   fontFamily: "RobotoCondensed",
              // ),

      //home: CategoriesScreen(), //can comment out and use initialRoute property which defaults to '/'
      initialRoute: '/',
      //flutter has its own systematic way of passing data;the routeTable-routes:{'':(){}} rather than through class properties hence we use Navigator.pushNamed() which doesn't take a MaterialPageRoute but as indicated where used in the application
      routes: {
        '/': (context)=>TabsScreen(),
        CategoryMealsScreen.routeName : (ctx)=>CategoryMealsScreen(_availableMeals),
    MealDetailScreen.routeName: (ctx)=> MealDetailScreen(),
        FiltersScreen.routeName: (ctx)=> FiltersScreen(currentFilters: _filters ,saveFilters: _setFilters),
    },
      onUnknownRoute: (setting){return MaterialPageRoute(builder: (ctx)=> CategoriesScreen());},
      // home: SplashScreen(),
    );
  }
}



// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('DeliMeals'),
//       ),
//       body: Center(
//         child: Text('Navigation Time!'),
//       ),
//     );
//   }
// }
