import 'package:flutter/material.dart';

class NavbarWidget extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const NavbarWidget({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: selectedIndex,
      onTap: onItemTapped,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        BottomNavigationBarItem(icon: Icon(Icons.language), label: 'Discover'),
        BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: 'Library'),
      ],
    );
  }
}
