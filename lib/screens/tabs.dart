import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/meals_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  String appBarTitle = "Categories";
  int _selectedPageIndex = 0;

  final List<Meal> _favoritesMeals = [];
  void _toggleMealFavoriteStatus(Meal meal) {
    final isExisting = _favoritesMeals.contains(meal);

    setState(() {
      if (isExisting) {
        _favoritesMeals.remove(meal);
      } else {
        _favoritesMeals.add(meal);
      }
    });
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage =
        CategoriesScreen(toggleMealFavorite: _toggleMealFavoriteStatus);

    switch (_selectedPageIndex) {
      case 0:
        activePage =
            CategoriesScreen(toggleMealFavorite: _toggleMealFavoriteStatus);
        setState(() {
          appBarTitle = "Categories";
        });
        break;

      case 1:
        setState(() {
          appBarTitle = "Your Favorites";
        });
        activePage = MealsScreen(
          toggleMealFavorite: _toggleMealFavoriteStatus,
          meals: _favoritesMeals,
        );
        break;

      default:
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favorites",
          )
        ],
      ),
    );
  }
}
