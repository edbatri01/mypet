import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_flutter/src/pages/home/home.dart';
import 'package:login_flutter/src/pages/login.dart';
// import 'package:login_flutter/src/pages/home_header.dart';
// import 'package:login_flutter/src/pages/login.dart';
// import 'package:login_flutter/src/pages/loginSesion.dart';
// import 'package:login_flutter/src/pages/progress_view.dart';
// import 'package:login_flutter/src/pages/recovery.dart';
// import 'package:login_flutter/src/pages/register.dart';
import 'package:login_flutter/src/splash/splash_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive,
    overlays: [SystemUiOverlay.top]);
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      
      home: LoginPage(),
      
    );
  }
}
