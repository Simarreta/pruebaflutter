import 'package:flutterprueba/models/menu_option.dart';

import '../models/menu_option.dart';
import '../views/second_screen.dart';
import '../views/cards_screen.dart';
import '../views/views.dart';

class AppRoutes{

  static const initialRoute= 'cards_screen';

  static final menuOptions =<MenuOption>[
    MenuOption(route: 'cards_screen', name: 'CardsScreen', screen: const CardsScreen(),icon: Icons.add),
    MenuOption(route: 'second_screen', name: 'SecondScreen', screen: const CardsScreen(),icon: Icons.add),

  ];


  static Map<String, Widget Function(BuildContext)> getAppRoutes(){

    Map<String, Widget Function(BuildContext)> appRoutes={};
    appRoutes.addAll({ 'cards_screen':(BuildContext context)=> const CardsScreen() });
    for(final option in menuOptions){
          appRoutes.addAll({ option.route:(BuildContext context)=> option.screen });
    }
    return appRoutes;
  }


/*
  static Route<dynamic> onGenerateRoute( RouteSettings settings){
      print("no existe la ruta y voy aqui");
      return MaterialPageRoute(builder: (context)=> const AlertScreen());
  }*/

}