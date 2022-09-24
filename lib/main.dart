
//@dart = 2.9


import 'package:flutter/material.dart';
import 'package:uncle_bens_diet_app/categories_screen.dart';
import 'package:uncle_bens_diet_app/category_meal_screen.dart';
import 'package:uncle_bens_diet_app/views/healthyDIETsplashScreen.dart';
import 'package:uncle_bens_diet_app/views/ui_components_collections.dart/LoginValidation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Uncle Ben\'s diet app',
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
        '/': (context)=>CategoriesScreen(),
        CategoryMealsScreen.routeName : (context)=>CategoryMealsScreen()},
      // home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DeliMeals'),
      ),
      body: Center(
        child: Text('Navigation Time!'),
      ),
    );
  }
}
