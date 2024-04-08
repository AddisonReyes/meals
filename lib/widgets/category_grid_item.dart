import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/providers/filters_providers.dart';
import 'package:meals/screens/meals_screen.dart';

class CategoryGridItem extends ConsumerWidget {
  const CategoryGridItem({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filters = ref.watch(filtersProvider);
    List<Meal> meals = [];

    void selectCategory() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MealsScreen(
            meals: meals,
            title: category.title,
          ),
        ),
      );
    }

    for (final meal in dummyMeals) {
      if (meal.categories.contains(category.id)) {
        if (filters[Filter.lactoseFree]! && !meal.isLactoseFree) continue;
        if (filters[Filter.glutenFree]! && !meal.isGlutenFree) continue;
        if (filters[Filter.vegetarian]! && !meal.isVegetarian) continue;
        if (filters[Filter.vegan]! && !meal.isVegan) continue;

        meals.add(meal);
      }
    }

    return InkWell(
      onTap: selectCategory,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.55),
              category.color.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
    );
  }
}
