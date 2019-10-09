import 'package:flutter/material.dart';

import './favorites_screen.dart';
import './categories_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  List<Widget> _pages = [
    CategoriesScreen(),
    FavoritesScreen()
  ];

  int _selectPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
        bottom: TabBar(
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.category),
              text: 'Categories',
            ),
            Tab(
              icon: Icon(Icons.star),
              text: 'Favorites',
            )
          ],
        ),
      ),
      body: _pages[_selectPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.category), title: Text('Category')),
        BottomNavigationBarItem(
            icon: Icon(Icons.star), title: Text('Favorites'))
      ]),
    );
  }
}
