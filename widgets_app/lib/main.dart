import 'package:flutter/material.dart';
import 'package:widgets_app/config/presentation/screens/buttons/buttons.dart';
import 'package:widgets_app/config/presentation/screens/cards/cards.dart';
import 'package:widgets_app/config/presentation/screens/home/home.dart';
import 'package:widgets_app/config/theme/app.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectColor: 5).getTheme(),
      home: const HomeScreen(),
      routes: {
        '/buttons':(context) => const ButtonsScreen(),
        '/cards': (context) => const CardsScreen(),
      },
    );
  }
}
