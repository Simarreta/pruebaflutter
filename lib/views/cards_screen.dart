import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutterprueba/views/second_screen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

import '../entity/serie.dart';
import '../widgets/tarjeta_nueva2.dart';

class CardsScreen extends StatefulWidget {
  const CardsScreen({Key? key}) : super(key: key);

  @override
  State<CardsScreen> createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {

  List<Serie> series =[];

  Future<void> seriesPopulares() async {
    final String url = 'https://api.themoviedb.org/3/tv/popular?api_key=c6aeee577586ba38e487b74dfede5deb&language=en-US&page=1';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // La petición fue exitosa, decodifica el JSON y accede a los datos
      final responseBody = json.decode(response.body);
      final List<dynamic> results = responseBody['results'];

      // Crea una lista de objetos Serie y agrega cada serie a la lista
      final List<Serie> series = [];
      for (var result in results) {
        final String first_air_date = result ['first_air_date'];
        final int id = result ['id'];
        final String name = result ['name'];
        final String original_language = result ['original_language'];
        final String overview = result ['overview'];
        final double popularity = result ['popularity'];
        final String poster_path = result ['poster_path'];
        //final dynamic vote_average = result ['vote_average'];
        final Serie serie = Serie(first_air_date: first_air_date, id: id, name: name, original_language: original_language, overview: overview, popularity: popularity, poster_path: poster_path);
        series.add(serie);
      }

      // Actualiza el estado del widget con la lista de series
      setState(() {
        this.series = series;
      });
    } else {
      // La petición falló, puedes manejar el error aquí
      throw Exception('Error en la petición GET: ${response.statusCode}');
    }
  }

  @override
  void initState() {
    super.initState();
    seriesPopulares();
  }


  alert(){
    debugPrint("Hola");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: ListView.builder(
            itemCount: series.length,
            itemBuilder: (context, int index) {
              final serie = series[index];
              return Column(
              children:[
                const SizedBox(height: 20,),
                GestureDetector(
                  onTap: (){ final route= MaterialPageRoute(
                      builder:(context)=> SegundaPantalla(
                          name: serie.name,
                          poster_path: 'https://image.tmdb.org/t/p/w500/${serie.poster_path}',
                          elementosSerie: {
                          'Año Emision': serie.first_air_date,
                          'Lenguaje Original': serie.original_language,
                          'Popularidad': serie.popularity,
                          'Descripción': serie.overview,
                          },
                       ),
                      );
                    Navigator.push(context, route);
                       },
                  child: TarjetaNueva2(imgUrl: 'https://image.tmdb.org/t/p/w500/${serie.poster_path}', textoImagen: '${serie.name}', heigh: 300,),
                  )
                 ],
              );
            },
          ),
        )
    );
  }

}
