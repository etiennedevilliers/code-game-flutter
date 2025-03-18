import 'package:flutter/material.dart';
import 'package:puzzle_game/code/root.node.dart';
import 'package:puzzle_game/widgets/nodes/node_header.dart';

class RootNodeWidget extends StatelessWidget {
  final RootNode node;

  const RootNodeWidget({
    super.key,
    required this.node
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        NodeHeader(title: Text('Root Node'), color: Colors.yellow),
      ],
    );
  }
}