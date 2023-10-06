import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomButtonNavigation extends StatelessWidget {

  final int currentIndex;

  const CustomButtonNavigation({
    super.key,
    required this.currentIndex,
  });

  void onItemTapped( BuildContext context, int index){
    context.go('/home/$index');
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) => onItemTapped(context, index),
      elevation: 0,
      items: const [
        BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(Icons.home_max)
        ),

        BottomNavigationBarItem(
          label: 'Trending',
          icon: Icon(Icons.trending_up_sharp)
        ),

        BottomNavigationBarItem(
          label: 'Favorites',
          icon: Icon(Icons.favorite_outline)
        ),
      ]
    );
  }
}
