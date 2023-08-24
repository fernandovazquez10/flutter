import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {

  static const name = 'buttons';

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),
      ),
      body: _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon( Icons.arrow_back_ios_new_rounded ),
        onPressed: (){
          context.pop();
        },
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10, 
          vertical: 20
        ),
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 10,
          children: [
            ElevatedButton(
              onPressed: (){},
              child: const Text('Elevated')
            ),

            const ElevatedButton(
              onPressed: null,
              child: Text('Elevated disabled')
            ),

            ElevatedButton.icon(
              onPressed: (){},
              icon: const Icon(Icons.access_alarms_rounded),
              label: const Text('Elevated icon')
            ),
          
            FilledButton(
              onPressed: (){},
              child: const Text('Filled')
            ),

            FilledButton.icon(
              onPressed: (){},
              icon: const Icon(Icons.ads_click_outlined),
              label: const Text('Filled icon')
            ),

            OutlinedButton(
              onPressed: (){},
              child: const Text('Outline')
            ),

            OutlinedButton.icon(
              onPressed: (){},
              icon: const Icon(Icons.terminal),
              label: const Text('Outline icon')
            ),

            TextButton(
              onPressed: (){},
              child: const Text('Text')
            ),

            TextButton.icon(
              onPressed: (){},
              icon: const Icon(Icons.telegram_sharp),
              label: const Text('Text icon')
            ),

            const CustomButton(),
            
            IconButton(
              onPressed: (){},
              icon: const Icon(Icons.burst_mode_rounded)
            ),
            
            IconButton(
              onPressed: (){},
              icon: const Icon(Icons.burst_mode_rounded),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(colors.primary),
                iconColor: const MaterialStatePropertyAll(Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}



class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: (){},
          child: const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Text(
              'Hola mundo',
              style: TextStyle(color: Colors.white)
            )
          ),
        ),
      ),
    );
  }
}

