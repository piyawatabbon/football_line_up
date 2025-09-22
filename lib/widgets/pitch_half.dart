import 'package:flutter/material.dart';
import 'package:football_test/widgets/pitch_painter.dart';

import '../models/lineup.dart';
import '../utils/formation_grids.dart';
import '../widgets/player_chip.dart';

class PitchHalf extends StatelessWidget {
  final Lineup lineup;
  final bool invertY;

  const PitchHalf({super.key, required this.lineup, required this.invertY});

  @override
  Widget build(BuildContext context) {
    final grid = kFormationGrids[lineup.formationUsed];
    return LayoutBuilder(
      builder: (context, constraints) {
        final w = constraints.maxWidth;
        final h = constraints.maxHeight; // ~450px
        return Stack(children: [
          // พื้นหลังสนามเทา + เส้นหลัก ๆ
          Positioned.fill(
              child: CustomPaint(painter: PitchPainter(isBottom: false))),
          // วางผู้เล่น
          ...lineup.players.map((p) {
            final pos = grid?[p.formationPlace] ?? const Offset(0.5, 0.5);

            var playerX = pos.dx;
            var playerY = pos.dy;

            final dx = playerX.clamp(0.04, 0.96);
            final dy = playerY.clamp(0.04, 0.96);
            final left = dx * w;
            final top = dy * h;

            return Positioned(
              left: left,
              top: top,
              child: PlayerChip(
                label: p.name,
                number: p.formationPlace,
                invert: invertY,
              ),
            );
          }),
        ]);
      },
    );
  }
}
