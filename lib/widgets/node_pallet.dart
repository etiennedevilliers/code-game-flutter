import 'package:flutter/material.dart';
import 'package:puzzle_game/code/flow/loop.node.dart';
import 'package:puzzle_game/code/node.dart';
import 'package:puzzle_game/widgets/nodes/flow/loop_node.widget.dart';
import 'package:puzzle_game/widgets/nodes/simple/print_node.widget.dart';
import 'package:puzzle_game/widgets/nodes/simple/wait_node.widget.dart';

class NodePallet extends StatelessWidget {
  const NodePallet({super.key});


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        LoopNodeWidget.pallet(),
        PrintNodeWidget.pallet(),
        WaitNodeWidget.pallet(),
      ],
    );
  }
}