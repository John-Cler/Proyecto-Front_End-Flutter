import 'package:flutter/material.dart';
import 'package:flutter_application_1/listarEquipo.dart';
import 'package:flutter_application_1/registrarEquipo.dart';
import 'package:logger/logger.dart';

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Menu(),
      routes: {
        RegistrarEquipo.ROUTE: (context) => RegistrarEquipo(),
        ListarRegistroEquipo.ROUTE: (context) => ListarRegistroEquipo(),
      },
    );
  }
}

class Menu extends StatelessWidget {
  static String ROUTE = "/menu";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu principal"),
      ),
      body: Center(
        child: const Text("Selecciona una opción del menú"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menú de opciones',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ExpansionTile(
              title: const Text('Registrar'),
              children: <Widget>[
                ListTile(
                  title: const Text('Registrar Equipo'),
                  onTap: () {
                    Navigator.pushNamed(context, RegistrarEquipo.ROUTE);
                  },
                ),
                ListTile(
                  title: const Text('Registrar Personal'),
                  onTap: () {
                    Navigator.pushNamed(context, ListarRegistroEquipo.ROUTE);
                  },
                ),
              ],
            ),
            ListTile(
              title: const Text('Reportes'),
              onTap: () {
                // Navegar a la pantalla de Reportes
              },
            ),
            ListTile(
              title: const Text('Seguimiento'),
              onTap: () {
                // Navegar a la pantalla de Seguimiento
              },
            ),
            ListTile(
              title: const Text('Mantenimiento'),
              onTap: () {
                // Navegar a la pantalla de Mantenimiento
              },
            ),
            ListTile(
              title: const Text('Asignación'),
              onTap: () {
                // Navegar a la pantalla de Asignación
              },
            ),
          ],
        ),
      ),
    );
  }
}

// class RegistrarEquipo extends StatelessWidget {
//   static String ROUTE = "/registrar_equipo";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Registrar Equipo"),
//       ),
//       body: Container(
//         padding: const EdgeInsets.all(15),
//         child: _FormEquipo(),
//       ),
//     );
//   }
// }

class _FormEquipo extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final logger = Logger();
  final codeController = TextEditingController();
  final titleController = TextEditingController();
  final dateController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.all(15),
        children: <Widget>[
          TextFormField(
            controller: codeController,
            validator: (value) {
              if (value!.isEmpty) {
                return "Debe ingresar el código";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Código de equipo",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 15),
          TextFormField(
            controller: titleController,
            validator: (value) {
              if (value!.isEmpty) {
                return "Debe ingresar el título";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Título",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 15),
          TextFormField(
            controller: dateController,
            validator: (value) {
              if (value!.isEmpty) {
                return "Debe ingresar la fecha";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Fecha",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 15),
          TextFormField(
            controller: descriptionController,
            maxLines: 8,
            maxLength: 100,
            validator: (value) {
              if (value!.isEmpty) {
                return "Debe ingresar la descripción";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Descripción",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                logger.i(
                    "Validar: Código - ${codeController.text}, Título - ${titleController.text}, Fecha - ${dateController.text}, Descripción - ${descriptionController.text}");
              }
            },
            child: const Text('Guardar'),
          ),
        ],
      ),
    );
  }
}

// class RegistrarPersonal extends StatelessWidget {
//   static String ROUTE = "/registrar_personal";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Registrar Personal"),
//       ),
//       body: Center(
//         child: const Text("Formulario para registrar personal"),
//       ),
//     );
//   }
// }