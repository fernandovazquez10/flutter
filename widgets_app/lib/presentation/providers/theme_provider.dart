import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app.dart';

// Color list inmutable
final colorListProvider = Provider((ref) => colorList);

// A simple bool
final isDarkModeProvider = StateProvider<bool>((ref) => false);

// A simple int
final selectedIndexColorProvider = StateProvider((ref) => 0);