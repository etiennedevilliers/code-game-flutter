import 'package:flutter/material.dart';
import 'package:puzzle_game/code/flow/loop.node.dart';
import 'package:puzzle_game/code/root.node.dart';
import 'package:puzzle_game/code/simple/print.node.dart';
import 'package:puzzle_game/code/simple/wait.node.dart';
import 'package:puzzle_game/widgets/node_pallet.dart';
import 'package:puzzle_game/widgets/nodes/node.factory.dart';

class CodeWindow extends StatelessWidget {
  const CodeWindow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SingleChildScrollView(
          child: NodePallet(),
        ),
        Container(
          color: Colors.grey,
          width: 4,
          height: double.infinity,
        ),
        SingleChildScrollView(
          child: NodeFactory.buildRootNode(RootNode(
            nextNode: LoopNode(
              child: PrintNode(
                value: 'Hello World',
                nextNode: WaitNode(time: 100)
              ),
              nextNode: PrintNode(value: 'This will never run')
            ),
          )),
        ),
      ],
    );
  }
}