import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FavoriteButton();
  }
}

class _FavoriteButton extends State<FavoriteButton> {

  bool _pressed = false;

  void _onPressedFav() {
    /*String mensaje="Agregaste a favorito";
    if(_pressed){
      mensaje="Eliminaste de favorito";
    }
    Scaffold.of(context).showSnackBar(
        SnackBar(content: Text(mensaje))
    );*/

    setState(() {
      _pressed = !this._pressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FloatingActionButton(
      backgroundColor: Colors.white,
      mini: true,
      tooltip: "Fav",
      onPressed: _onPressedFav,
      child: this._pressed ? Icon(Icons.favorite,color: Colors.red,) : Icon(Icons.favorite_border,color: Colors.red,)
    );
  }

}