import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {

  static const name = 'snackbar';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context){
    
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackBar = SnackBar(
      content: const Text('Hola mundo'),
      action: SnackBarAction(label: 'Ok', onPressed: (){}),
      duration: const Duration(seconds: 5),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void openDialog(BuildContext context){
    showDialog(
      context: context,
      barrierDismissible: false, // Force to close by buttons.
      builder:(context) => AlertDialog(
        title: const Text('¿Estas seguro?'),
        content: const Text('Occaecat pariatur quis fugiat incididunt enim. Lorem exercitation velit cupidatat veniam. Ullamco nulla eiusmod ex exercitation.'),
        actions: [
          TextButton(onPressed: () => context.pop(), child: const Text('cancelar')),
          FilledButton(onPressed: () => context.pop(), child: const Text('Aceptar')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y diálogos'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: (){
                showAboutDialog(
                  context: context,
                  children: [
                    const Text('Enim est quis esse id cillum enim non aliquip tempor non. Voluptate dolore eiusmod ex dolore sint nulla labore incididunt. Adipisicing exercitation cillum eiusmod proident. Ut amet do incididunt est non eu sit adipisicing. Ipsum veniam minim ullamco sunt elit veniam pariatur laborum ipsum dolor do voluptate.')
                  ]
                );
              },
              child: const Text('Licencias usadas')
            ),

            FilledButton.tonal(
              onPressed: ()=> openDialog(context),
              child: const Text('Mostrar diálogo')
            )
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon( Icons.remove_red_eye_outlined),
        label: const Text('Mostrar Snackbar'),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}