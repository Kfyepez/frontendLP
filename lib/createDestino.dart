
import 'package:flutter/material.dart';
import 'package:frontend/homePage.dart';
import 'loginPage.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:path/path.dart';
import 'package:mysql1/mysql1.dart';


class CreateDestino extends StatefulWidget {

  @override
  State<CreateDestino> createState() => _CreateDestinoState();

}

class _CreateDestinoState extends State<CreateDestino> {

  final namecontroller = TextEditingController();
  final descriptioncontroller = TextEditingController();
  final ubicationcontroller = TextEditingController();

  var conn;

  conectarsebd() async{
    var settings = new ConnectionSettings(
        host: '10.0.2.2',
        port: 3306,
        user: 'root',
        password: null,
        db: 'forest_lover'
    );
    conn = await MySqlConnection.connect(settings);
  }

  insertarDestino(String name, String description, String ubication) async{
    var result = await conn.query('insert into destinos_turisticos (name, description, ubication, score) values (?, ?, ?, ?)', [name, description, ubication, 2]);
  }

  @override
  Widget build(BuildContext context) {
    conectarsebd();
    return Scaffold(

      appBar: AppBar(title: Text('Nuevo Destino Turístico'), actions: <Widget>[
            ]),

      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                      padding: EdgeInsets.fromLTRB(10, 20, 30, 10),
                      child: TextFormField(
                        controller: namecontroller,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.text_format),
                          labelText: 'Nombre:',
                        ),
                        onSaved: (String? value) {
                          // This optional block of code can be used to run
                          // code when the user saves the form.
                        },
                      )),
                  Container(
                      padding: EdgeInsets.fromLTRB(10, 20, 30, 10),
                      child: TextFormField(
                        controller: descriptioncontroller,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.message_outlined),
                          labelText: 'Descripción',
                        ),
                        onSaved: (String? value) {
                          // This optional block of code can be used to run
                          // code when the user saves the form.
                        },
                      )),
                  Container(
                      padding: EdgeInsets.fromLTRB(10, 20, 30, 10),
                      child: TextFormField(
                        controller: ubicationcontroller,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.pin_drop_outlined),
                          labelText: 'Ubicación',
                        ),
                        onSaved: (String? value) {
                          // This optional block of code can be used to run
                          // code when the user saves the form.
                        },
                      )),
                  Container(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.black12),
                          foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                        ),
                        onPressed: () async {
                          if (namecontroller.text != "" && descriptioncontroller.text != "" && ubicationcontroller.text != "" ) {

                              // Create a CreacionPersona and add it to the personas table
                              //var newUser = CreacionPersona(nombreUsuario: usercontroller.text, correoUsuario: emailcontroller.text, contrasenaUsuario: passcontroller.text);
                              //await insertPersona(newUser);

                              debugPrint("Entrando");
                              insertarDestino(namecontroller.text, descriptioncontroller.text, ubicationcontroller.text);
                              debugPrint("Saliendo");

                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("Creación exitosa")));
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()),
                              );

                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Faltan campos por completar")));
                          }
                        },
                        child: Text('Crear Destino'),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}