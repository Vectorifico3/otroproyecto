// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class reportes extends StatefulWidget {
  @override
  _reportes createState() => _reportes();
}

class _reportes extends State<reportes> {
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
            'Ingrese Los datos del Reporte',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Reporte(),
        ],
      ),
    );
  }
}

class Reporte extends StatefulWidget {
  @override
  _Reporte createState() => _Reporte();
}

class _Reporte extends State<Reporte> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ingrese Nombre del Cliente Atendido',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            height: 5,
          ),
          TextFormField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(border: OutlineInputBorder())),
          SizedBox(
            height: 5,
          ),
          Text(
            'Ingrese Hora de inicio',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Horainicio(),
          Text(
            'Ingrese Tiempo trabajado (horas)',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(border: OutlineInputBorder())),
          Text(
            'Ingrese Descripcion del Problema Solucionado',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            height: 5,
          ),
          TextField(
              maxLines: null,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.newline,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(vertical: 20.0))),
          SizedBox(
            height: 5,
          ),
          Enviar(),
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
    );
  }
}

class Horainicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Seleccionhora(),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}

class Seleccionhora extends StatefulWidget {
  @override
  State<Seleccionhora> createState() => _Seleccionhora();
}

class _Seleccionhora extends State<Seleccionhora> {
  @override
  int _selectedvalue = 0;
  Widget build(BuildContext context) {
    return CupertinoButton.filled(
      child: Text('Seleccione hora: $_selectedvalue'),
      onPressed: () => showCupertinoModalPopup(
          context: context,
          builder: (_) => SizedBox(
                width: double.infinity,
                height: 250,
                child: CupertinoPicker(
                  backgroundColor: Colors.white,
                  itemExtent: 24,
                  scrollController: FixedExtentScrollController(
                    initialItem: 1,
                  ),
                  children: const [
                    Text('1'),
                    Text('2'),
                    Text('3'),
                    Text('4'),
                    Text('5'),
                    Text('6'),
                    Text('7'),
                    Text('8'),
                    Text('9'),
                    Text('10'),
                    Text('11'),
                    Text('12'),
                    Text('13'),
                    Text('14'),
                    Text('15'),
                    Text('16'),
                    Text('17'),
                    Text('18'),
                    Text('19'),
                    Text('20'),
                    Text('21'),
                    Text('22'),
                    Text('23'),
                    Text('24'),
                  ],
                  onSelectedItemChanged: (int value) {
                    setState(() {
                      _selectedvalue = value+1;
                    });
                  },
                ),
              )),
    );
  }
  
}

class Enviar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          'Enviar Reporte',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Color(0xff142047)),
        ),
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
