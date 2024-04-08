import 'package:meals/providers/favorites_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/filters_screen.dart';
import 'package:meals/screens/meals_screen.dart';
import 'package:meals/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  String appBarTitle = "Categories";
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identinfier) {
    Navigator.of(context).pop();
    if (identinfier == 'filters') {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => const FiltersScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final favoriteMeals = ref.watch(favoriteMealsProvider);

    Widget activePage = const CategoriesScreen();

    switch (_selectedPageIndex) {
      case 0:
        activePage = const CategoriesScreen();
        setState(() {
          appBarTitle = "Categories";
        });
        break;

      case 1:
        setState(() {
          appBarTitle = "Your Favorites";
        });
        activePage = MealsScreen(
          meals: favoriteMeals,
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
