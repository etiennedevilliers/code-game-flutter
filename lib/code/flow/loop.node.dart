import 'package:puzzle_game/code/node.dart';

class LoopNode extends Node {
  final Node? child;

  LoopNode({ this.child, super.nextNode });

  @override
  List<Node> getChildren() {
    if (child == null) {
      return super.getChildren();
    } else {
      return [
        ...super.getChildren(),
        ...child!.getChildren(),
        child!
      ];
    }
  }
}
