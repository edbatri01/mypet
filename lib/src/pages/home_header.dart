import 'package:flutter/material.dart';
import 'package:login_flutter/src/widgets/Actividad2.dart';
import 'package:login_flutter/src/widgets/Actividad3.dart';
import 'package:login_flutter/src/widgets/Actividad4.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Actividad4(),
    );
  }
}
