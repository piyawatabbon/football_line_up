import 'dart:math';

import 'package:flutter/material.dart';

class PlayerChip extends StatelessWidget {
  final String label;
  final int number;
  final bool invert;

  const PlayerChip(
      {super.key,
      required this.label,
      required this.number,
      required this.invert});

  @override
  Widget build(BuildContext context) {
    return invert
        ? Transform.rotate(
            angle: pi,
            child: SizedBox(
              // color: Colors.red,
              width: 52,
              height: 48,
              child: Column(
                children: [
                  Container(
                    width: 28,
                    height: 28,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black26, width: 1),
                    ),
                    child: Text(
                      '$number',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 11, color: Colors.white),
                  ),
                ],
              ),
            ))
        : SizedBox(
            // color: Colors.blue,
            width: 52,
            height: 48,
            child: Column(
              children: [
                Container(
                  width: 28,
                  height: 28,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black26, width: 1),
                  ),
                  child: Text(
                    '$number',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 11, color: Colors.white),
                ),
              ],
            ),
          );
  }
}
