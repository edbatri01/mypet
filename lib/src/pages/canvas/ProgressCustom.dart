import 'package:flutter/material.dart';
import 'dart:math' as math;


class ProgressCustom extends CustomPainter{
  double carga = 0;
  ProgressCustom(this.carga);
  
  @override
  void paint(Canvas canvas, Size size) {
    double startAngle = -math.pi /2;
    double sweepAngle = (math.pi *2 * carga) / 100;
    final paint = Paint();
    final paint2 = Paint();
    paint.color = Colors.indigoAccent;
    paint.style = PaintingStyle.stroke;
    paint2.strokeWidth = 8;
    paint2.color = Colors.red;
    paint2.style = PaintingStyle.stroke;
    paint.strokeWidth = 6;
    canvas.drawCircle(Offset(size.width * 0.48, size.height * 0.48), size.height * 0.50, paint);
    canvas.drawArc(Rect.fromCircle(center: Offset(size.width * 0.48, size.height * 0.48), radius: size.height * 0.50), startAngle, sweepAngle, false, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }  
}