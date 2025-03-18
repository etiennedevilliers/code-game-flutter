import 'package:flutter/material.dart';
import 'package:puzzle_game/code/node.dart';
import 'package:puzzle_game/code/simple/print.node.dart';
import 'package:puzzle_game/widgets/nodes/node.factory.dart';
import 'package:puzzle_game/widgets/nodes/node_header.dart';
import 'package:puzzle_game/widgets/value_pill.dart';

class PrintNodeWidget extends StatelessWidget {
  final PrintNode node;

  const PrintNodeWidget({super.key, required this.node});

  PrintNodeWidget.pallet({ Key? key}): this(
    key: key,
    node: PrintNode(value: 'message')
  );

  @override
  Widget build(BuildContext context) {
    return Draggable<Node>(
      feedback: Material(
        color: Colors.transparent,
        child: PrintNodeWidget(node: node,)
      ),
      data: node,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NodeHeader(
            title: Row(
              children: [
                Text('Print'),
                ValuePill.string(value: node.value)
              ],
            ),
            color: Colors.blue
          ),
        ],
      ),
    );
  }
}