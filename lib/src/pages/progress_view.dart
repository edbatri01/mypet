import 'package:flutter/material.dart';
import 'dart:async';
import 'package:login_flutter/src/pages/canvas/ProgressCustom.dart';
class ProgressView extends StatefulWidget {
  const ProgressView({ Key? key }) : super(key: key);

  @override
  State<ProgressView> createState() => _ProgressViewState();
}

class _ProgressViewState extends State<ProgressView>
    with SingleTickerProviderStateMixin {
  double contador = 0;
  @override
  void initState() {
  
    super.initState();
    Timer.periodic(
      const Duration(milliseconds: 20),
      (timer) {
        setState(() {
          contador++;
          if (contador == 100) {
            contador = 0;
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Center(
        child: SizedBox(
          
          width: 150,
          height: 150,
          child: CustomPaint(
            painter: ProgressCustom(contador),
          ),
        ),
      ),
    );
  }
}

