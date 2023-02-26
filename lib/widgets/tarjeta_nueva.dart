import '../views/views.dart';

class TarjetaNueva extends StatelessWidget {
  const TarjetaNueva({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
          children: [
            ListTile(
                leading: Icon(Icons.photo_album_outlined, color: Colors.blueAccent,),
                title: Text("patata")
            ),
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: (){},
                      child: Text("Ok"),

                  ),
                  TextButton(onPressed: (){},
                      child: Text("Cancel")
                  ),
                ],
              ),
            )
          ],
        )
    );
  }
}