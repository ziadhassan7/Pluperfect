import '../../model/dictionary_model.dart';
import '../local_db/dictionary_client.dart';

class DictionaryRepo {
  static final DictionaryClient _dicClient = DictionaryClient.instance;

  static Future<List<DictionaryModel>> getData() async {

    List<DictionaryModel> data = await _dicClient.readAllElements();

    print(data[2].id);

    return await _dicClient.readAllElements();
  }

  static Future<DictionaryModel> readItem(String id) async {

    return await _dicClient.readOneElement(id);
  }

  static void deleteItem(String id) async {

    return await _dicClient.deleteItem(id);
  }
}