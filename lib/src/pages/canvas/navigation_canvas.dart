import 'package:flutter/material.dart';

class _CustomPainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path = Path();
    path.moveTo(0, size.height * 0.1128000);
    path.quadraticBezierTo(
      size.width * 0.0902041,
      size.height * -0.0123000,
      size.width * 0.1633929,
      size.height * 0.0103000,
    );
    path.cubicTo(
        size.width * 0.2879847,
        size.height * -0.0231000,
        size.width * 0.2751786,
        size.height * 0.2655000,
        size.width * 0.5131633,
        size.height * 0.2771000);
    path.cubicTo(
        size.width * 0.6660204,
        size.height * 0.2665000,
        size.width * 0.6857398,
        size.height * 0.2169000,
        size.width * 0.7969133,
        size.height * 0.0897000);
    path.quadraticBezierTo(
      size.width * 0.8737500,
      size.height * -0.0645000,
      size.width * 0.9985969,
      size.height * 0.0723000,
    );
    path.lineTo(size.width * 0.9985969, size.height * 1.0058000);
    path.lineTo(size.width * -0.0014031, size.height * 1.0058000);
    path.lineTo(0, size.height * 0.1128000);
    path.close();
    canvas.drawPath(path, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }}