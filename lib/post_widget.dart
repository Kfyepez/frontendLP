
import '/post.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:favorite_button/favorite_button.dart';

class Post_Widget extends StatefulWidget{
  String photo_forest_url;
  Post post;
  Post_Widget(this.photo_forest_url, this.post);

  @override
  State<Post_Widget> createState() => _Post_WidgetState();
}

class _Post_WidgetState extends State<Post_Widget> {

  int num_likes=4;

  @override
  Widget build(BuildContext context) {
    TextStyle style=TextStyle(
        decoration: TextDecoration.none,
        fontSize: 20,
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
              image: NetworkImage(widget.photo_forest_url)
          )
      ),
    );
    Widget header=Row(
      children: [
        photo,
        horizontal_space,
        Text(this.widget.post.name_forest,style: style)
      ],
    );
    Widget post=Container(
      height: 400,
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.contain,
            image: NetworkImage(this.widget.post.link_img)
        )
    )
    );
    Widget icons=Row(
      children: [
        FavoriteButton(
          valueChanged: (_isFavorite) {
            setState(() {
              num_likes++;
            });
          },

        ),
        Text("${num_likes}"),
        horizontal_space,
        Icon(Icons.comment),
        horizontal_space,
        Icon(Icons.send),
        horizontal_space,
        Icon(Icons.save_alt)
      ],
    );
    Widget description= Expanded(
      child: Text("${this.widget.post.name_forest}: "+this.widget.post.description,style: style,),
    );

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(10, 40, 10, 10),
        child: Column(
          children: [
            header,
            post,
            icons,
            description
          ],
        ),
      ),
    );
  }
}