import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SwitchFilter extends StatefulWidget {
  SwitchFilter({
    super.key,
    required this.filterSet,
    required this.title,
    required this.subtitle,
    required this.changeVal,
  });

  bool filterSet;
  final String title;
  final String subtitle;

  void Function() changeVal;

  @override
  State<SwitchFilter> createState() => _SwitchFilterState();
}

class _SwitchFilterState extends State<SwitchFilter> {
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: widget.filterSet,
      onChanged: (isChecked) {
        setState(() {
          widget.filterSet = isChecked;
        });
        widget.changeVal();
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
