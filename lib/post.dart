import 'package:flutter/material.dart';
class Post extends StatelessWidget{
  late String photo_url;
  late String post_url;
  late String forest_name;
  late String text_description;
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
              image: NetworkImage(photo_url)
          )
      ),
    );
    Widget header=Row(
      children: [
        photo,
        horizontal_space,
        Text(forest_name,style: style)
      ],
    );
    Widget post=Container(
      height: 400,
      child: Image( image: NetworkImage(post_url),),
    );
    Widget icons=Row(
      children: [
        Icon(Icons.favorite),
        horizontal_space,
        Icon(Icons.comment),
        horizontal_space,
        Icon(Icons.send),
        horizontal_space,
        Icon(Icons.save_alt)
      ],
    );
    Widget description= Expanded(
      child: Text("${forest_name}: "+text_description,style: style,),
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