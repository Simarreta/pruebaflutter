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
    runApp( const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.getAppRoutes(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.system
    );
  }
}
