import 'package:flutterprueba/views/views.dart';
import 'package:animated_background/animated_background.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  AnimatedBackground(
        behaviour: RandomParticleBehaviour(),
          vsync: this,
          child: Padding(
            padding: EdgeInsets.only(top: 600,left: 100),
            child: ElevatedButton(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text("Empieza la aplicación",
                      style: TextStyle(
                          fontSize: 15
                      )
                  ),
                ),
                //Si no vull que funcione el pose a null i au
                //onPressed: ()=>displayDialogAndroid(context),
                onPressed: ()=> Navigator.pushNamed(context, "cards_screen")
            ),
          )
          )
      );
  }
}
