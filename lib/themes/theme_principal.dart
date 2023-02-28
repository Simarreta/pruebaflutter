import '../views/views.dart';



class ThemePrincipal{

  static const Color primary= Colors.green;
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(primary: primary)
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
     backgroundColor: Colors.amber
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent,
        shape: StadiumBorder()
      )
    ),


  );


  static final ThemeData darkTheme = ThemeData.dark().copyWith(
      primaryColor: Colors.redAccent,
      appBarTheme: const AppBarTheme(
          color: Colors.redAccent,
          elevation:0
      ),
      scaffoldBackgroundColor: Colors.black, //El fondo de la app

      elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
            backgroundColor: Colors.redAccent,
                shape: StadiumBorder()
            )
      ),

  );



}