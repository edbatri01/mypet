// ignore_for_file: deprecated_member_use

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:login_flutter/src/pages/loginSesion.dart';
import 'package:login_flutter/src/pages/register.dart';
import 'package:login_flutter/src/styles/colors/colors_views.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 70, right: 24, left: 24, bottom: 50),
              child: Image.asset(
                'assets/images/splash.png',
                height: 150.0,
              ),
            ),

            Container(
              //alignment: Alignment.center,
              width: 300,
              height: 48,
              decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(40)),
              color:  Color.fromRGBO(49, 105, 245, 1),
              ),
              child: TextButton(
                onPressed: () {  },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.g_mobiledata_outlined, color: Colors.white),
                    Text('  Continuar con Google', style: TextStyle(fontSize:16, color:Colors.white))
                  ],
                ),

                
                
              ),
                
            ),

            Container(
              //alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 20),
              width: 300,
              height: 48,
              decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(40)),
              color:  Color.fromRGBO(50, 79, 165, 1.0),
              ),
              child: TextButton(
                onPressed: () {  },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.facebook, color: Colors.white),
                    Text('  Continuar con Facebook', style: TextStyle(fontSize:16, color:Colors.white))
                  ],
                ),

                
                
              ),
                
            ),

            Container(
              //alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 35),
              width: 300,
              height: 48,
              decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(40)),
              ),
              child: FlatButton(
                onPressed: () { 
                  Navigator.push(context, MaterialPageRoute(builder: ((context) => const Register())));
                },
                shape: const RoundedRectangleBorder(side:BorderSide(
                  color: Color.fromRGBO(100, 104, 111, 1)
                ), borderRadius:BorderRadius.all(Radius.circular(40))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.email, color: Color.fromRGBO(100, 104, 111, 1)),
                    Text('  Registrarse con e-mail', style: TextStyle(fontSize:16, color: Color.fromRGBO(100, 104, 111, 1)))
                  ],
                ),

                
                
              ),
                
            ),

            Container(
              margin: const EdgeInsets.only(top: 30),
              width: 300,
              height: 33,
              //color: Colors.amberAccent,
              child: TextButton(
                onPressed: () {  },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.g_mobiledata_outlined, color: Colors.white),
                    Text('Entrar como invitado', style: TextStyle(fontSize:16, color:ColorSelect.paginatorNext))
                  ],
                ),

              ),
                
            ),

            Container(
              margin: const EdgeInsets.only(bottom: 10),
              width: 300,
              height: 33,
              child: TextButton(
                onPressed: () {  },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.g_mobiledata_outlined, color: Colors.white),
                    Text('Entrar como vendedor', style: TextStyle(fontSize:16, color:ColorSelect.btnBackgroundBo2))
                  ],
                ),

                
                
              ),
                
            ),
            
          ],
        ),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.only(bottom: 10, top: 20),
          width: 300,
          height: 90,
          child: Column(
            
            children: [
              // TextButton(
              //   onPressed: () {  },
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: const [
              //       Text('  Entrar como invitado', style: TextStyle(fontSize:14, color: ColorSelect.paginatorNext))
              //     ],
              //   ),

                
                
              // ),
                  
              

              // TextButton(
              //   onPressed: () {  },
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: const [
              //       Text('  Entrar como vendedor', style: TextStyle(fontSize:14, color: ColorSelect.btnBackgroundBo2))
              //     ],
              //   ),

                
                
              // ),

              Container(
                alignment: Alignment.center,
                height: 35,
                child: RichText(text: TextSpan(
                  children: [
                    const TextSpan(
                      text: '¿Ya tienes cuenta? ',
                      style: TextStyle(fontSize: 16,color: ColorSelect.txtGreyTitle)
                    ),
                    TextSpan(
                      text: 'Iniciar sesión',
                      style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: ColorSelect.paginatorNext),
                      recognizer: TapGestureRecognizer()
                      ..onTap = () => Navigator.push(context, MaterialPageRoute(builder: ((context) => const LoginSesion())))
                    )
                  ]
                )),
                
              ),  
            ],
          ),
        ),
      );
  }
}