import 'package:flutterprueba/entity/language.dart';
import 'package:flutterprueba/views/views.dart';
import 'package:animated_background/animated_background.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {

  String firstLanguage = "en-US";
  var languages = ["en-US","es-ES"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  AnimatedBackground(
        behaviour: RandomParticleBehaviour(),
          vsync: this,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 500),
              child: Column(
                children: [
                  ElevatedButton(
                        child: const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text("Empieza la aplicación",
                              style: TextStyle(
                                  fontSize: 15
                              )
                          ),
                        ),
                        onPressed: ()=> Navigator.pushNamed(context, "cards_screen")
                    ),
                  const SizedBox(height: 20,),
                  DropdownButton(
                    value: firstLanguage,
                    icon: const Icon(Icons.keyboard_arrow_down),
                     items: languages.map((String languages) {
                       return DropdownMenuItem(
                           value: languages,
                           child: Text(languages),
                          );
                         }).toList(),
                      onChanged: (String? newValue){
                      setState(() {
                        firstLanguage= newValue!;
                        print(newValue);
                        idioma = newValue;
                      });
                      }
                  )
                ],
              ),
            ),
          ),

          )
      );
  }
}
