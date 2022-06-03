import 'package:flutter/material.dart';
import 'package:login_flutter/src/pages/loginSesion.dart';
import 'package:login_flutter/src/styles/colors/colors_views.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;





class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _isHide = true;
  bool _checked = false;
  var usernameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  
  Future<void> _register() async {
    if (passwordController.text.isNotEmpty &&
        usernameController.text.isNotEmpty &&
        emailController.text.isNotEmpty) {
      var username = base64.encode(utf8.encode(usernameController.text));
      var password = base64.encode(utf8.encode(passwordController.text));
      var email = base64.encode(utf8.encode(emailController.text));

      final response =
          await http.post(Uri.parse("http://172.20.10.7:5000/register"),
              headers: <String, String>{
                'Content-Type': 'application/json',
              },
              body: jsonEncode(<String,String>{
                'username': username.toString(),
                'email_address': email.toString(),
                'password': password.toString()
              }));
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            duration: const Duration(seconds: 3),
            backgroundColor: Colors.redAccent[200],
            elevation: 1,
            content: Text(
              'Registro exitoso bienvenido ${response.body}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            )));
        // Navigator.pushReplacement(
        //     context, MaterialPageRoute(builder: (context) => const Login()));
        Navigator.pop(
            context, MaterialPageRoute(builder: (context) => const LoginSesion()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            duration: const Duration(seconds: 12),
            backgroundColor: Colors.redAccent[200],
            elevation: 1,
            content: Text(
              response.body,
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
            'Se deben llenar todos los campos',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          )));
    }
  }

  @override
  Widget build(BuildContext context, ) {
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
            const Text('Regístrate'),
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
      body: Padding(
        padding: EdgeInsets.all(10),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints){
            return SingleChildScrollView(
                child: ConstrainedBox(
              constraints:  BoxConstraints(
                minHeight: constraints.maxHeight + 50,
              ),
              child: Column(
                textDirection: TextDirection.ltr,
                children: <Widget> [
                  Container(
                    
                    margin: const EdgeInsets.only(right: 70),
                    child: const Text(
                      'Crea una cuenta para empezar a usar la app',
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
                  containerText(name: 'Nombre'),
                  _textField(field: 'Nombre completo'),
                  const Padding(
                    padding: EdgeInsets.only(top: 25),
                  ),
                  containerText(name: 'Correo electrónico'),
                  _textFieldEmailAddress(field: 'Dirección de correo'),
                  const Padding(
                    padding: EdgeInsets.only(top: 25),
                  ),
                  containerText(name: 'Contraseña'),
                  _textFieldPassword(field: 'Contraseña'),
                  Container(
                    margin: const EdgeInsets.only(
                        top: 20, left: 15, right: 15, bottom: 20),
                    height: 50,
                    child: const Text(
                      'La contraseña debe tener caracteres, números y simbolos con un mínimo de 6 caracteres.',
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Hack',
                          color: ColorSelect.txtConditionPassword),
                    ),
                  ),
                  containerCheckbox(),
                ],
              ),
            ),
            );
      
          }),
          
        ),
      bottomNavigationBar: Container(
        height: 100,
        margin: const EdgeInsets.only(left: 25, right: 25, top: 0, bottom: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
              width: 320,
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40))),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(ColorSelect.btnBackgroundBo2),
                ),
                onPressed: () {
                  //Navigator.push(context, MaterialPageRoute(builder: ((context) => const LoginSesion())));
                  _register();
                },
                child: const Text(
                  'Crear cuenta',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: ColorSelect.btnBackgroundBo1),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.only(right: 5),
                    child: const Text(
                      '¿Ya tienes una cuenta?',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: ColorSelect.border1),
                    ),
                  ),
                  InkWell(
                    child: const Text('Iniciar sesión',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(252, 20, 96, 1))),
                    onTap: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginSesion()))
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

  SizedBox containerCheckbox() {
    return SizedBox(
      
      height: 40,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _checked = !_checked;
                });
              },
              child: _checked
                  ? const Icon(
                      Icons.radio_button_checked,
                      color: Colors.blue,
                      size: 20,
                    )
                  : const Icon(
                      Icons.radio_button_unchecked,
                      color: Colors.grey,
                      size: 20,
                    ),
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Al registrarme acepto los ',
                    style: _textStyle(bold: false, link: false),
                  ),
                  InkWell(
                    onTap: () {
                      print('terminos y condiciones');
                    },
                    child: Text(
                      'términos y ',
                      style: _textStyle(bold: false, link: true),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      print('terminos y condiciones');
                    },
                    child: Text(
                      'condiciones ',
                      style: _textStyle(bold: false, link: true),
                    ),
                  ),
                  Text(
                    'y la ',
                    style: _textStyle(bold: false, link: false),
                  ),
                  InkWell(
                    onTap: () {
                      print('politicas de privacidad');
                    },
                    child: Text(
                      'política de privacidad.',
                      style: _textStyle(bold: false, link: true),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
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

  
  TextField _textFieldEmailAddress({required String field}) {
    return TextField(
      style: _textStyle(bold: false, link: false),
      controller: emailController,
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
        color: link ?ColorSelect.paginatorNext : ColorSelect.txtinput,
        fontSize: 16,
        fontFamily: 'Hack');
  }

  TextField _textFieldPassword({required String field}) {
    return TextField(
      controller: passwordController,
      obscureText: _isHide,
      decoration: InputDecoration(
        labelText: field,
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