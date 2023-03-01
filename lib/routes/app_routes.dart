import '../models/menu_option.dart';
import '../views/views.dart';

class AppRoutes{

  static const initialRoute= 'home_screen';

  static final menuOptions =<MenuOption>[
    MenuOption(route: 'cards_screen', name: 'CardsScreen', screen: const CardsScreen()),
    //MenuOption(route: 'second_screen', name: 'SecondScreen', screen: const CardsScreen()),
    MenuOption(route: 'home_screen', name: 'HomeScreen', screen: const HomeScreen()),

  ];


  static Map<String, Widget Function(BuildContext)> getAppRoutes(){

    Map<String, Widget Function(BuildContext)> appRoutes={};
    appRoutes.addAll({ 'home_screen':(BuildContext context)=> const HomeScreen() });
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