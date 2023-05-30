import 'package:flutter/material.dart';

class RoundedDetailCardExpanded extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final Widget child;

  const RoundedDetailCardExpanded({
    super.key,
    this.padding = const EdgeInsets.fromLTRB(15, 15, 20, 20),
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          width: double.infinity,
          padding: padding,
          decoration: BoxDecoration(
            border: Border.all(color: const Color.fromARGB(51, 0, 0, 0)),
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(62, 0, 0, 0),
                offset: Offset(0, 4),
                blurRadius: 2,
              ),
            ],
          ),
          child: child),
    );
  }
}
