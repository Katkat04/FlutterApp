import 'package:flutter/material.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white10,
      title: const Text("HOLA, KATY"),
      centerTitle: false,
      automaticallyImplyLeading: false, //flechaatras
      elevation: 0.0,

      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Container(
          color: Colors.black87,
          height: 0.1,
        ),
      ),

      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          iconSize: 30,
          onPressed: () {
            // Handle notifications action
          },
        ),
        IconButton(
          icon: const Icon(Icons.person_outlined),
          iconSize: 32,
          onPressed: () {
            // Handle settings action
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}