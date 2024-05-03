// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';

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
      child: SingleChildScrollView(
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
      )
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
      width: 350,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Seleccionhora(),
          SizedBox(
            height: 5,
          ),
          Seleccionminutos(),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}

class Seleccionminutos extends StatefulWidget {
  @override
  State<Seleccionminutos> createState() => _Seleccionminutos();
}

class _Seleccionminutos extends State<Seleccionminutos> {
  @override
  int _selectedvalue = 0;
  Widget build(BuildContext context) {
    return CupertinoButton.filled(
      child: Text('Seleccione minuto: $_selectedvalue'),
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
                    Text('00'),
                    Text('01'),
                    Text('02'),
                    Text('03'),
                    Text('04'),
                    Text('05'),
                    Text('06'),
                    Text('07'),
                    Text('08'),
                    Text('09'),
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
                    Text('25'),
                    Text('26'),
                    Text('27'),
                    Text('28'),
                    Text('29'),
                    Text('30'),
                    Text('31'),
                    Text('32'),
                    Text('33'),
                    Text('34'),
                    Text('35'),
                    Text('36'),
                    Text('37'),
                    Text('38'),
                    Text('39'),
                    Text('40'),
                    Text('41'),
                    Text('42'),
                    Text('43'),
                    Text('44'),
                    Text('45'),
                    Text('46'),
                    Text('47'),
                    Text('48'),
                    Text('49'),
                    Text('50'),
                    Text('51'),
                    Text('52'),
                    Text('53'),
                    Text('54'),
                    Text('55'),
                    Text('56'),
                    Text('57'),
                    Text('58'),
                    Text('59'),
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
                    Text('01'),
                    Text('02'),
                    Text('03'),
                    Text('04'),
                    Text('05'),
                    Text('06'),
                    Text('07'),
                    Text('08'),
                    Text('09'),
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
