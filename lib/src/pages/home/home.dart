import 'package:flutter/material.dart';
import 'package:login_flutter/src/pages/home/pieces/body.dart';
import 'package:login_flutter/src/pages/login.dart';
import 'package:login_flutter/src/styles/colors/colors_views.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
        backgroundColor: ColorSelect.btnBackgroundBo2,
        automaticallyImplyLeading: false,
        toolbarHeight: 48,
        actions: [
          Container(
            width: 100,
            child: Image.asset(
              'assets/images/splash.png',
              color: Colors.white,
            ),
            color: Colors.transparent,
          )
        ],
      ),
      backgroundColor: ColorSelect.btnBackgroundBo1,
      body: const BodyHome(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
            
            setState(() {
              if(index == 2){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>const LoginPage()));
              }
            });
          },
        selectedItemColor: Colors.white,
        currentIndex: 1,
        iconSize: 30,
        backgroundColor: ColorSelect.btnBackgroundBo2,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.cancel), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.logout_outlined), label: 'Cerrar sesión'),
        ],
      ),
    );
  }
}