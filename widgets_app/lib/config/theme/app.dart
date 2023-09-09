import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.deepPurple,
  Colors.orange,
  Colors.pink,
  Colors.pinkAccent,
];

class AppTheme{
  final int selectColor;
  final bool isDarkMode;

  AppTheme({
    this.selectColor = 0,
    this.isDarkMode = false,
  }): assert( selectColor >= 0 , 'Selected color must be greater than 0' ),
      assert( selectColor < colorList.length , 'Selected color must be greater than ${colorList.length - 1}');


  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    brightness: isDarkMode ? Brightness.dark : Brightness.light,
    colorSchemeSeed: colorList[ selectColor ],
    appBarTheme: const AppBarTheme(
      centerTitle: false,
    ),
    dividerColor: Colors.transparent,
  );

  AppTheme copyWith({
    int? selectColor,
    bool? isDarkMode,
  }) => AppTheme(
    selectColor: selectColor ?? this.selectColor,
    isDarkMode: isDarkMode ?? this.isDarkMode,
  );

}