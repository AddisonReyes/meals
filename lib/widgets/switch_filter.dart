import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';

// ignore: must_be_immutable
class SwitchFilter extends StatefulWidget {
  SwitchFilter({
    super.key,
    required this.filterSet,
    required this.title,
    required this.subtitle,
    required this.onChange,
    required this.filter,
  });

  bool filterSet;
  final String title;
  final String subtitle;

  void Function(Filter filter) onChange;
  Filter filter;

  @override
  State<SwitchFilter> createState() => _SwitchFilterState();
}

class _SwitchFilterState extends State<SwitchFilter> {
  @override
  Widget build(BuildContext context) {
    // print(widget.filterSet);
    return SwitchListTile(
      value: widget.filterSet,
      onChanged: (isChecked) {
        setState(() {
          widget.filterSet = isChecked;
        });
        widget.onChange(widget.filter);
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
