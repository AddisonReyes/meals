import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/widgets/switch_filter.dart';

// ignore: must_be_immutable
class FiltersScreen extends StatefulWidget {
  FiltersScreen({
    super.key,
    required this.filters,
    required this.updateFilters,
  });

  void Function(Map<Filter, bool>) updateFilters;
  Map<Filter, bool> filters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  void _changeFilterSet(Filter filter) {
    setState(() {
      widget.filters[filter] = !widget.filters[filter]!;
    });
    widget.updateFilters(widget.filters);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      // drawer: MainDrawer(onSelectScreen: _setScreen),
      body: Column(
        children: [
          SwitchFilter(
            filterSet: widget.filters[Filter.glutenFree] as bool,
            title: 'Gluten-free',
            subtitle: 'Only include gluten-free meals',
            onChange: _changeFilterSet,
            filter: Filter.glutenFree,
          ),
          SwitchFilter(
            filterSet: widget.filters[Filter.lactoseFree] as bool,
            title: 'Lactose-free',
            subtitle: 'Only include lactose-free meals',
            onChange: _changeFilterSet,
            filter: Filter.lactoseFree,
          ),
          SwitchFilter(
            filterSet: widget.filters[Filter.vegetarian] as bool,
            title: 'Vegetarian',
            subtitle: 'Only include vegetarian meals',
            onChange: _changeFilterSet,
            filter: Filter.vegetarian,
          ),
          SwitchFilter(
            filterSet: widget.filters[Filter.vegan] as bool,
            title: 'Vegan',
            subtitle: 'Only include vegan meals',
            onChange: _changeFilterSet,
            filter: Filter.vegan,
          ),
        ],
      ),
    );
  }
}

// void _setScreen(String identinfier) {
//   Navigator.of(context).pop();
//   if (identinfier == 'meals') {
//     Navigator.of(context)
//         .push(MaterialPageRoute(builder: (ctx) => const TabsScreen()));
//   }
// }
