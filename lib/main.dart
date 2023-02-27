import 'package:flutterprueba/routes/app_routes.dart';
import 'package:flutterprueba/themes/theme_principal.dart';
import 'package:flutter/services.dart';
import 'views/views.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp( const MyApp());
  });

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.getAppRoutes(),
     // onGenerateRoute: AppRoutes.onGenerateRoute,
      /*no hace falta poner la variable porque es la misma en los dos onGenerateRoute*/
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemePrincipal.lightTheme,
    );
  }
}
