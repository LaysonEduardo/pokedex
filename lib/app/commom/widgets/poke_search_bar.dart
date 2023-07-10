import 'package:flutter/material.dart';

class PokeSearchBar extends StatelessWidget implements PreferredSizeWidget {
  const PokeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Icon(
              Icons.search,
              color: Colors.grey[800],
            ),
            const Flexible(
              child: TextField(
                decoration: InputDecoration.collapsed(hintText: 'Search'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
