import 'dart:io';
import 'package:path_provider/path_provider.dart';

class FileUtil {

  static Future<String> getAppPath() async {
    Directory? directory = await getExternalStorageDirectory();
    return directory!.path;
    //return (await getApplicationDocumentsDirectory()).path;
  }

  static Future<bool> deleteFile(String path) async {
    File file = File(path);

    try {
      await file.delete();
      return true;
    } catch (e) {
      return false;
    }
  }

}