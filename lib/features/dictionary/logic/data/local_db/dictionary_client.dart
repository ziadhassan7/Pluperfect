import 'package:sqflite/sqflite.dart';
import '../../../../../core/constants/db_constants/dictionary_db_constanst.dart';
import '../../../../../core/sql/sql_client.dart';
import '../../model/dictionary_model.dart';

class DictionaryClient {

  static final DictionaryClient instance = DictionaryClient._init();

  DictionaryClient._init();

/// Create
  Future<void> createItem(DictionaryModel bookModel) async {
    final db = await SqlClient.instance.database;

    try{
      db!.insert(
        tableDictionary,
        bookModel.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      print("Sql insert");
    } catch (e) {
      print("Sql error");
    }
  }

/// Update
  Future<void> updateItem(DictionaryModel dicModel, {String? oldId}) async {
    final db = await SqlClient.instance.database;

    db!.update(
      tableDictionary,
      dicModel.toMap(),
      where: '$columnDicId = ?',
      whereArgs: [oldId ?? dicModel.id],
    );
  }

/// Delete
  Future<void> deleteItem(String? id) async {
    final db = await SqlClient.instance.database;

    db!.delete(
      tableDictionary,
      where: '$columnDicId = ?',
      whereArgs: [id],
    );
  }

/// Delete
  Future<void> deleteAllItem() async {
    final db = await SqlClient.instance.database;

    db!.delete(
      tableDictionary,
    );
  }


// Read One Element
  Future<DictionaryModel> readOneElement(String? id) async {
    final db = await SqlClient.instance.database;

    final data = await db!.query(
      tableDictionary,
      where: '$columnDicId = ?',
      whereArgs: [id],
    );

    return data.isNotEmpty
        ? DictionaryModel.fromMap(data.first)
        : throw Exception('There is no data');
  }


// Read All Elements
  Future<List<DictionaryModel>> readAllElements() async {
    final db = await SqlClient.instance.database;

    final data = await db!.query(tableDictionary);

    return data.isNotEmpty
        ? data.map((item) => DictionaryModel.fromMap(item)).toList()
        : [];
  }

}