import 'package:flutter/material.dart';

/* Eeach set is 4 pomodoros */

class ProgressIcons extends StatelessWidget {
  final int total;
  final int done;

  const ProgressIcons({required this.total, required this.done});

  @override
  Widget build(BuildContext context) {
    const iconSize = 50.0;

    final doneIcon = Icon(
      Icons.beenhere,
      color: Colors.red[900],
      size: iconSize,
    );

    final notdoneIcon = Icon(
      Icons.beenhere_outlined,
      color: Colors.yellow[200],
      size: iconSize,
    );

    List<Icon> icons = [];

    for (int i = 0; i < total; i++) {
      if (i < done) {
        icons.add(doneIcon);
      } else {
        icons.add(notdoneIcon);
      }
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: icons,
      ),
    );
  }
}
