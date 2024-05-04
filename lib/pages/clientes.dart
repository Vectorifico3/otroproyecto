// ignore_for_file: use_key_in_widget_constructors, sort_child_properties_last

import 'dart:convert';
import 'dart:js';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:otroproyecto/pages/usuario_controlador.dart';

class Clientes extends StatefulWidget {
  @override
  _clientes createState() => _clientes();
}

class _clientes extends State<Clientes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [Fondo(), Contenidoclientes()],
      ),
    );
  }
}

class Contenidoclientes extends StatefulWidget {
  @override
  _ContenidoClientes createState() => _ContenidoClientes();
}

class _ContenidoClientes extends State<Contenidoclientes> {
  List<Map<String, dynamic>> _data = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
  final _formKey = GlobalKey<FormState>();
  final _idcontroller = TextEditingController();
  final _datocontroller = TextEditingController();
    return SingleChildScrollView(
    child: Container(
      width: 500,
      padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*todo lo de modificar los datos */
              IconButton(
                  onPressed: () {
                    Get.off(() => controlador());
                  },
                  icon: Icon(Icons.logout)),
            const Text('Si desea modificar los datos de un cliente ingrese los datos',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              )
            ),
            const SizedBox(height: 5,),
            TextFormField(
              key: const Key('TextFormFieldID'),
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Ingrese el Id del cliente a modificar',
              ),
            ),
            const SizedBox(height: 5,),
            TextFormField(
              key: const Key('TextFormFieldModify'),
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Ingrese el dato a modificar',
              ),
            ),
            const SizedBox(height: 5,),
            OutlinedButton(onPressed: (){}, 
            child: const Text(
                'Cambiar Id',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xff142047)),
              ), 
            ),
            OutlinedButton(onPressed: (){}, 
            child: const Text(
                'Cambiar Nombre',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xff142047)),
              ), 
            ),
            /*Abajo la logica de la visualizacion de los clientes */          
            const SizedBox(height: 5,),
            const Text('Visualizacion de los clientes',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              )
            ),
            const SizedBox(height: 5,),
            DataTable(columns: const [
              DataColumn(label: Text('ID')),
              DataColumn(label: Text('Usuario')),
            ], rows: _data.map((data){
                return DataRow(cells: [
                  DataCell(Text(data['id'].toString())),
                  DataCell(Text(data['name'].toString())),                    
                ],
                );
            }).toList(),
            ),
          ],
        ),
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      )
    ),

    );
  }

  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('https://retoolapi.dev/PQCTXu/data'));
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
