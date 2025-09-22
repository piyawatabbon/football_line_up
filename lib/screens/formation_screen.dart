import 'dart:math';

import 'package:flutter/material.dart';

import '../models/lineup.dart';
import '../widgets/pitch_half.dart';

class FormationScreen extends StatefulWidget {
  const FormationScreen({super.key});

  @override
  State<FormationScreen> createState() => _FormationScreenState();
}

class _FormationScreenState extends State<FormationScreen> {
  String topFormation = '41212';
  String bottomFormation = '41212';

  final List<String> formations = [
    '442',
    '41212',
    '433',
    '451',
    '4411',
    '4141',
    '352',
    '343',
    '532',
    '3412',
    '523',
    '3421',
    '5212',
    '3142',
    '4231',
    '424',
    '4222',
    '4312',
    '4321',
    '541',
    '5221',
    '5311',
    '5131'
  ];

  @override
  Widget build(BuildContext context) {
    final sampleTop = Lineup(
      teamName: 'Team A (TOP)',
      formationUsed: topFormation,
      players: List.generate(
          11, (i) => Player(name: 'A${i + 1}', formationPlace: i + 1)),
    );
    final sampleBottom = Lineup(
      teamName: 'Team B (BOTTOM)',
      formationUsed: bottomFormation,
      players: List.generate(
          11, (i) => Player(name: 'B${i + 1}', formationPlace: i + 1)),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Football Formation Selector'),
        backgroundColor: Colors.green.shade700,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                color: Colors.grey.shade100,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Team A Formation:',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          DropdownButton<String>(
                            value: topFormation,
                            isExpanded: true,
                            onChanged: (String? newValue) {
                              setState(() {
                                topFormation = newValue!;
                              });
                            },
                            items: formations
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Team B Formation:',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          DropdownButton<String>(
                            value: bottomFormation,
                            isExpanded: true,
                            onChanged: (String? newValue) {
                              setState(() {
                                bottomFormation = newValue!;
                              });
                            },
                            items: formations
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                child: SizedBox(
                  height: 500,
                  child: Column(
                    children: [
                      Expanded(
                        child: PitchHalf(
                          lineup: sampleTop,
                          invertY: false,
                        ),
                      ),
                      Expanded(
                        child: Transform.rotate(
                          angle: pi,
                          child: PitchHalf(
                            lineup: sampleBottom,
                            invertY: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
