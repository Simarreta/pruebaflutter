import 'package:floor/floor.dart';
//entity/serie.dart

@Entity(tableName: 'series')
class Serie {

  @primaryKey
   final int id;

   final String first_air_date;
   final String name;
   final String original_language;
   final String overview;
   final double popularity;
   final String poster_path;
   //final double vote_average;

  Serie({
    required this.first_air_date,
    required this.id,
    required this.name,
    required  this.original_language,
    required  this.overview,
    required  this.popularity,
    required  this.poster_path,
    //required  this.vote_average
  });


}