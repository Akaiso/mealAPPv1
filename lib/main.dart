import 'package:flutter/material.dart';
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
      //   fontFamily: "Raleway",
      //   textTheme: ThemeData.light().textTheme.copyWith(
      //     bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1),
      //     ),
      //       bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1),
      //       ),
      //     titleMedium: TextStyle(fontSize: 20, fontFamily: "RobotoCondensed", fontWeight: FontWeight.bold),
      //     displayMedium: TextStyle(fontSize: 20, fontFamily: "RobotoCondensed")
      //   ),
      // ),
     // home: CategoriesScreen(),
     home: SplashScreen(),
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
