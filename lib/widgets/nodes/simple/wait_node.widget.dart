import 'package:flutter/material.dart';
import 'package:puzzle_game/code/node.dart';
import 'package:puzzle_game/code/simple/wait.node.dart';
import 'package:puzzle_game/widgets/nodes/node.factory.dart';
import 'package:puzzle_game/widgets/nodes/node_header.dart';
import 'package:puzzle_game/widgets/value_pill.dart';

class WaitNodeWidget extends StatelessWidget {
  final WaitNode node;

  const WaitNodeWidget({super.key, required this.node});

  WaitNodeWidget.pallet({Key? key}): this(
    key: key,
    node: WaitNode(time: 1000)
  ); 

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        NodeHeader(
          title: Row(
            children: [
              Text('Wait'),
              ValuePill.int(value: node.time)
            ],
          ),
          color: Colors.blue
        ),
      ],
    );
  }
}