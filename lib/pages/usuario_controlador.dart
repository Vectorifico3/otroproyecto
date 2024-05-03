// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';

class controlador extends StatefulWidget {
  @override
  _controlador createState() => _controlador();
}

class _controlador extends State<controlador> {
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
    return Container(
      child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bienvenido, Seleccione que actividad desea realizar:',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Opciones(),
          ],
        ),        
      ),      
    ),

    );
  }
}

class Opciones extends StatefulWidget {
  @override
  _Opciones createState() => _Opciones();
}

class _Opciones extends State<Opciones> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Text('administrar usuarios de soporte',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),),
          SizedBox(
            height: 5,
          ),

          Text('administrar clientes',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),),
          SizedBox(
            height: 5,
          ),


          Text('evaluar reportes',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),),
          SizedBox(
            height: 5,
          ),
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),      
    );
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
