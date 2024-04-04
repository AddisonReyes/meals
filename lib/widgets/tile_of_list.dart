import 'package:flutter/material.dart';

class TileOfList extends StatefulWidget {
  const TileOfList({
    super.key,
    required this.icon,
    required this.label,
    required this.onTapFunction,
  });

  final void Function() onTapFunction;
  final IconData icon;
  final String label;

  @override
  State<TileOfList> createState() => _TileOfListState();
}

class _TileOfListState extends State<TileOfList> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        widget.icon,
        size: 26,
        color: Theme.of(context).colorScheme.onBackground,
      ),
      title: Text(
        widget.label,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
              fontSize: 24,
            ),
      ),
      onTap: widget.onTapFunction,
    );
  }
}
