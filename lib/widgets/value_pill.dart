import 'package:flutter/material.dart';

class ValuePill extends StatelessWidget {
  final String value;

  const ValuePill._({super.key, required this.value});

  const ValuePill.string({
    Key? key,
    required String value,
  }): this._(
    key: key,
    value: value
  );

  const ValuePill.int({
    Key? key,
    required int value,
  }): this._(
    key: key,
    value: '$value'
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:8.0, right: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Padding(
          padding: EdgeInsets.all(4.0),
          child: Text(value),
        ),
      ),
    );
  }
}