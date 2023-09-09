import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app.dart';

// Color list inmutable
final colorListProvider = Provider((ref) => colorList);

// A simple bool
final isDarkModeProvider = StateProvider<bool>((ref) => false);

// A simple int
final selectedIndexColorProvider = StateProvider((ref) => 0);

// A object type AppTheme (custom)
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
);


class ThemeNotifier extends StateNotifier<AppTheme> {

  // state = ESTADO = new AppTheme()
  ThemeNotifier(): super( AppTheme() );

  void toggleDarkmode(){
    state = state.copyWith(isDarkMode: !state.isDarkMode);  
  }

  void changeColorIndex(int colorIndex){
    state = state.copyWith(selectColor: colorIndex);
  }

}

