import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget buildListTile(String title,IconData icon, Function tapHandler){
      return ListTile(
        onTap: tapHandler ,
        leading: Icon(
          icon,
          size: 26,
        ),
        title: Text(
          title,
          style: TextStyle(
              fontFamily: 'RobotoCondensed',
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
      );
    }
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Colors.yellow,
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              'Cook up!',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Colors.pinkAccent),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile('Meals', Icons.restaurant, (){
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile('Filters', Icons.settings,(){
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          }),

        ],
      ),
    );
  }
}
