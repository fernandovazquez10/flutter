import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/router/app_router.dart';
import 'package:widgets_app/config/theme/app.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

void main() {
  
  runApp(
    const ProviderScope(
      child: MainApp()
    )
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final bool isDarkMode = ref.watch( isDarkModeProvider );
    final int selectedIndexColor = ref.watch( selectedIndexColorProvider );

    return MaterialApp.router(
      title: 'Flutter widgets',
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectColor: selectedIndexColor, isDarkMode: isDarkMode).getTheme(),
    );
  }
}
