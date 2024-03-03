import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../../features/dictionary/logic/data/local_db/dictionary_table_mangment.dart';


class SqlClient {

  static final SqlClient instance = SqlClient._init();

  SqlClient._init();


  static Database? _database;

  Future<Database>? get database async{

    if(_database != null) _database;

    _database = await _initDB();
    return _database!;
  }

  //initialize database
  Future<Database> _initDB() async{
    String path = join(await getDatabasesPath(), 'BookDatabase.db');
    return await openDatabase(path, version: 2, onCreate: _createDB, onUpgrade: _onUpgrade);
  }


  //create new db
  Future<void> _createDB(Database db, int version) async {
    // Book Table
    await DictionaryTable.create(db);
  }

  // This is called for users who have old db
  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    // Book Table
    await DictionaryTable.upgrade(db, oldVersion, newVersion);
  }
}