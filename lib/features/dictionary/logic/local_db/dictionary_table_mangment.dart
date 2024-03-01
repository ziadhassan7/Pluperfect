import 'package:pluperfect/core/constants/db_constants/dictionary_db_constanst.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../core/constants/db_constants/general_config.dart';


class DictionaryTable {

  static create(Database db) async {
    await db.execute('''  
    CREATE TABLE $tableDictionary (
    $columnDicId $textType,
    $columnWord $textType,
    $columnTranslation $textType,
    $columnLanguageLocal $textType,
    )
    ''');
  }

  static upgrade(Database db, int oldVersion, int newVersion) async {

    //Migrate from version...

  }

}