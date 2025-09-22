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

            // คำนวณตำแหน่งให้ box อยู่ตรงกลาง
            // PlayerChip กว้าง 52px ดังนั้นต้องลบครึ่งความกว้าง (26px) ออก
            final centerX = playerX * w - 26; // ลบครึ่งความกว้าง
            final centerY = playerY * h - 24; // ลบครึ่งความสูงประมาณ

            return Positioned(
              left: centerX,
              top: centerY,
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
