import 'package:flutter/material.dart';
import 'package:hello_word_app/presentation/screens/counter/counter_functions_screen.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color.fromARGB(206, 119, 26, 69),
      ),
      home: const CounterFunctionsScreen()
    );
  }

}
