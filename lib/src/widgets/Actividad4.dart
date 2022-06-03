import 'package:flutter/material.dart';

class Actividad4 extends StatelessWidget {
  const Actividad4({Key? key}) : super(key: key);

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
      fontSize: 12,
    );

    const textSpan = TextSpan(
      text: 'Hola Mundo Canvas',
      style: textStyle,
    );
    //Izquierda
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    //Derecha
    final textPainter2 = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    //Izquierda
    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );
    //Derecha
    textPainter2.layout(
      minWidth: 0,
      maxWidth: size.width,
    );
    //Izquierda
    final xCenter = (size.width - textPainter.width) * .15;
    final yCenter = (size.height - textPainter.height) * .04;
    final offset = Offset(xCenter, yCenter);
    //Derecha
    final xCenter2 = (size.width - textPainter.width) * .85;
    final yCenter2 = (size.height - textPainter.height) * .04;
    final offset2 = Offset(xCenter2, yCenter2);

    final paint = Paint();
    paint.color = Colors.amber;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20;

    final path = Path();
    //Derecha
    path.moveTo(size.width * .75, size.height * .15);
    path.lineTo(size.width, size.height * .01);
    path.lineTo(size.width, 0);
    path.lineTo(size.width * .5, 0);
    //Izquierda
    path.moveTo(size.width * .25, size.height * .15);
    path.lineTo(size.width, size.height * -.30);
    path.lineTo(size.width, 0);
    path.lineTo(size.width * -.01, 0);

    canvas.drawPath(path, paint);
    textPainter.paint(canvas, offset);
    textPainter2.paint(canvas, offset2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
