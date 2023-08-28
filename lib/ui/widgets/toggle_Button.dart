
import 'package:flutter/material.dart';

class ToggleButton extends StatelessWidget {
  final String text;
  final bool isActive;
  final VoidCallback onTap;

  const ToggleButton({
    Key? key,
    required this.text,
    required this.isActive,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: isActive ? Colors.white : Colors.teal.shade300,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            color: isActive ? Colors.black : Colors.black,
            fontWeight:isActive? FontWeight.w600:FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
