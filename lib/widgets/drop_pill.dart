import 'package:flutter/material.dart';
import 'package:puzzle_game/code/node.dart';

class DropPill extends StatefulWidget {
  final bool collapsed;

  final Node parent;

  const DropPill({super.key, this.collapsed = true, required this.parent});

  @override
  State<DropPill> createState() => _DropPillState();
}

class _DropPillState extends State<DropPill> {
  bool highlight = false;

  @override
  Widget build(BuildContext context) {
    return DragTarget(
      builder: (BuildContext context, List<dynamic> accepted, List<dynamic> rejected) {
        return  Padding(
          padding: EdgeInsets.only(
            top: highlight ? 24 : !widget.collapsed ? 8 : 0,
            bottom: highlight ? 24 : !widget.collapsed ? 8 : 0,
            left: 8.0,
            right: 8.0
          ),
          child: !highlight && widget.collapsed ? SizedBox(
            width: 80,
            height: 2,
          ) : Container(
            width: 80,
            height: 10,
            color: Colors.grey,
          ),
        );
      },
      onWillAcceptWithDetails: (data) {
        if (data.data == null) return false;
        if (data.data is! Node) return false;
        
        Node node = data.data as Node;

        if (widget.parent.getChildren().contains(node)) return false;
        if (widget.parent == node) return false;
        if (widget.parent.nextNode == node) return false;

        print('Draggable accept');
        setState(() {
          highlight = true;
        });
        return true;

      },
      onAcceptWithDetails: (data) {
        setState(() {
          highlight = false;
        });
        // This is called when a draggable is dropped.
        print('Draggable dropped: $data');
      },
      onLeave: (data) {
        setState(() {
          highlight = false;
        });
        print('Draggable left');
      },
    );
  }
}