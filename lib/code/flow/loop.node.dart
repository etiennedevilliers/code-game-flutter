import 'package:puzzle_game/code/node.dart';

class LoopNode extends Node {
  final Node? child;

  LoopNode({ this.child, super.nextNode });
}
