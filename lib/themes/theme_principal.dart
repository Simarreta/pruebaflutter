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
        backgroundColor: Colors.purple,
        shape: StadiumBorder()
      )
    ),


  );


  static final ThemeData darkTheme = ThemeData.dark().copyWith(
      primaryColor: Colors.redAccent,


    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.redAccent
    ),

      elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
                shape: StadiumBorder()
            )
      ),

  );



}