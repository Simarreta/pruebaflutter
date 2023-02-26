import '../views/views.dart';

class TarjetaNueva2 extends StatelessWidget {

  //Aquí pongo los elementos que se van a pedir cuando se llama a este widget
  final String imgUrl;
  final String? textoImagen;

  const TarjetaNueva2({
    Key? key,
    required this.imgUrl,
    this.textoImagen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //PARA ARREGLAR FOTOS
    return Card(
      //tant el clip com el shape son per a fer els bordes de la carta
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      //El elevation y el shadowColor es para la sombra de baix
      elevation: 30,
        shadowColor: Colors.blueAccent,
        child: Column(
          children:  [
             FadeInImage(
              image: NetworkImage(imgUrl),
              placeholder: AssetImage('img/jar-loading.gif'),
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
              fadeInDuration: Duration(milliseconds: 300),
            ),
            Container(
              alignment: AlignmentDirectional.centerEnd,
              padding: EdgeInsets.only(right: 20,top: 10, bottom: 10),
                child: Text(textoImagen ?? 'No title' ),
            )


          ],
        ),
    );
  }
}
