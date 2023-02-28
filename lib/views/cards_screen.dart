import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutterprueba/views/second_screen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

import '../entity/database.dart';
import '../entity/serie.dart';
import '../widgets/tarjeta_nueva.dart';
import 'package:floor/floor.dart';

class CardsScreen extends StatefulWidget {
  const CardsScreen({Key? key}) : super(key: key);

  @override
  State<CardsScreen> createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {

  List<Serie> series =[];
  var database;


  Future<void> _loadData() async {
    final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    try {
      final series = await database.serieDao.findAllSeries();
      setState(() {
        this.series = series;
      });
    } catch (e) {
      print('Error al cargar los datos de la base de datos local: $e');
      final series = await seriesPopulares();
      setState(() {
        this.series = series;
      });
    }
  }

  Future<List<Serie>> seriesPopulares() async {
    final String url = 'https://api.themoviedb.org/3/tv/popular?api_key=c6aeee577586ba38e487b74dfede5deb&language=en-US&page=1';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      final List<dynamic> results = responseBody['results'];

      final List<Serie> series = [];
      for (var result in results) {
        final String firstAirDate = result['first_air_date'];
        final int id = result['id'];
        final String name = result['name'];
        final String originalLanguage = result['original_language'];
        final String overview = result['overview'];
        final double popularity = result['popularity'];
        final String posterPath = result['poster_path'];

        final Serie serie = Serie(
          first_air_date: firstAirDate,
          id: id,
          name: name,
          original_language: originalLanguage,
          overview: overview,
          popularity: popularity,
          poster_path: posterPath,
        );
        series.add(serie);
        await insertarSerie(serie);
      }

      return series;
    } else {
      throw Exception('Error en la petición GET: ${response.statusCode}');
    }
  }

  Future<void> insertarSerie(Serie serie) async {
    final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    await database.serieDao.insertSerie(serie);
  }

  @override
  void initState() {
    super.initState();
    _loadData();
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
                  child: TarjetaNueva(
                    imgUrl: 'https://image.tmdb.org/t/p/w500/${serie.poster_path}',
                    textoImagen: '${serie.name}', heigh: 500,),
                  )
                 ],
              );
            },
          ),
        )
    );
  }

}
