import 'package:flutter/material.dart';
import 'package:freelance/utils/app_styles.dart';

class RoundedCard extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final double? height;

  const RoundedCard({
    super.key,
    this.height,
    this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: cardBorder),
        child: InkWell(
          borderRadius: cardBorder,
          onTap: onTap,
          child: Container(
            height: height,
            padding: const EdgeInsets.fromLTRB(10, 15, 10, 12),
            child: child,
          ),
        ));
  }
}
