import 'package:flutter/material.dart';
import 'package:flutter_application_1/listarEquipo.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/registrarEquipo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: ListarRegistroEquipo.ROUTE,
      //Definir rutas de todas las paginas que se utilizaran
      routes: {
        ListarRegistroEquipo.ROUTE: (_) => ListarRegistroEquipo(),
        RegistrarEquipo.ROUTE: (_) => RegistrarEquipo(),
      },
    );
  }
}
