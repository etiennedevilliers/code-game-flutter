import 'package:flutter/material.dart';
import 'package:puzzle_game/code/flow/loop.node.dart';
import 'package:puzzle_game/code/node.dart';
import 'package:puzzle_game/code/root.node.dart';
import 'package:puzzle_game/code/simple/print.node.dart';
import 'package:puzzle_game/code/simple/wait.node.dart';
import 'package:puzzle_game/widgets/drop_pill.dart';
import 'package:puzzle_game/widgets/nodes/flow/loop_node.widget.dart';
import 'package:puzzle_game/widgets/nodes/root_node.widget.dart';
import 'package:puzzle_game/widgets/nodes/simple/print_node.widget.dart';
import 'package:puzzle_game/widgets/nodes/simple/wait_node.widget.dart';

class NodeFactory {
  static Widget _pickNode(Node node) {
    switch (node) {
      case LoopNode():
        return LoopNodeWidget(node: node);
      case PrintNode():
        return PrintNodeWidget(node: node);
      case WaitNode():
        return WaitNodeWidget(node: node);
      case RootNode():
        return RootNodeWidget(node: node);
      default:
        throw UnimplementedError();
    }
  }

  static Widget build(Node node) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _pickNode(node),
        DropPill()
      ],
    );
  }

  static Widget buildList(List<Node> nodes) {
    if (nodes.isEmpty) return DropPill();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        DropPill(),
        ...nodes.map(build)
      ],
    );
  }
}