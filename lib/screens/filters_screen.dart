import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/filters_providers.dart';
import 'package:meals/widgets/switch_filter.dart';

// ignore: must_be_immutable
class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({
    super.key,
  });

  @override
  ConsumerState<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends ConsumerState<FiltersScreen> {
  @override
  Widget build(BuildContext context) {
    final filters = ref.watch(filtersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      // drawer: MainDrawer(onSelectScreen: _setScreen),
      body: Column(
        children: [
          SwitchFilter(
            filterSet: filters[Filter.glutenFree]!,
            title: 'Gluten-free',
            subtitle: 'Only include gluten-free meals',
            filter: Filter.glutenFree,
          ),
          SwitchFilter(
            filterSet: filters[Filter.lactoseFree]!,
            title: 'Lactose-free',
            subtitle: 'Only include lactose-free meals',
            filter: Filter.lactoseFree,
          ),
          SwitchFilter(
            filterSet: filters[Filter.vegetarian]!,
            title: 'Vegetarian',
            subtitle: 'Only include vegetarian meals',
            filter: Filter.vegetarian,
          ),
          SwitchFilter(
            filterSet: filters[Filter.vegan]!,
            title: 'Vegan',
            subtitle: 'Only include vegan meals',
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
