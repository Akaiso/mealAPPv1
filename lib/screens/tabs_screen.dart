import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';
import 'categories_screen.dart';
import 'favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  final List<Map<String, dynamic>> _pages = [
    {'page': CategoriesScreen(), 'title': 'Categories' },
    {'page': FavoritesScreen(), 'title': 'Your Favorite'},
  ];

  int _selectedPageIndex = 0;

  void  _selectPage(int index){
    setState((){{
      _selectedPageIndex = index;
    }
    });
  }


  @override
  Widget build(BuildContext context) {
    // to add tab bars at the bottom of the AppBar;
    // return DefaultTabController(
    //   length: 2,
    //   child: Scaffold(
    //     appBar: AppBar(title: Text('Meals') , bottom: TabBar(
    //       tabs: [
    //         Tab(icon: Icon(Icons.category), text: 'Categories',),
    //         Tab(icon: Icon(Icons.star), text: 'Favorites' ,)
    //       ],
    //     ),),
    //     body: TabBarView(
    //       children: [
    //         CategoriesScreen(), FavoritesScreen()
    //       ],
    //     ),
    //   ),
    //
    // );

    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Colors.pinkAccent,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.yellow ,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
    );
  }
}
