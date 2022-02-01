
import 'package:flutter/material.dart';
import 'package:frontend/createDestino.dart';
import 'loginPage.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class ClaseDestino{
  String nombreDestino;
  String scoreDestino;
  ClaseDestino({required this.nombreDestino, required this.scoreDestino});
}

class HomePage extends StatefulWidget {

  ClasePersona? persona;
  HomePage({this.persona});

  @override
  State<HomePage> createState() => _HomePageState(persona: persona);

}

class _HomePageState extends State<HomePage> {
  Map data={};
  List destinosData=[];

  ClasePersona? persona;
  _HomePageState({this.persona});

  @override
  initState(){
    super.initState();
    getDestinos();
  }

  getDestinos() async{
    http.Response response = await http.get(Uri.parse('http://10.0.2.2:3000/destinos_turisticos'));
    data = json.decode(response.body);
    setState(() {
      destinosData = data["destinos"];
    });
  }


  @override
  Widget build(BuildContext context) {
    //getDestinos();
    return Scaffold(

      appBar: AppBar(title: Text('Inicio'), actions: <Widget>[
        IconButton(
            icon: const Icon(Icons.add),
            padding: EdgeInsets.fromLTRB(0, 8, 15, 8),
            tooltip: 'Añadir destino turistico',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CreateDestino()),
              );
            }),
        

      ]),

      drawer: Drawer(
          child: ListView(padding: EdgeInsets.zero, children: <Widget>[
            DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                ),
                child: Column(
                  children: [
                    Text('Bienvenido', style: TextStyle(color: Colors.white, fontSize: 20)),
                    Padding(child: Text("${persona?.nombreUsuario}", style: TextStyle(color: Colors.white, fontSize: 16)), padding: const EdgeInsets.all(8.0),),

                    Text("${persona?.correoUsuario}", style: TextStyle(color: Colors.white, fontSize: 16)),

                  ],
                )),
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
              title: Text('Cerrar sesión'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
          ])),

      body: Container(
        child: ListView.builder(
          itemCount: destinosData == null ? 0 : destinosData.length,
          itemBuilder: (BuildContext context, int index) {
            return OutlinedButton(
              onPressed: () {  },
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  <Widget>[
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 20, 30, 10),

                        child: Text("${destinosData[index]["id"]}"),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 20, 30, 10),
                        child: Text("${destinosData[index]["name"]}"),
                      ),

                    ],
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(60, 0, 30, 10),
                    child: Text("${destinosData[index]["description"]}"),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(60, 0, 30, 10),
                    child: Text("${destinosData[index]["ubication"]}"),
                  ),


                ],
              ),
            );
          },
        ),
      ),
    );

  }
}