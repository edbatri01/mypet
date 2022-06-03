import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;

//Vistas
import 'package:login_flutter/src/pages/on_boarding.dart';
import 'package:login_flutter/src/styles/colors/colors_views.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  ui.Image? image;

  @override
  void initState() {
    super.initState();
    _loadImage('assets/images/splash.png');
    _toOnboarding();
  }

  _loadImage(String path) async {
    final data = await rootBundle.load(path);
    final bytes = data.buffer.asUint8List();
    final image = await decodeImageFromList(bytes);

    setState(() => this.image = image);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: CustomPaint(
            painter: _SplashCanvas(image),
          ),
        ),
      ),
    );
  }

  _toOnboarding() async {
    await Future.delayed(const Duration(milliseconds: 5000), () {});
    
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const OnBoarding(),
      ),
    );
  }
}

class _SplashCanvas extends CustomPainter {
  final ui.Image? imageCanvas;
  const _SplashCanvas(this.imageCanvas);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = ColorSelect.btnBackgroundBo2;
    paint.style = PaintingStyle.fill;
    // paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 5;

    final path = Path();
    final path2 = Path();

    //ARRIBA
    //son 3 lineas
    path.lineTo(0, size.height * .08);
    path.quadraticBezierTo(
      size.width * .22, //izq
      size.height * .15, //inmedio der
      size.width * .35, //inmedio izq
      size.height * .09, //der
    );
    // path.lineTo(size.width, 0);
    path.quadraticBezierTo(
      size.width * .5,
      size.height * -.001,
      size.width *0.79,
      size.height * .07,
    );

    path.quadraticBezierTo(
      size.width, 
      size.height * .11, 
      size.height * 0.60, 
      size.width * 0.09, 
    );
    // izq,centro,der
    path.lineTo(size.width, 0);

    //ABAJO
    path2.lineTo(0, size.height);

    path2.quadraticBezierTo(
      size.width * .77,
      size.height * .8,
      size.width,
      size.height,
    );
    path2.lineTo(0, size.height);

    canvas.drawPath(path, paint);
    canvas.drawPath(path2, paint);

    canvas.scale(.24, .24);

    canvas.drawImage(imageCanvas!, const Offset(190 * 2.5, 430 * 3.0), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
