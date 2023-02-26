import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertScreen extends StatelessWidget {
  const AlertScreen({Key? key}) : super(key: key);

  void displayDialogAndroid(BuildContext context){
   showDialog(
      barrierDismissible: true, //Esto es para cerrar el dialogo desde la sombra, no hace falta pulsar botón
        context: context,
        builder: (context){
           return AlertDialog(
             elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.circular(20)),
              title: Text("hola"),
              content:Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("ni idea como va esto"),
                  SizedBox(height: 20,),
                  FlutterLogo()
                ],
              ),
             actions: [
               TextButton(
                 style: TextButton.styleFrom(
                   foregroundColor: Colors.pink
                 ),
                   onPressed: ()=>Navigator.pop(context),
                   child: Text("Cancelar"))
             ],
            );
        }
    );
  }
  void displayDialogIos(BuildContext context){
    showCupertinoDialog(
      barrierDismissible: true,
        context: context,
        builder: (context){
          return CupertinoAlertDialog(
            title: Text("hola"),
            content:Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("ni idea como va esto"),
                SizedBox(height: 20,),
                FlutterLogo(size: 50,)
              ],
            ),
            actions: [
              TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.pink
                  ),
                  onPressed: ()=>Navigator.pop(context),
                  child: Text("Cancelar")),
              TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.blueAccent
                  ),
                  onPressed: ()=>Navigator.pop(context),
                  child: Text("Aceptar"))
            ],
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
        child: ElevatedButton(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text("pulsame fuerte, por favor",
                style: TextStyle(
                fontSize: 15
                )
              ),
            ),
            //Si no vull que funcione el pose a null i au
            //onPressed: ()=>displayDialogAndroid(context),
          onPressed: ()=> Platform.isIOS
              ? displayDialogIos(context)
              : displayDialogAndroid(context)
           )
      ),
      floatingActionButton: FloatingActionButton(
       child: const Icon(Icons.close),
        onPressed: () {
         Navigator.pushNamed(context, "listview2");
         //Navigator.pop para volver a la pantalla anterior. Com no tinc he gastat el pushNamed
        },

      ),
    );
  }
}
