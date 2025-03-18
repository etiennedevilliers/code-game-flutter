import 'package:flutter/material.dart';
import 'package:puzzle_game/widgets/actions.dart';
import 'package:puzzle_game/widgets/code_window.dart';
import 'package:puzzle_game/widgets/view_port.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: CodeWindow()
          ),
          Container(
            color: Colors.grey,
            width: 4,
            height: double.infinity,
          ),
          Column(
            children: [
              SizedBox(
                height: 50,
                width: 200,
                child: ActionPanel(),
              ),
              SizedBox(
                width: 200,
                height: 200,
                child: ViewPort(),
              ),
            ],
          )
        ],
      ),
    );
  }
}