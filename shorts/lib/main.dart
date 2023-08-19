import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shorts/config/theme/app.dart';
import 'package:shorts/presentation/screens/discover/discover.dart';
import 'package:shorts/providers/discover.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DiscoverProvider())
      ],
      child: MaterialApp(
        title: 'Shorts',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        home: const DiscoverScreen(),
      ),
    );
  }
}