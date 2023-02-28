import 'dart:async';
import 'package:floor/floor.dart';
import 'package:flutterprueba/entity/serie.dart';
import 'package:flutterprueba/entity/serie_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;



part 'database.g.dart';

@Database(version:1, entities: [Serie])
abstract class AppDatabase extends FloorDatabase {
  SerieDao get serieDao;

}