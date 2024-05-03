import 'package:flutter/material.dart';
import 'package:otroproyecto/pages/login.dart';
import 'package:otroproyecto/pages/usuario_controlador.dart';
import 'package:otroproyecto/pages/usuario_reportes.dart';
import 'package:get/get.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      getPages: [
        GetPage(name: '/login', page: ()=> const LoginPage()),
        GetPage(name: '/Reportes', page: ()=> reportes()),
        GetPage(name: '/Controlador', page: ()=> const controlador()),
        /* 
        GetPage(name: '/clientes', page: ()=> clientes()),
        GetPage(name: '/usuarios', page: ()=> usuarios()),
        GetPage(name: '/Creportes', page: ()=> Creportes()),
        */
        ],




    );
  }
}
