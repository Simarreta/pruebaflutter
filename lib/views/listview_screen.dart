import 'package:flutter/material.dart';

class ListaVistas extends StatelessWidget {

  const ListaVistas({Key? key}) : super(key: key);

  final frases= const["hola","buenas"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ...frases.map((e) => ListTile(
                leading: Icon(Icons.add),
                title: Text(e),
            trailing: Icon(Icons.arrow_forward),
            onTap: (){
                 /* final route= MaterialPageRoute(builder: (context)=> const ListaVistas2());
                  Navigator.push(context, route);*/

              Navigator.pushNamed(context, 'listview2'); //El nombre viene de las rutas del main
            },
            //Navigatior.pushReplacement vale para hacer un login si estás auntenticado y no volver a ver el login

            )
          ).toList()
          /*ListTile(
            leading: Icon(Icons.add),
            title: Text("hola"),
          )*/
        ],
      )
    );
  }
}
