import 'package:flutter/material.dart';
import 'package:otroproyecto/pages/login.dart';
import 'package:otroproyecto/pages/usuario_reportes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: reportes(),
    );
  }
}
