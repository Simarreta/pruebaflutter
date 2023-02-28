import '../views/views.dart';

class TextoEditable extends StatelessWidget {

  String textoPrincipal, textoSerie;
  IconData icono;

  TextoEditable({
    Key? key,
    required this.textoPrincipal,
    required this.textoSerie,
    required this.icono
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
          children: [
            ListTile(
                leading: Icon(icono, color: Colors.blueAccent,),
                title: Text("$textoPrincipal: $textoSerie")
            ),

          ],
        )
    );
  }
}