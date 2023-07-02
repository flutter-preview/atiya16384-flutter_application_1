import 'package:flutter/material.dart';

class ButtonTab extends StatelessWidget {
  final Function()? onTap;
  final String label;
  ButtonTab({super.key, required this.onTap, required this.label});

//need to add the alignment to be at the top right of the tab
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // size:
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 5,
        ),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 244, 92, 201),
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
