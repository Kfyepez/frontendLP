import 'package:flutter/material.dart';
import 'package:proyectolpbackend/homePage.dart';
import 'package:proyectolpbackend/registerPage.dart';

class LoginPage extends StatelessWidget {

  final usercontroller = TextEditingController();
  final passcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                        if (usercontroller.text == "admin" &&
                            passcontroller.text == "admin") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        } else {
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