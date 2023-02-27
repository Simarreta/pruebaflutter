import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterprueba/widgets/tarjeta_nueva.dart';
import 'package:flutterprueba/widgets/tarjeta_nueva2.dart';

class SegundaPantalla extends StatelessWidget {
  Map<String,dynamic> elementosSerie;


  final String name,poster_path;

  SegundaPantalla({
    Key? key,
    required this.name,
    required this.poster_path,
    required this.elementosSerie,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              TarjetaNueva2(imgUrl: poster_path, textoImagen: name, heigh:400),
              ...elementosSerie.entries.map((elementSerie) => TextoEditable(
                textoPrincipal: elementSerie.key,
                textoSerie: elementSerie.value.toString(),
                icono: Icons.info_outlined
              )).toList(),
          ]
          )
        ),
      ),
      floatingActionButton: FloatingActionButton(
       child: const Icon(Icons.close),
        onPressed: () {
         Navigator.pop(context);
         //Navigator.pop para volver a la pantalla anterior. Com no tinc he gastat el pushNamed
        },

      ),
    );
  }
}
