
import 'hotel.dart';
class Information_Forest extends StatefulWidget{
  String name;

  String url_img_portada;
  String description;
  double score;
  int likes;
  int views;
  List<String> imagenes;
  List<Hotel> hoteles;
  List<String> rutas;


  Information_Forest(this.name,this.description,this.url_img_portada, this.score, this.likes, this.views,this.imagenes,this.hoteles,this.rutas);

  @override
  State<Information_Forest> createState() => _Information_ForestState();
}

class _Information_ForestState extends State<Information_Forest> {
  int page=1;
  Widget getStars(){
    int piso=widget.score.floor();
    List<Widget> items=[];
    for(int i=0;i<piso;i++){
      items.add(Icon(Icons.star, color: Colors.yellow,));
    }
    if(piso!=widget.score){
      items.add(Icon(Icons.star_half,color: Colors.yellow,));
    }
    return Row( mainAxisAlignment:MainAxisAlignment.center,children: items,);
  }
  Widget galery(){
    List<Widget> images=[];
    for(String image in widget.imagenes){
      images.add(
          Image(
              image: NetworkImage(
                image
              )
          )
      );
    }

    return Expanded(
      child: GridView.count(
        crossAxisCount: 3,
        children: images,
      ),
    );
  }
  Widget hoteles(){
    Widget horizontal_space=SizedBox(
      width: 10,
    );
    List<Widget> info=[];
    TextStyle style=TextStyle(
        decoration: TextDecoration.none,
        fontSize: 20,
        fontFamily: "PoiretOne",
        color: Colors.black
    );
    for(Hotel hotel in widget.hoteles){
      info.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.house_rounded,size: 30,),
            horizontal_space,
            Column(
              children: [
                Text(hotel.name,style: style),
                Text("Contact: ${hotel.phone}",style: style),
                SizedBox(
                  height: 30,
                )
              ],
            )
          ],
        )
      );
    }
    return Expanded(
        child: ListView(
          //crossAxisCount: 1,
          children: info,
        ),
      );
  }
  Widget rutas(){
    List<Widget> info=[];
    TextStyle style=TextStyle(
        decoration: TextDecoration.none,
        fontSize: 20,
        fontFamily: "PoiretOne",
        color: Colors.black
    );
    int cont=1;
    for(String transport in widget.rutas){
      info.add(
          Column(
            children: [
              Text("Ruta ${cont}", style: style,),
              Text("Path: ${transport}.....",style: style,),
              Text("Time travel: 2 hours",style: style,),
              SizedBox(
              height: 30,
            )
            ],
          )
      );
    }
    return Expanded(
      child: ListView(
        //crossAxisCount: 1,
        children: info,
      ),
    );
  }
  Widget body(){
    switch (page){
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
    Widget name_forest=Text(widget.name, style: TextStyle(
        decoration: TextDecoration.none,
        fontWeight: FontWeight.w100,
        fontSize: 50,
        fontFamily: "PoiretOne",
        color: Colors.black
    ),);
    // TODO: implement build

    Widget photo=Container(
      width: 200,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Image(
            image: NetworkImage(widget.url_img_portada)
        ),
      ),
    );
    Widget vertical_space=SizedBox(
      height: 10,
    );
    Widget horizontal_space=SizedBox(
      width: 10,
    );
  TextStyle style=TextStyle(
    decoration: TextDecoration.none,
      fontSize: 20,
      fontFamily: "PoiretOne",
      color: Colors.black
  );

    Widget navigation=Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(child: Icon(Icons.grid_on, color: page==1?Colors.blue:Colors.black,),onTap: (){ setState(() {
            page=1;
          });},),
          GestureDetector(child: Icon(Icons.hotel, color: page==2?Colors.blue:Colors.black,),onTap: (){ setState(() {
    page=2;
    });}),
          GestureDetector(child: Icon(Icons.directions_car, color: page==3?Colors.blue:Colors.black,),onTap: (){ setState(() {
    page=3;
    });}),

        ]);
    Widget separador=Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide( //                    <--- top side
            color: Colors.black,
            width: 1.0,
          ),
        ),
      ),
    );
    Widget description=Container(
      child: Flexible(
        child: Text(widget.description,style: TextStyle(
            decoration: TextDecoration.none,
            fontSize: 15,
            fontFamily: "PoiretOne",
            color: Colors.black54
        ),),
      ),
    );
    Widget info= new Column(

      children: [
        name_forest,
        vertical_space,
        photo,
        vertical_space,
        description,
        Text(
            "${widget.score} de 5 estrellas",
          style: style,
        ),
        vertical_space,
        getStars(),
        vertical_space,
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [Text("${widget.likes} likes",style: style,), Text("${widget.views} views",style: style,)],),
        vertical_space,
        separador,
        vertical_space,
        navigation,
        vertical_space,
        separador,
        body()
      ],

    );


   return Container( alignment: Alignment.center,child: info,);
  }
