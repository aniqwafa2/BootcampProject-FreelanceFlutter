import 'package:flutter/material.dart';
import 'package:freelance/utils/app_styles.dart';

class RoundedButton extends StatelessWidget {
  final String title;
  final double width;
  final double height;
  final VoidCallback onTap;

  const RoundedButton({
    super.key,
    this.width = 80,
    this.height = 35,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 25, 167, 206),
          borderRadius: buttonBorder,
        ),
        child: InkWell(
          borderRadius: buttonBorder,
          onTap: onTap,
          child: Center(
            child: Text(
              title,
            ),
          ),
        ),
      ),
    );
  }
}
