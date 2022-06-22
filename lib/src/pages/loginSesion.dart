import 'package:flutter/material.dart';
import 'package:login_flutter/src/pages/home/home.dart';
import 'package:login_flutter/src/pages/recovery.dart';
import 'package:login_flutter/src/pages/register.dart';
import 'package:login_flutter/src/styles/colors/colors_views.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;



class LoginSesion extends StatefulWidget {
  const LoginSesion({Key? key}) : super(key: key);

  @override
  State<LoginSesion> createState() => _LoginSesionState();
}

class _LoginSesionState extends State<LoginSesion> {
  bool _isHide = true;
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();

  Future<void> _authToken(String token) async {
    
    final res = await http.get(Uri.parse("http://172.20.10.7:5000/validate"),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'x-access-tokens': token,
        });
    if (res.statusCode == 200) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: const Duration(seconds: 3),
          backgroundColor: Colors.redAccent[200],
          elevation: 1,
          content: const Text(
            'Token no valido',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          )));
    }
  }

  Future<void> _login() async {
    if (passwordController.text.isNotEmpty &&
        usernameController.text.isNotEmpty) {
      var password = base64.encode(utf8.encode(passwordController.text));
      final response = await http
          .post(Uri.parse("http://172.20.10.7:5000/login"),
          headers: <String, String>{
            'Content-Type': 'application/json',
          },
          body: jsonEncode( <String,String>{
        'username': usernameController.text,
        'password': password.toString(),
      }));
      if (response.statusCode == 200) {
        await _authToken(response.body);
      } else {

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            duration: const Duration(seconds: 10),
            backgroundColor: Colors.redAccent[200],
            elevation: 1,
            content:  Text(
              'ERROR Usuario o Contraseña inválido' +response.body,

              textAlign: TextAlign.center,
              style:
                  const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            )));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: const Duration(seconds: 1),
          backgroundColor: Colors.redAccent[200],
          elevation: 1,
          content: const Text(
            'Campos Vacios',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          )));
    }
  }


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
            const Text('Iniciar sesión'),
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
                  
                  margin: const EdgeInsets.only(right: 55),
                  child: const Text(
                    'Inicia sesión con tu cuenta para continuar',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Hack',
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 117, 117, 117)),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 40),
                ),
                containerText(name: 'Username'),
                _textField(field: 'Username'),
                const Padding(
                  padding: EdgeInsets.only(top: 25),
                ),
                containerText(name: 'Password'),
                _textFieldPassword(field: 'Password'),
                Container(
                  //margin: const EdgeInsets.only(
                  alignment: Alignment.centerRight,    //top: 15, left: 80, bottom: 20),
                  height: 65,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: ((context) => const Recovery())));
                    },
                    child: const Text(
                      '¿Has olvidado tu contraseña?',
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Hack',
                          color: Color.fromRGBO(252, 20, 96, 1)),
                    ),
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
                  _login();
                },
                child: const Text(
                  'Ingresar',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: ColorSelect.btnBackgroundBo1),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.only(right: 5),
                    child: const Text(
                      '¿Todavía no tienes una cuenta?',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: ColorSelect.txtGreyTitle),
                    ),
                  ),
                  InkWell(
                    child: const Text('Registrarte',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(252, 20, 96, 1))),
                    onTap: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Register()))
                    },
                  )
                ],
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
      controller: usernameController,
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
        fontSize: 15,
        fontFamily: 'Hack');
  }

  TextField _textFieldPassword({required String field}) {
    return TextField(
      obscureText: _isHide,
      controller: passwordController,
      decoration: InputDecoration(
        labelText: 'Password',
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        suffixIcon: IconButton(
          icon: Icon(_isHide ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(
              () {
                _isHide = !_isHide;
              },
            );
          },
        ),
      ),
    );
  }

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