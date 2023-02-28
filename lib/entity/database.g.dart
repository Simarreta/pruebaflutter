// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  SerieDao? _serieDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `series` (`id` INTEGER NOT NULL, `first_air_date` TEXT NOT NULL, `name` TEXT NOT NULL, `original_language` TEXT NOT NULL, `overview` TEXT NOT NULL, `popularity` REAL NOT NULL, `poster_path` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  SerieDao get serieDao {
    return _serieDaoInstance ??= _$SerieDao(database, changeListener);
  }
}

class _$SerieDao extends SerieDao {
  _$SerieDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _serieInsertionAdapter = InsertionAdapter(
            database,
            'series',
            (Serie item) => <String, Object?>{
                  'id': item.id,
                  'first_air_date': item.first_air_date,
                  'name': item.name,
                  'original_language': item.original_language,
                  'overview': item.overview,
                  'popularity': item.popularity,
                  'poster_path': item.poster_path
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Serie> _serieInsertionAdapter;

  @override
  Future<List<Serie>> findAllSeries() async {
    return _queryAdapter.queryList('SELECT * FROM series',
        mapper: (Map<String, Object?> row) => Serie(
            first_air_date: row['first_air_date'] as String,
            id: row['id'] as int,
            name: row['name'] as String,
            original_language: row['original_language'] as String,
            overview: row['overview'] as String,
            popularity: row['popularity'] as double,
            poster_path: row['poster_path'] as String));
  }

  @override
  Stream<Serie?> findSerieById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM Person WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Serie(
            first_air_date: row['first_air_date'] as String,
            id: row['id'] as int,
            name: row['name'] as String,
            original_language: row['original_language'] as String,
            overview: row['overview'] as String,
            popularity: row['popularity'] as double,
            poster_path: row['poster_path'] as String),
        arguments: [id],
        queryableName: 'Person',
        isView: false);
  }

  @override
  Future<void> insertSerie(Serie serie) async {
    await _serieInsertionAdapter.insert(serie, OnConflictStrategy.abort);
  }
}
