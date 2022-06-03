import 'package:flutter/material.dart';
import 'package:login_flutter/src/pages/login.dart';
import 'package:login_flutter/src/styles/colors/colors_views.dart';


class Recovery extends StatefulWidget {
  const Recovery({Key? key}) : super(key: key);

  @override
  State<Recovery> createState() => _RecoveryState();
}

class _RecoveryState extends State<Recovery> {
  bool _isHide = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: ColorSelect.txtBoHe,
        elevation: 0,
        toolbarHeight: 60,
        leading: IconButton(
          onPressed: () => {
            Navigator.pop(context)
          },
          icon: const Icon(
            Icons.arrow_back,
            color: ColorSelect.paginatorNext,
            size: 30,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Recuperar Contraseña'),
            SizedBox(
              width: 85,
              height: 45,
              child: Image.asset(
                'assets/images/splash.png',
                color: ColorSelect.paginator,
                fit: BoxFit.fill,
                // height: 100,
                // width: 40,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Expanded(
          flex: 2,
          child: Container(
            margin: const EdgeInsets.only(top: 30, left: 25, right: 25),
            width: double.infinity,
            // color: ColorsView.bgEnabled,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 15),
                  
                  child: const Text(
                    'Ingresa tu email para restablecer tu contraseña',
                    
                    style: TextStyle(
                      
                        fontSize: 16,
                        fontFamily: 'Hack',
                        fontWeight: FontWeight.bold,
                        color: ColorSelect.txtGreyTitle),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 25),
                ),
                containerText(name: 'Correo electrónico'),
                _textField(field: 'Dirección de correo'),
                Container(
                  margin: const EdgeInsets.only(
                      top: 10, left: 15, right: 15, bottom: 30),
                  height: 80,
                  child: const Text(
                    'Ingrese su correo electrónico registrado y le enviaremos un correo electrónico que contiene un enlace para restablecer su contraseña.',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Hack',
                        color: ColorSelect.txtConditionPassword),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 130,
        margin: const EdgeInsets.only(left: 25, right: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
              width: 340,
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40))),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(ColorSelect.btnBackgroundBo2),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: ((context) => const LoginPage())));
                },
                child: const Text(
                  'Enviar Solicitud',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: ColorSelect.btnBackgroundBo1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  

  TextField _textField({required String field}) {
    return TextField(
      style: _textStyle(bold: false, link: false),
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        hintText: field,
      ),
    );
  }

  TextStyle _textStyle({required bool bold, required bool link}) {
    return TextStyle(
        fontWeight: bold == true ? FontWeight.bold : FontWeight.normal,
        color: link ? ColorSelect.paginatorNext : ColorSelect.txtinput,
        fontSize: 16,
        fontFamily: 'Hack');
  }

  // TextField _textFieldPassword({required String field}) {
  //   return TextField(
  //     obscureText: _isHide,
  //     decoration: InputDecoration(
  //       labelText: 'Password',
  //       border: const OutlineInputBorder(
  //           borderRadius: BorderRadius.all(Radius.circular(15))),
  //       suffixIcon: IconButton(
  //         icon: Icon(_isHide ? Icons.visibility : Icons.visibility_off),
  //         onPressed: () {
  //           setState(
  //             () {
  //               _isHide = !_isHide;
  //             },
  //           );
  //         },
  //       ),
  //     ),
  //   );
  // }

  Container containerText({required String name}) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(bottom: 10),
      child: Text(
        name,
        style: _textStyle(bold: true, link: false),
      ),
    );
  }
}