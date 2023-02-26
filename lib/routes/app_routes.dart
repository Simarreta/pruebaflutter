import 'package:flutterprueba/models/menu_option.dart';

import '../models/menu_option.dart';
import '../views/alert_screen.dart';
import '../views/cards_screen.dart';
import '../views/listview_builder_screen.dart';
import '../views/listview_screen.dart';
import '../views/views.dart';

class AppRoutes{

  static const initialRoute= 'home';

  static final menuOptions =<MenuOption>[
    MenuOption(route: 'listview', name: 'ListView', screen: const ListaVistas(),icon: Icons.add),
    MenuOption(route: 'listview2', name: 'ListView2', screen: const ListaVistas2(),icon: Icons.add),
    MenuOption(route: 'alert_screen', name: 'AlertScreen', screen: const AlertScreen(),icon: Icons.add),
    MenuOption(route: 'cards_screen', name: 'CardsScreen', screen: const CardsScreen(),icon: Icons.add),
    MenuOption(route: 'listviewbulider_screen', name: 'InfinitiveScroll', screen: const ListViewBuilderScreen(),icon: Icons.add),


  ];


  static Map<String, Widget Function(BuildContext)> getAppRoutes(){

    Map<String, Widget Function(BuildContext)> appRoutes={};
    appRoutes.addAll({ 'home':(BuildContext context)=> const Home() });
    for(final option in menuOptions){
          appRoutes.addAll({ option.route:(BuildContext context)=> option.screen });
    }
    return appRoutes;
  }



  static Route<dynamic> onGenerateRoute( RouteSettings settings){
      print("no existe la ruta y voy aqui");
      return MaterialPageRoute(builder: (context)=> const AlertScreen());
  }

}