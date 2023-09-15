import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomButtonNavigation extends StatelessWidget {
  const CustomButtonNavigation({super.key});

  int getCurrentIndex( BuildContext context ){
    final String location = GoRouterState.of(context).matchedLocation;

    switch(location){
      case '/':
        return 0;
      case '/categories':
        return 1;
      case '/favorites':
        return 2;

      default: 
        return 0;
    }
  }

  void onItemTapped( BuildContext context, int index ){
    switch(index) {
      case 0:
        context.go('/');
      break;
      case 1: 
        context.go('/');
      break;
      case 2:
        context.go('/favorites');
      break;

    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      currentIndex: getCurrentIndex(context),
      onTap: (value) => onItemTapped(context, value),
      items: const [
        BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(Icons.home_max)
        ),

        BottomNavigationBarItem(
          label: 'Categories',
          icon: Icon(Icons.label_outline)
        ),

        BottomNavigationBarItem(
          label: 'Favorites',
          icon: Icon(Icons.favorite_outline)
        ),
      ]
    );
  }
}
