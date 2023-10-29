import 'package:flutter/material.dart';

import 'package:forms_app/domain/router/app_router.dart';
import 'package:forms_app/domain/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme().getTheme(),
      routerConfig: appRouter,
    );
  }
}
