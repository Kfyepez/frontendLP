import 'package:flutter/material.dart';
import 'package:frontend/registerPage.dart';

import 'homePage.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class ClasePersona{
  String nombreUsuario;
  String correoUsuario;
  ClasePersona({required this.nombreUsuario, required this.correoUsuario});
}

class LoginPage extends StatelessWidget {

  final usercontroller = TextEditingController();
  final passcontroller = TextEditingController();
  late String correoUsuario;
   late ClasePersona persona;

  Map data={};
  List userData=[];

  getusers() async{
      http.Response response = await http.get(Uri.parse('http://10.0.2.2:3000/personas'));
      data = json.decode(response.body);
      userData = data["perosnas"];
      //userData?.map((text) => debugPrint(text));
      //debugPrint(userData[0]["id"].toString());
      //debugPrint(userData?.length);
      //userData.forEach((element) {print(element["id"]);});

  }

  String getusercontroller(){
    return usercontroller.toString();
  }


  @override
  Widget build(BuildContext context) {
    getusers();
    return Scaffold(

      appBar: AppBar(title: Text('Ingresa con tus datos'), actions: <Widget>[
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
                      controller: usercontroller,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: 'admin',
                        labelText: 'Usuario:',
                      ),
                      onSaved: (String? value) {
                        // This optional block of code can be used to run
                        // code when the user saves the form.
                      },
                      validator: (String? value) {
                        return (value != null && value.contains('@'))
                            ? 'Do not use the @ char.'
                            : null;
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
                        hintText: 'admin',
                      ),
                      onSaved: (String? value) {
                        // This optional block of code can be used to run
                        // code when the user saves the form.
                      },
                      validator: (String? value) {
                        return (value != null && value.contains('@'))
                            ? 'Do not use the @ char.'
                            : null;
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
                      onPressed: () {
                        int temp = 0;
                        //getusers();
                        userData.forEach((element) {
                        if (usercontroller.text == element["user"] &&
                            passcontroller.text == element["password"]){
                          persona = ClasePersona(nombreUsuario: element["user"], correoUsuario: element["email"]);

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage(
                              persona:persona
                            )
                            ),
                          );
                          temp = 1;
                        }
                        });

                        if(temp ==0){
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Datos incorrectos")));
                        }
                        },
                      child: Text('Iniciar Sesión'),
                    )),
                Container(
                    padding: EdgeInsets.fromLTRB(50, 20, 50, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('¿No tienes cuenta?',
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
                                MaterialPageRoute(builder: (context) => RegisterPage()),
                            );
                          },
                          child: const Text(
                            'Regístrate aquí',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ))
              ],
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Text('o',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  )),
            ),
            Container(
              width: 300,
              padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
              color: Colors.black26,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.facebook,
                    size: 24.0,
                    color: Colors.black,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                      textStyle: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text("Ingresando con Facebook")));
                    },
                    child: const Text('Ingresa con Facebook'),
                  ),
                ],
              ),
            ),
            Container(
              width: 300,
              padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              color: Colors.black26,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.account_box_sharp,
                    size: 24.0,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                      textStyle: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text("Ingresando con Twitter")));
                    },
                    child: const Text('Ingresa con Twitter'),
                  ),
                ],
              ),
            ),
            Container(
              width: 300,
              padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              color: Colors.black26,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.account_circle_rounded,
                    size: 24.0,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                      textStyle: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text("Ingresando con Google")));
                    },
                    child: const Text('Ingresa con Google'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );

  }
}