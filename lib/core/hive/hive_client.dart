import 'package:hive_flutter/hive_flutter.dart';
import '../constants/hive_keys.dart';

class HiveClient {

  final Box globalBox;

  static final HiveClient instance = HiveClient._init(); //singleton

  HiveClient._init() : globalBox = Hive.box(GLOBAL_DATA_BOX);


  //Call this on your main method
  static globalInitialize() async {
    await Hive.initFlutter();
    await Hive.openBox(GLOBAL_DATA_BOX);
  }
}