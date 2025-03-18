import 'package:puzzle_game/code/node.dart';

class PrintNode extends Node {
  final String value;

  PrintNode({ required this.value, super.nextNode });
}