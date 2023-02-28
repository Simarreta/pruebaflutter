import '../views/views.dart';

class TarjetaNueva extends StatelessWidget {

  final String imgUrl;
  final String? textoImagen;
  final double heigh;

  const TarjetaNueva({
    Key? key,
    required this.heigh,
    required this.imgUrl,
    this.textoImagen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      elevation: 30,
        shadowColor: Colors.blueAccent,
        child: Column(
          children:  [
             FadeInImage(
              image: NetworkImage(imgUrl),
              placeholder: AssetImage('img/jar-loading.gif'),
              width: double.infinity,
              height: heigh,
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
