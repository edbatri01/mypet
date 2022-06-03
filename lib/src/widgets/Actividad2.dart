import 'package:flutter/material.dart';

class Actividad2 extends StatelessWidget {
  const Actividad2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: Lienzo(),
      ),
    );
  }
}

class Lienzo extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const textStyle = TextStyle(
      color: Colors.black,
      fontSize: 20,
    );

    const textSpan = TextSpan(
      text: 'Hola Mundo Canvas',
      style: textStyle,
    );

    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );
    final xCenter = (size.width - textPainter.width) * .5;
    final yCenter = (size.height - textPainter.height) * .08;
    final offset = Offset(xCenter, yCenter);

    final paint = Paint();
    paint.color = Colors.amber;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20;

    final path = Path();
    // path.moveTo(size.width * .5, size.height * .25);
    path.moveTo(size.width * .5, size.height * .50);
    path.lineTo(size.width, size.height * .01);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    // path.lineTo(size.width, size.height * .5);
    path.lineTo(size.width * .5, size.height * .5);

    canvas.drawPath(path, paint);
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
