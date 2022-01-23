import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  final usercontroller = TextEditingController();
  final passcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text('Inicio'), actions: <Widget>[
        IconButton(
            icon: const Icon(Icons.more_vert),
            tooltip: 'Actualizando',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Actualizando ventana')));
            }),
      ]),

      drawer: Drawer(
          child: ListView(padding: EdgeInsets.zero, children: <Widget>[
            DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                ),
                child: Text('Menú',
                    style: TextStyle(color: Colors.white, fontSize: 20))),
            ListTile(
              leading: Icon(Icons.login),
              title: Text('Iniciar sesión'),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Redirigiendo a página de inicio de sesión')));
              },
            ),
            ListTile(
              leading: Icon(Icons.app_registration),
              title: Text('Registrarse'),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Redirigiendo a formulario de registro')));
              },
            ),
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
              title: Text('Salir'),
              onTap: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text('Saliendo')));
              },
            ),
          ])),

      body: Center(
        child: Column(
          children: [
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

                    //Con este comando se redirigirá a la pagina que ustedes creen
                    /*Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Nombre de la clase creada()),
                    );*/

                  },
                  child: Text('Parte Santiago'),
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

                    //Con este comando se redirigirá a la pagina que ustedes creen
                    /*Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Nombre de la clase creada()),
                    );*/

                  },
                  child: Text('Parte Andrea'),
                ))
          ],
        ),
        
      ),
    );

  }
}