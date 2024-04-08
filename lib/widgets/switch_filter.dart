import 'package:meals/providers/filters_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SwitchFilter extends ConsumerStatefulWidget {
  SwitchFilter({
    super.key,
    required this.filterSet,
    required this.title,
    required this.subtitle,
    required this.filter,
  });

  bool filterSet;
  final String title;
  final String subtitle;
  final Filter filter;

  @override
  ConsumerState<SwitchFilter> createState() => _SwitchFilterState();
}

class _SwitchFilterState extends ConsumerState<SwitchFilter> {
  @override
  Widget build(BuildContext context) {
    // print(widget.filterSet);
    return SwitchListTile(
      value: widget.filterSet,
      onChanged: (isChecked) {
        setState(() {
          widget.filterSet = isChecked;

          ref
              .read(filtersProvider.notifier)
              .setFilter(widget.filter, widget.filterSet);
        });
      },
      title: Text(
        widget.title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      subtitle: Text(
        widget.subtitle,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 34, right: 22),
    );
  }
}
