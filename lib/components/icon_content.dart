import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  const IconContent({
    super.key,
    required this.label,
    required this.icon,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
          color: Colors.white,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF8D8E98),
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
