// ignore_for_file: sort_child_properties_last, prefer_const_constructors, override_on_non_overriding_member, library_private_types_in_public_api, use_key_in_widget_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otroproyecto/pages/usuario_controlador.dart';
import 'package:http/http.dart' as http;
import 'package:otroproyecto/pages/usuario_reportes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [Fondo(), Contenido()],
      ),
    );
  }
}

class Contenido extends StatefulWidget {
  @override
  _ContenidoState createState() => _ContenidoState();
}

class _ContenidoState extends State<Contenido> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Login',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Bienvenido',
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
              letterSpacing: 1.5,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Datos(),
        ],
      ),
    );
  }
}

class Datos extends StatefulWidget {
  @override
  _DatosState createState() => _DatosState();
}

class _DatosState extends State<Datos> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  List<Map<String, dynamic>> _data = [];

  void initState() {
    super.initState();
    fetchData();
  }

  @override
  bool obs = true;
  bool admin = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            TextFormField(
              key: const Key('TextFormFieldEmail'),
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'a@b.com',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Enter Email";
                } else if (!value.contains('@')) {
                  return "Enter a valid Email";
                }
                return null;
              },
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Contraseña',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            TextFormField(
                key: const Key('TextFormFieldPass'),
                controller: _passwordController,
                obscureText: obs,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obs == true ? obs = true : obs = false;
                          });
                        },
                        icon: Icon(Icons.remove_red_eye_outlined))),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter password";
                  }
                  return null;
                }),
            SizedBox(
              height: 30,
            ),
            OutlinedButton(
              key: const Key('ButtonLoginSubmit'),
              onPressed: () {
                FocusScope.of(context).requestFocus(FocusNode());
                final form = _formKey.currentState;
                form!.save();
                if (form.validate()) {
                  if ("a@a.com" == _emailController.text ||
                      "b@a.com" == _emailController.text) {
                    admin = true;
                    Get.to(controlador());
                  } else if (admin == false) {
                    int count = _data.length;
                    for (int i = 0; i < count; i++) {
                      if (_emailController.text ==
                              _data[i]['email'].toString() &&
                          _passwordController.text ==
                              _data[i]['password'].toString()) {
                        Get.to(() => reportes());
                      }
                    }
                  } else {
                    const snackBar = SnackBar(
                      content: Text('User or passwor nok'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                }
              },
              child: Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xff142047)),
              ),
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
    );
  }

  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('https://retoolapi.dev/ykEuYr/data'));
    if (response.statusCode == 200) {
      setState(() {
        _data = List<Map<String, dynamic>>.from(json.decode(response.body));
      });
    } else {
      throw Exception('fallo al cargarla informacion');
    }
  }
}

class Fondo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Colors.blue.shade300,
        Colors.blue,
      ], begin: Alignment.centerRight, end: Alignment.centerLeft)),
    );
  }
}
