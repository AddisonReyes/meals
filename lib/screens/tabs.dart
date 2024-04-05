import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/filters_screen.dart';
import 'package:meals/screens/meals_screen.dart';
import 'package:meals/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Meal> _favoritesMeals = [];

  Map<Filter, bool> filters = {
    Filter.glutenFree: false,
    Filter.lactoseFree: false,
    Filter.vegetarian: false,
    Filter.vegan: false,
  };

  String appBarTitle = "Categories";
  int _selectedPageIndex = 0;

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void _toggleMealFavoriteStatus(Meal meal) {
    final isExisting = _favoritesMeals.contains(meal);

    if (isExisting) {
      setState(() {
        _favoritesMeals.remove(meal);
      });
      _showInfoMessage('Meal es no longer a favorite.');
    } else {
      setState(() {
        _favoritesMeals.add(meal);
      });
      _showInfoMessage('Marked as a favorite!');
    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void updateFiltersMap(Map<Filter, bool> newFilters) {
    setState(() {
      filters = newFilters;
    });
    _showInfoMessage('Filters updated!');
  }

  void _setScreen(String identinfier) {
    Navigator.of(context).pop();
    if (identinfier == 'filters') {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => FiltersScreen(
            updateFilters: updateFiltersMap,
            filters: filters,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(
      toggleMealFavorite: _toggleMealFavoriteStatus,
      filters: filters,
    );

    switch (_selectedPageIndex) {
      case 0:
        activePage = CategoriesScreen(
          toggleMealFavorite: _toggleMealFavoriteStatus,
          filters: filters,
        );
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
      drawer: MainDrawer(onSelectScreen: _setScreen),
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
