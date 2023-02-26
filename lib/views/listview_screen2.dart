import 'package:flutterprueba/models/menu_option.dart';
import 'package:flutter/material.dart';
import '../routes/app_routes.dart';

class ListaVistas2 extends StatelessWidget {

  const ListaVistas2({Key? key}) : super(key: key);

  final frases= const["estioy ","buenas", "genial"];

  @override
  Widget build(BuildContext context) {
    final menuOptions= AppRoutes.menuOptions;
    return Scaffold(
      //Builder y separated son iguales, pero uno tiene el separador y el otro no
      body: ListView.separated(
          itemCount: menuOptions.length,
          itemBuilder: (context, index) {
           return ListTile(

              leading: Icon(menuOptions[index].icon),
              title: Text(menuOptions[index].name),
              trailing: Icon(Icons.arrow_forward),
             onTap: ()=>{
                //print("hooa"),
              Navigator.pushNamed(context, menuOptions[index].route)
           }, /*Si al Tap le pongo null, es como deshabilitar*/
            );
          },
        /*las barras bajas es para no poner nada y que funcione aún así la función.
           cuando el elemento no es necesario, ponemos _*/
          separatorBuilder: (_,__) =>const Divider(), //El divider es para poner la raya entre menus.
                                                      //no me gusta

      )
    );
  }
}
