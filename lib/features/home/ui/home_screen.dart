import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum HomeTabs {
  map(Icons.map_rounded, 'Карта', '/map'),
  settings(Icons.settings_rounded, 'Настройки', '/settings');

  final IconData icon;
  final String label;
  final String location;

  const HomeTabs(this.icon, this.label, this.location);
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({required this.shell, super.key});
  final StatefulNavigationShell shell;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.shell,
      bottomNavigationBar: _HomeBottomNavigationBar(
        currentIndex: widget.shell.currentIndex,
      ),
    );
  }
}

class _HomeBottomNavigationBar extends StatelessWidget {
  const _HomeBottomNavigationBar({
    super.key,
    required this.currentIndex,
  });

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        context.go(HomeTabs.values[index].location);
      },
      items: HomeTabs.values
          .map(
            (tab) => BottomNavigationBarItem(
              icon: Icon(tab.icon),
              label: tab.label,
            ),
          )
          .toList(),
    );
  }
}
