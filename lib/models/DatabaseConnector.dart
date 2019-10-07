import 'package:flag_quiz/models/Country.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseConnector {

  Future<Database> _connectSQLite() async {
    String path = join(await getDatabasesPath(), 'country.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        print("SQLite created");
        await db.execute(
          "CREATE TABLE country(id INTEGER PRIMARY KEY, name TEXT, flag TEXT)",
        );
        await db.rawInsert(
          "INSERT INTO country(id, name, flag) VALUES(1, 'Vietnam', 'assets/images/flag-of-Vietnam.png')"
        );
        await db.rawInsert(
          "INSERT INTO country(id, name, flag) VALUES(2, 'United States', 'assets/images/flag-of-United-States-of-America.png')"
        );
        await db.rawInsert(
          "INSERT INTO country(id, name, flag) VALUES(3, 'United Kingdom', 'assets/images/flag-of-United-Kingdom.png')"
        );
        await db.rawInsert(
          "INSERT INTO country(id, name, flag) VALUES(4, 'Chile', 'assets/images/flag-of-Chile.png')"
        );
      },
    );
  }

  // Future<void> insertCountry(Country newCountry) async {
  //   this._checkInitializer();
  //   await this._database.rawInsert(
  //       "INSERT INTO country(id, name, continent) VALUES(${newCountry.id}, ${newCountry.name}, ${newCountry.contintent})");
  // }

  Future<List<Country>> collectCountries() async {
    var database = await this._connectSQLite();
    List<Map> maps = await database.rawQuery("SELECT * FROM country");
    print("Print out database:\n");
    print(maps);
    var countries = List.generate(maps.length, (i) {
      return Country(
        id: maps[i]['id'].toString(),
        name: maps[i]['name'],
        flag: maps[i]['flag'],
        continent: maps[i]['continent'],
      );
    });
    await database.close();
    print(countries);
    return countries;
  }
}
