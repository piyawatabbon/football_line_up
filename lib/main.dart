import 'package:flutter/material.dart';
import 'screens/formation_screen.dart';

void main() => runApp(const FormationApp());

class FormationApp extends StatelessWidget {
  const FormationApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const FormationScreen(),
      theme: ThemeData(useMaterial3: true),
    );
  }
}
