import '../views/views.dart';

class ThemePrincipal{

  static const Color primary= Colors.green;
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: Colors.indigo,
    appBarTheme: const AppBarTheme(
      color: Colors.indigo,
      elevation:0
    ),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(primary: primary)
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
     backgroundColor: Colors.amber
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.indigo,
        shape: StadiumBorder()
      )
    ),

    inputDecorationTheme: const InputDecorationTheme(
      floatingLabelStyle: TextStyle(
        color:primary
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: primary
        ),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),topRight: Radius.circular(10))
      ),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.purple
          ),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),topRight: Radius.circular(10))
      ),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),topRight: Radius.circular(10))
      )
    )



  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
      primaryColor: Colors.redAccent,
      appBarTheme: const AppBarTheme(
          color: Colors.redAccent,
          elevation:0
      ),
      scaffoldBackgroundColor: Colors.black //El fondo de la app

  );



}