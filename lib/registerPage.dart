import 'package:flutter/material.dart';

import 'loginPage.dart';

import 'package:path/path.dart';
//import 'package:sqflite/sqflite.dart';
import 'dart:async';

import 'package:mysql1/mysql1.dart';



/*
class CreacionPersona{
  String nombreUsuario;
  String correoUsuario;
  String contrasenaUsuario;
  CreacionPersona({required this.nombreUsuario, required this.correoUsuario, required this.contrasenaUsuario});
  Map<String, dynamic> toMap() {
    return {
      'user': nombreUsuario,
      'password': contrasenaUsuario,
      'email': correoUsuario,
    };
  }
  @override
  String toString() {
    return 'CreacionPersona{user: $nombreUsuario, password: $contrasenaUsuario, email: $correoUsuario}';
  }
}
*/
class RegisterPage extends StatelessWidget {

  final emailcontroller = TextEditingController();
  final usercontroller = TextEditingController();
  final passcontroller = TextEditingController();
  final passcontroller2 = TextEditingController();
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

  insertarPersona(String user, String correo, String pass) async{
    var result = await conn.query('insert into personas (user, password, email) values (?, ?, ?)', [user, pass, correo]);
    debugPrint("Prueba1");
    debugPrint(result.toString());
    debugPrint("Prueba2");
  }

  /*
  // Define a function that inserts dogs into the database
  Future<void> insertPersona(CreacionPersona persona) async {
    final database = openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
      join(await getDatabasesPath(), 'forest_lover'),
    );
    // Get a reference to the database.
    final db = await database;

    // Insert the CreacionPersona into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same persona is inserted twice.
    //
    // In this case, replace any previous data.
    debugPrint("prueba1");
    debugPrint(db.toString());
    debugPrint("prueba2");
    await db.insert(
      'personas',
      persona.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
*/
  @override
  Widget build(BuildContext context) {
    conectarsebd();
    return Scaffold(

      appBar: AppBar(title: Text('Formulario de registro'), actions: <Widget>[
        IconButton(
            icon: const Icon(Icons.more_vert),
            tooltip: 'Actualizando',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Actualizando ventana')));
            }),
      ]),


      body: Center(
        child: Column(
          children: [
            Column(
              children: [
                Container(
                    padding: EdgeInsets.fromLTRB(10, 20, 30, 10),
                    child: TextFormField(
                      controller: emailcontroller,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.email),
                        labelText: 'Correo Electrónico:',
                      ),
                      onSaved: (String? value) {
                        // This optional block of code can be used to run
                        // code when the user saves the form.
                      },
                    )),
                Container(
                    padding: EdgeInsets.fromLTRB(10, 20, 30, 10),
                    child: TextFormField(
                      controller: usercontroller,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        labelText: 'Nombre de Usuario:',
                      ),
                      onSaved: (String? value) {
                        // This optional block of code can be used to run
                        // code when the user saves the form.
                      },
                    )),
                Container(
                    padding: EdgeInsets.fromLTRB(10, 20, 30, 10),
                    child: TextFormField(
                      controller: passcontroller,
                      obscureText: true,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.password),
                        labelText: 'Contraseña:',
                      ),
                      onSaved: (String? value) {
                        // This optional block of code can be used to run
                        // code when the user saves the form.
                      },
                    )),
                Container(
                    padding: EdgeInsets.fromLTRB(10, 20, 30, 10),
                    child: TextFormField(
                      controller: passcontroller2,
                      obscureText: true,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.password),
                        labelText: 'Repetir Contraseña:',
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
                        if (emailcontroller.text != "" && usercontroller.text != "" && passcontroller.text != "" &&passcontroller2.text != "") {
                          if(passcontroller.text == passcontroller2.text) {

                            // Create a CreacionPersona and add it to the personas table
                            //var newUser = CreacionPersona(nombreUsuario: usercontroller.text, correoUsuario: emailcontroller.text, contrasenaUsuario: passcontroller.text);
                            //await insertPersona(newUser);

                            debugPrint("Entrando");
                            insertarPersona(usercontroller.text, emailcontroller.text, passcontroller.text);
                            debugPrint("Saliendo");

                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Registro exitoso")));
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()),
                            );
                          } else{
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Las contraseñas no coinciden")));
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Faltan campos por completar")));
                        }
                      },
                      child: Text('Registrarse'),
                    )),
                Container(
                    padding: EdgeInsets.fromLTRB(50, 20, 50, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('¿Ya tienes una cuenta?',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            )),
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()),
                            );
                          },
                          child: const Text(
                            'Logueate aquí',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ],
        ),
      ),
    );

  }
}