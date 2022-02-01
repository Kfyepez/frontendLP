import 'favorite_button.dart';
//import 'package:first_flutter_app/post.dart';
import 'package:flutter/material.dart';

import 'homePage.dart';
class Post_Widget extends StatelessWidget{
  ClaseDestino info_destino;
  Post_Widget(this.info_destino);

  @override
  Widget build(BuildContext context) {
    TextStyle style=TextStyle(
        decoration: TextDecoration.none,
        fontSize: 12,
        fontFamily: "PoiretOne",
        color: Colors.black
    );
    Widget vertical_space=SizedBox(
      height: 10,
    );
    Widget horizontal_space=SizedBox(
      width: 10,
    );
    Widget photo=Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.fitHeight,
              image: NetworkImage(info_destino.postsDestino[0]["imagen"]["link"])
          )
      ),
    );
    Widget header=Row(
      children: [
        photo,
        horizontal_space,
        Text(this.info_destino.nombreDestino,style: style)
      ],
    );
    Widget post=Container(
      height: 400,
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.contain,
            image: NetworkImage(this.info_destino.postsDestino[0]["imagen"]["link"])
        )
    )
    );
    Widget icons=Row(
      children: [
        FavoriteButton(),
        horizontal_space,
        Icon(Icons.comment),
        horizontal_space,
        Icon(Icons.send),
        horizontal_space,
        Icon(Icons.save_alt)
      ],
    );
    Widget description= Expanded(
      child: Text("${this.info_destino.nombreDestino}: "+this.info_destino.descripcionDestino,style: style,),
    );

    return Column(
      children: [
        header,
        post,
        icons,
        description
      ],
    );
  }

}