import 'package:flutter/material.dart';
import 'package:proyectolpbackend/homePage.dart';
import 'package:proyectolpbackend/loginPage.dart';

class RegisterPage extends StatelessWidget {

  final emailcontroller = TextEditingController();
  final usercontroller = TextEditingController();
  final passcontroller = TextEditingController();
  final passcontroller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text('Formulario de registro'), actions: <Widget>[
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
                      controller: emailcontroller,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.email),
                        labelText: 'Correo Electrónico:',
                      ),
                      onSaved: (String? value) {
                        // This optional block of code can be used to run
                        // code when the user saves the form.
                      },
                    )),
                Container(
                    padding: EdgeInsets.fromLTRB(10, 20, 30, 10),
                    child: TextFormField(
                      controller: usercontroller,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        labelText: 'Nombre de Usuario:',
                      ),
                      onSaved: (String? value) {
                        // This optional block of code can be used to run
                        // code when the user saves the form.
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
                      ),
                      onSaved: (String? value) {
                        // This optional block of code can be used to run
                        // code when the user saves the form.
                      },
                    )),
                Container(
                    padding: EdgeInsets.fromLTRB(10, 20, 30, 10),
                    child: TextFormField(
                      controller: passcontroller2,
                      obscureText: true,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.password),
                        labelText: 'Repetir Contraseña:',
                      ),
                      onSaved: (String? value) {
                        // This optional block of code can be used to run
                        // code when the user saves the form.
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
                        if (emailcontroller.text != "" && usercontroller.text != "" && passcontroller.text != "" &&passcontroller2.text != "") {
                          if(passcontroller.text == passcontroller2.text) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Registro exitoso")));
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()),
                            );
                          } else{
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Las contraseñas no coinciden")));
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Faltan campos por completar")));
                        }
                      },
                      child: Text('Registrarse'),
                    )),
                Container(
                    padding: EdgeInsets.fromLTRB(50, 20, 50, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('¿Ya tienes una cuenta?',
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
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()),
                            );
                          },
                          child: const Text(
                            'Logueate aquí',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ],
        ),
      ),
    );

  }
}