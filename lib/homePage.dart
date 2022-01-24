import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class HomePage extends StatelessWidget {

  final usercontroller = TextEditingController();
  final passcontroller = TextEditingController();

  List? data;

  getlugares() async{
    http.Response response = await http.get(Uri.parse('http://10.0.2.2:3000/destinos_turisticos'));
    data = json.decode(response.body);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text('Inicio'), actions: <Widget>[
        IconButton(
            icon: const Icon(Icons.more_vert),
            tooltip: 'Actualizando',
            onPressed: () {
              getlugares();
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Actualizando ventana')));
            }),
      ]),

      drawer: Drawer(
          child: ListView(padding: EdgeInsets.zero, children: <Widget>[
            DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                ),
                child: Text('Menú',
                    style: TextStyle(color: Colors.white, fontSize: 20))),
            ListTile(
              leading: Icon(Icons.login),
              title: Text('Iniciar sesión'),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Redirigiendo a página de inicio de sesión')));
              },
            ),
            ListTile(
              leading: Icon(Icons.app_registration),
              title: Text('Registrarse'),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Redirigiendo a formulario de registro')));
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configuración'),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Redirigiendo a página de configuración')));
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Salir'),
              onTap: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text('Saliendo')));
              },
            ),
          ])),

      body: ListView.builder(
        itemCount: data == null ? 0 : data?.length,
        itemBuilder: (BuildContext context, int index){
          return Card(
            child: Column(
              children: <Widget>[
                Text("${data?[index]["name"]}"),
                Text("${data?[index]["description"]}"),
                Text("${data?[index]["ubication"]}"),
                Text("${data?[index]["score"]}"),
              ],
            ),
          )
        },
      ),
    );

  }
}