import 'package:flutter/material.dart';

class NodeHeader extends StatelessWidget {
  final Color color;
  final Widget title;
  final double? width;

  const NodeHeader({
    super.key,
    required this.title,
    required this.color,
    this.width
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: title,
      ),
    );
  }
}