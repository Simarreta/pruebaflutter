import 'package:floor/floor.dart';
import 'package:flutterprueba/entity/serie.dart';

@dao
abstract class SerieDao{

  @Query('SELECT * FROM series')
  Future<List<Serie>>findAllSeries();

  @Query('SELECT * FROM Person WHERE id = :id')
  Stream<Serie?> findSerieById(int id);

  @insert
  Future<void> insertSerie(Serie serie);

}