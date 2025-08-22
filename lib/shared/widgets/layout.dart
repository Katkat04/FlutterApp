import 'package:flutter/material.dart';
import 'package:hello_world/shared/widgets/header.dart';

class MainLayout extends StatelessWidget {
  final Widget child;

  const MainLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(),
      body: child,
      bottomNavigationBar: Container(
        color: Colors.indigo,
        padding: const EdgeInsets.all(16),
        child: const Text(
          '© 2025 Mi App',
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
