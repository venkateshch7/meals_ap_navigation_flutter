import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/favourites_screen.dart';

class TabScreens extends StatefulWidget {
  TabScreens({Key key}) : super(key: key);

  @override
  _TabScreensState createState() => _TabScreensState();
}

class _TabScreensState extends State<TabScreens> {
  final List<Widget> _pages = [
    CategoriesScreen(),
    FavouritesScreen(),
  ];
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  int _selectedPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Meals'),
        ),
        drawer: Drawer(child: Text('dasdas'),),
        body: _pages[_selectedPageIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectedPageIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.category,
              ),
              title: Text("categories"),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.star,
              ),
              title: Text("Favourites"),
            ),
          ],
        ),
      ),
    );
  }
}
