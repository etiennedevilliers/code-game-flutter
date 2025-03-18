import 'package:flutter/material.dart';
import 'package:puzzle_game/code/flow/loop.node.dart';
import 'package:puzzle_game/code/node.dart';
import 'package:puzzle_game/code/root.node.dart';
import 'package:puzzle_game/widgets/nodes/node.factory.dart';
import 'package:puzzle_game/widgets/nodes/node_header.dart';

class LoopNodeWidget extends StatelessWidget {
  final LoopNode node;

  const LoopNodeWidget({super.key, required this.node});

  LoopNodeWidget.pallet({Key? key}): this(
    key: key,
    node: LoopNode()
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NodeHeader(
          title: Text('Loop'),
          color: Colors.orange,
          width: 70,
        ),
        IntrinsicHeight(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 10,
                color: Colors.orange,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 1),
                child: NodeFactory.buildRootNode(RootNode(
                  nextNode: node.child
                )),
              ),
            ],
          ),
        ),
        Container(
          color: Colors.orange,
          width: 70,
          height: 30,
        ),
      ],
    );
  }
}