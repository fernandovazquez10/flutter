import 'package:flutter/material.dart';


class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BLoC counter'),
        actions: [
          IconButton(
            onPressed: (){},
            icon: const Icon( Icons.refresh_outlined )
          )
        ],
      ),
      body: const Center(
        child: Text('Conter value: x'),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: '1',
            child: const Text('+1'),
            onPressed: (){}
          ),

          const SizedBox(height: 10),

          FloatingActionButton(
            heroTag: '2',
            child: const Text('+2'),
            onPressed: (){}
          ),

          const SizedBox(height: 10),

          FloatingActionButton(
            heroTag: '3',
            child: const Text('+3'),
            onPressed: (){}
          )
        ]
      ),
    );
  }
}
