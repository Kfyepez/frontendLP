//import 'package:first_flutter_app/post.dart';
import 'package:frontend/createDestino.dart';
import 'package:frontend/homePage.dart';
import 'package:frontend/post.dart';

import 'post_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'hotel.dart';

class Information_Forest extends StatefulWidget {
  ClaseDestino info_destino;
  Information_Forest(this.info_destino);

  @override
  State<Information_Forest> createState() => _Information_ForestState();
}

class _Information_ForestState extends State<Information_Forest> {
  int page = 1;
  Widget getStars() {
    int piso = widget.info_destino.scoreDestino.floor();
    List<Widget> items = [];
    for (int i = 0; i < piso; i++) {
      items.add(Icon(
        Icons.star,
        color: Colors.yellow,
      ));
    }
    if (piso != widget.info_destino.scoreDestino) {
      items.add(Icon(
        Icons.star_half,
        color: Colors.yellow,
      ));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: items,
    );
  }

  Widget galery() {
    List<Widget> images = [];
    String photo_forest_url = widget.info_destino.postsDestino[0].link_img;
    for (Post post in widget.info_destino.postsDestino) {
      images.add(GestureDetector(
        child: Container(
          width: 100,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: NetworkImage(post.link_img)
              )
          ),
        ),
        onTap: () => {
          //Abrir la otra pagina con los datos del post especifico
          Navigator.push(
              context,
              PageRouteBuilder(
                  pageBuilder: (BuildContext context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation) =>
                      Post_Widget(widget.info_destino.postsDestino[0].link_img, post)))
        },
      ));
    }

    return Expanded(
      child: GridView.count(
        crossAxisCount: 3,
        children: images,
      ),
    );
  }

  Widget hoteles() {
    Widget horizontal_space = SizedBox(
      width: 10,
    );
    List<Widget> info = [];
    TextStyle style = TextStyle(
        decoration: TextDecoration.none,
        fontSize: 20,
        fontFamily: "PoiretOne",
        color: Colors.black);
    for (Hotel hotel in widget.info_destino.hotelesDestino) {
      info.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.house_rounded,
            size: 30,
          ),
          horizontal_space,
          Column(
            children: [
              Text(hotel.name, style: style),
              Text("Contact: ${hotel.phone}", style: style),
              SizedBox(
                height: 30,
              )
            ],
          )
        ],
      ));
    }
    return Expanded(
      child: ListView(
        //crossAxisCount: 1,
        children: info,
      ),
    );
  }

  Widget rutas() {
    List<Widget> info = [];
    TextStyle style = TextStyle(
        decoration: TextDecoration.none,
        fontSize: 20,
        fontFamily: "PoiretOne",
        color: Colors.black);
    int cont = 1;
    for (String transport in widget.info_destino.rutasDestino) {
      info.add(Column(
        children: [
          Text(
            "Ruta ${cont}",
            style: style,
          ),
          Text(
            "Path: ${transport}.....",
            style: style,
          ),
          Text(
            "Time travel: 2 hours",
            style: style,
          ),
          SizedBox(
            height: 30,
          )
        ],
      ));
    }
    return Expanded(
      child: ListView(
        //crossAxisCount: 1,
        children: info,
      ),
    );
  }

  Widget body() {
    switch (page) {
      case 1:
        return galery();
      case 2:
        return hoteles();
      case 3:
        return rutas();
      default:
        return galery();
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget name_forest = Text(
      widget.info_destino.nombreDestino,
      style: TextStyle(
          decoration: TextDecoration.none,
          fontWeight: FontWeight.w100,
          fontSize: 50,
          fontFamily: "PoiretOne",
          color: Colors.black),
    );
    // TODO: implement build

    Widget photo = Container(
      width: 200,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Image(image: NetworkImage(widget.info_destino.postsDestino.first.link_img)),
      ),
    );
    Widget vertical_space = SizedBox(
      height: 10,
    );
    Widget horizontal_space = SizedBox(
      width: 10,
    );
    TextStyle style = TextStyle(
        decoration: TextDecoration.none,
        fontSize: 20,
        fontFamily: "PoiretOne",
        color: Colors.black);

    Widget navigation =
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      GestureDetector(
        child: Icon(
          Icons.grid_on,
          color: page == 1 ? Colors.blue : Colors.black,
        ),
        onTap: () {
          setState(() {
            page = 1;
          });
        },
      ),
      GestureDetector(
          child: Icon(
            Icons.hotel,
            color: page == 2 ? Colors.blue : Colors.black,
          ),
          onTap: () {
            setState(() {
              page = 2;
            });
          }),
      GestureDetector(
          child: Icon(
            Icons.directions_car,
            color: page == 3 ? Colors.blue : Colors.black,
          ),
          onTap: () {
            setState(() {
              page = 3;
            });
          }),
    ]);
    Widget separador = Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            //                    <--- top side
            color: Colors.black,
            width: 1.0,
          ),
        ),
      ),
    );
    Widget description = Container(
      child: Flexible(
        child: Text(
          widget.info_destino.descripcionDestino,
          style: TextStyle(
              decoration: TextDecoration.none,
              fontSize: 15,
              fontFamily: "PoiretOne",
              color: Colors.black54),
        ),
      ),
    );
    Widget info = new Column(
      children: [
        name_forest,
        vertical_space,
        photo,
        vertical_space,
        description,
        Text(
          "${widget.info_destino.scoreDestino} de 5 estrellas",
          style: style,
        ),
        vertical_space,
        getStars(),
        vertical_space,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "4512 likes",
              style: style,
            ),
            Text(
              "10004 views",
              style: style,
            )
          ],
        ),
        vertical_space,
        separador,
        vertical_space,
        navigation,
        vertical_space,
        separador,
        body()
      ],
    );

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: info,
      ),
    );
  }
}
