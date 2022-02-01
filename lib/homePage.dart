
import 'package:flutter/material.dart';
import 'package:frontend/createDestino.dart';
import 'package:frontend/forest_account.dart';
import 'package:frontend/post.dart';
import 'package:frontend/post_widget.dart';
import 'hotel.dart';
import 'loginPage.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class ClaseDestino{
  int idDestino;
  String nombreDestino;
  String descripcionDestino;
  String ubicacionDestino;
  double scoreDestino;
  List<Post> postsDestino;
  List<String> rutasDestino;
  List<Hotel> hotelesDestino;
  ClaseDestino({required this.idDestino, required this.nombreDestino, required this.descripcionDestino, required this.ubicacionDestino, required this.scoreDestino, required this.postsDestino, required this.rutasDestino, required this.hotelesDestino});
}

class HomePage extends StatefulWidget {

  ClasePersona? persona;
  HomePage({this.persona});

  @override
  State<HomePage> createState() => _HomePageState(persona: persona);

  late List<Post> posts = [];
  late List<String> rutas = [];
  late List<Hotel> hoteles = [];
  Map mapPost={};
  Map mapRutas={};
  Map mapHoteles={};

  getPost(String id) async{
    http.Response response = await http.get(Uri.parse('http://10.0.2.2:3000/posts/${id}'));
    List mapa = json.decode(response.body)["posts"] as List;
    for(Map<String, dynamic> data in mapa){
        String descripcionforest = data["description"];
        String nameforest = data["destino"]["name"];
        String linkforest = data["imagen"]["link"];
        Post nuevopost = Post(nameforest, linkforest, descripcionforest);
        posts.add(nuevopost);
    }
    debugPrint(posts.toString());
  }
  getRutas(String id) async{
    http.Response response = await http.get(Uri.parse('http://10.0.2.2:3000/rutas/${id}'));
    List mapa = json.decode(response.body)["rutas"] as List;
    for(Map<String, dynamic> data in mapa){
      String ruta = data["path"];
      rutas.add(ruta);
    }

  }
  getHoteles(String id) async{
    http.Response response = await http.get(Uri.parse('http://10.0.2.2:3000/recomendaciones_hoteles/${id}'));
    List mapa = json.decode(response.body)["hoteles"] as List;
    for(Map<String, dynamic> data in mapa){
      String nombreHotel = data["name"];
      int precioHotel = data["precio"];
      Hotel nuevoHotel = Hotel(nombreHotel, precioHotel, "0989658754");
      hoteles.add(nuevoHotel);
    }
  }

}

class _HomePageState extends State<HomePage> {
  Map data={};
  List destinosData=[];
  
  late ClaseDestino info_destino;

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
              onPressed: () {
                widget.getPost(destinosData[index]["id"].toString());
                widget.getRutas(destinosData[index]["id"].toString());
                widget.getHoteles(destinosData[index]["id"].toString());
                info_destino = ClaseDestino(idDestino: destinosData[index]["id"], nombreDestino: destinosData[index]["name"], descripcionDestino: destinosData[index]["description"], ubicacionDestino: destinosData[index]["ubication"], scoreDestino: destinosData[index]["score"].toDouble(), postsDestino: widget.posts, rutasDestino: widget.rutas, hotelesDestino: widget.hoteles);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Information_Forest(info_destino)
                  ),
                );
              },
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