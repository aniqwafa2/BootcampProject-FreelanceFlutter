import 'package:flutter/material.dart';

class RoundedImage extends StatelessWidget {
  final ImageProvider? image;
  final double size;

  const RoundedImage({
    super.key,
    this.size = 40,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: CircleAvatar(backgroundImage: image),
    );
  }
}
