import 'package:flutter/material.dart';

class Status extends StatelessWidget {
  final Color color;
  final String status;

  const Status({
    super.key,
    required this.color,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.fiber_manual_record,
          size: 16,
          color: color,
        ),
        Text(status)
      ],
    );
  }
}
