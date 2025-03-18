import 'package:flutter/material.dart';

class ViewPort extends StatelessWidget {
  const ViewPort({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ViewPortPainter(),
    );
  }
}

class ViewPortPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    drawBackGround(canvas, size);
  }

  void drawBackGround(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black;

    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);
  }

  @override
  bool shouldRepaint(covariant ViewPortPainter oldDelegate) {
    return false;
  }

}