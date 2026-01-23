import 'package:flutter/material.dart';
import 'package:rick_and_morty/views/home/home_screen.dart';
import 'package:rick_and_morty/views/settings/settings_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  List<Widget> get listOfScreens => [
    CharacterListScreen(),
    const Center(child: Text('Search Screen')),
    const Center(child: Text('Settings Screen')),
    const Center(child: Text('Profile Screen')),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rick and Morty'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return SettingsScreen();
                  },
                ),
              );
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),

      body: listOfScreens[0],
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.search), label: 'Search'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
