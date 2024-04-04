import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:meals/screens/tabs.dart';
import 'package:meals/widgets/main_drawer.dart';
import 'package:meals/widgets/switch_filter.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFreeFilterSet = false;
  bool _lactoseFreeFilterSet = false;
  bool _vegetarianFilterSet = false;
  bool _veganFilterSet = false;

  void _setScreen(String identinfier) {
    Navigator.of(context).pop();
    if (identinfier == 'meals') {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => const TabsScreen()));
    }
  }

  void _glutenFreeFilter() {
    setState(() {
      _glutenFreeFilterSet = !_glutenFreeFilterSet;
    });
  }

  void _lactoseFreeFilter() {
    setState(() {
      _lactoseFreeFilterSet = !_lactoseFreeFilterSet;
    });
  }

  void _vegetarianFilter() {
    setState(() {
      _vegetarianFilterSet = !_vegetarianFilterSet;
    });
  }

  void _veganFilter() {
    setState(() {
      _veganFilterSet = !_veganFilterSet;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(
        '$_glutenFreeFilterSet, $_lactoseFreeFilterSet, $_vegetarianFilterSet, $_veganFilterSet');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      drawer: MainDrawer(onSelectScreen: _setScreen),
      body: PopScope(
        canPop: false,
        onPopInvoked: (bool didPop) {
          if (didPop) return;
          Navigator.of(context).pop({
            Filter.glutenFree: _glutenFreeFilterSet,
            Filter.lactoseFree: _lactoseFreeFilterSet,
            Filter.vegetarian: _vegetarianFilterSet,
            Filter.vegan: _veganFilterSet,
          });
        },
        child: Column(
          children: [
            SwitchFilter(
              filterSet: _glutenFreeFilterSet,
              title: 'Gluten-free',
              subtitle: 'Only include gluten-free meals',
              changeVal: _glutenFreeFilter,
            ),
            SwitchFilter(
              filterSet: _lactoseFreeFilterSet,
              title: 'Lactose-free',
              subtitle: 'Only include lactose-free meals',
              changeVal: _lactoseFreeFilter,
            ),
            SwitchFilter(
              filterSet: _vegetarianFilterSet,
              title: 'Vegetarian',
              subtitle: 'Only include vegetarian meals',
              changeVal: _vegetarianFilter,
            ),
            SwitchFilter(
              filterSet: _veganFilterSet,
              title: 'Vegan',
              subtitle: 'Only include vegan meals',
              changeVal: _veganFilter,
            ),
          ],
        ),
      ),
    );
  }
}
