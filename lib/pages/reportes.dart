// ignore_for_file: use_key_in_widget_constructors, sort_child_properties_last, avoid_print, library_private_types_in_public_api

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:otroproyecto/pages/usuario_controlador.dart';

class CalReportes extends StatefulWidget {
  @override
  _CalReportes createState() => _CalReportes();
}

class _CalReportes extends State<CalReportes> {
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
    var datorandom1 = "";
    var datorandom2 = "";
    var datorandom3 = "";
    var datorandom4 = "";
    return SingleChildScrollView(
      child: Container(
          width: 900,
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*todo lo de modificar los datos */
                IconButton(
                    onPressed: () {
                      Get.off(() => const controlador());
                    },
                    icon: const Icon(Icons.logout)),
                const Text('Si desea calificar un reporte ingrese los datos',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  key: const Key('TextFormFieldID'),
                  controller: _idcontroller,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Ingrese el Id del Reporte a modificar',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter ID";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  key: const Key('TextFormFieldModify'),
                  controller: _datocontroller,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Ingrese la calificacion (1-5)',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Rating";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 5,
                ),
                OutlinedButton(
                  key: const Key('ButtonNameModify'),
                  onPressed: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    final form = _formKey.currentState;
                    form!.save();
                    if (form.validate()) {
                      if (_idcontroller.text != '') {
                        if (int.parse(_idcontroller.text) > 0 &&
                            int.parse(_idcontroller.text) <= _data.length) {
                          for (var rep in _data) {
                            if (rep['id'].toString() == _idcontroller.text) {
                              datorandom1 = rep['nameCliente'].toString();
                              datorandom2 = rep['Horaini'].toString();
                              datorandom3 = rep['TiempoT'].toString();
                              datorandom4 = rep['Descripcion'].toString();
                            }
                          }

                          actualizarDatos(
                              _idcontroller.text,datorandom1,datorandom2,datorandom3,datorandom4, _datocontroller.text);
                          Get.back();
                        } else {
                          const snackBar = SnackBar(
                            content: Text('Enter a valid ID'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      } else {
                        const snackBar = SnackBar(
                          content: Text('Please Enter an ID'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    }
                  },
                  child: const Text(
                    'Calificar Reporte',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xff142047)),
                  ),
                ),

                /*Abajo la logica de la visualizacion de los clientes */
                const SizedBox(
                  height: 5,
                ),
                const Text('Visualizacion de los Reportes',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )),
                const SizedBox(
                  height: 5,
                ),
                DataTable(
                  columns: const [
                    DataColumn(label: Text('ID')),
                    DataColumn(label: Text('nameCliente')),
                    DataColumn(label: Text('Horaini')),
                    DataColumn(label: Text('TiempoT')),
                    DataColumn(label: Expanded(child: Text('Descripcion'))),
                    DataColumn(label: Text('Calificacion')),
                  ],
                  rows: _data.map((data) {
                    return DataRow(
                      cells: [
                        DataCell(Text(data['id'].toString())),
                        DataCell(Text(data['nameCliente'].toString())),
                        DataCell(Text(data['Horaini'].toString())),
                        DataCell(Text(data['TiempoT'].toString())),
                        DataCell(Text(data['Descripcion'].toString())),
                        DataCell(Text(data['Calificacion'].toString())),
                      ],
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          )),
    );
  }

  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('https://retoolapi.dev/EhK4J4/Reportes'));
    if (response.statusCode == 200) {
      setState(() {
        _data = List<Map<String, dynamic>>.from(json.decode(response.body));
      });
    } else {
      throw Exception('fallo al cargarla informacion');
    }
  }

  Future<void> actualizarDatos(
      //Patch
      String idmodificar,
      String datoR1,
      String datoR2,
      String datoR3,
      String datoR4,
      String valormodificar) async {
    Map<String, dynamic> datosActualizados = {
      'id': idmodificar,
      'nameCliente': datoR1,
      'Horaini': datoR2,
      'TiempoT': datoR3,
      'Descripcion': datoR4,
      'Calificacion': valormodificar,
    };
    String cuerposolicitud = json.encode(datosActualizados);
    final response = await http.patch(
      Uri.parse(
          'https://api-generator.retool.com/EhK4J4/Reportes/$idmodificar'),
      headers: {'Content-Type': 'application/json'},
      body: cuerposolicitud,
    );
    if (response.statusCode == 200) {
      // Éxito, los datos se actualizaron correctamente
      print('Datos actualizados correctamente');
    } else {
      // Error, no se pudieron actualizar los datos
      print('Error al actualizar datos: ${response.reasonPhrase}');
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
