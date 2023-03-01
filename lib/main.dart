import 'package:flutterprueba/routes/app_routes.dart';
import 'package:flutterprueba/themes/theme_principal.dart';
import 'package:flutter/services.dart';
import 'views/views.dart';

/**
 * Created by
 * Programador: Ana
 *
 * Este archivo pertenece a la aplicación realizada por Ana Guixart
 */

void main() {
    runApp( MaterialApp(home:MyApp()));

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final Brightness platformBrightness = MediaQuery.of(context).platformBrightness;
    final bool isDarkModeEnabled = platformBrightness == Brightness.dark;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.getAppRoutes(),
      title: 'Flutter Demo',
      theme:isDarkModeEnabled ? ThemePrincipal.darkTheme : ThemePrincipal.lightTheme
    );
  }
}
