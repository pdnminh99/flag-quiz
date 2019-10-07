import 'package:flag_quiz/models/Country.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseConnector {
  Database _database;

  Future<bool> initializeConnector() async {
    this._database = await connectSQLite();
    if (this._database == null) return false;
    await this.insertCountry(new Country(name: 'Vietnam', flag: '../../assets/images/flag-of-Vietnam.png', continent: 'Asia'));
    await this.insertCountry(new Country(name: 'United State', flag: '../../assets/images/flag-of-United-States-of-America.png', continent: 'America'));
    await this.insertCountry(new Country(name: 'Congo', flag: '../../assets/images/flag-of-Congo.png', continent: 'Europe'));
    await this.insertCountry(new Country(name: 'Austria', flag: '../../assets/images/flag-of-Austria.png', continent: 'America'));
    return true;
  }

  Future<Database> connectSQLite() async {
    this._checkInitializer();
    return openDatabase(join(await getDatabasesPath(), 'country.db'),
        onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE country(id INTEGER AUTOINCREMENT PRIMARY KEY, name TEXT, flag TEXT, continent TEXT)",
      );
    }, version: 1);
  }

  Future<void> insertCountry(Country newCountry) async {
    this._checkInitializer();
    await this._database.insert('country', newCountry.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Country>> collectCountries() async {
    this._checkInitializer();
    final List<Map<String, dynamic>> maps =
        await this._database.query('country');
    return List.generate(maps.length, (i) {
      return Country(
        id: maps[i]['id'],
        name: maps[i]['name'],
        flag: maps[i]['flag'],
        continent: maps[i]['continent'],
      );
    });
  }

  void _checkInitializer() {
    if (this._database == null) {
      throw "Database connector is yet initialized;\nCall [DatabaseConnector].initializeConnector()";
    }
  }
}
