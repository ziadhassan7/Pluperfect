import 'package:flutter_bloc/flutter_bloc.dart';


class QuoteCubit extends Cubit<bool>{
  QuoteCubit() : super(false);


  toggle() {

  }


  save() {

  }

  delete() {

  }

  /*static Future<ShareIntentStatus> addBook(WidgetRef ref, String? filePath) async {

    // dismiss if filePath is empty
    if(filePath == null) return ShareIntentStatus.failure;


    //--------------
    String fileName = basename(filePath).replaceAll(".pdf", "");

    // check for duplicates
    if(await _isDuplicate(fileName) == false) {
      String newPath = await FileUtil.copyFile(File(filePath));

      model = BookModel(
          id: fileName,
          path: newPath,
          bookmarks: null,
          lastPage: 0,
          totalPages: await _getTotalPages(newPath),
          category: "[]",
          addDate: DateTime.now().toString(),
          completeDate: null,
          isComplete: 0,
          lastReadDate: null
      );

      bookClient.createItem(model);
      ref.read(bookListProvider.notifier).listFiles();

      return ShareIntentStatus.success;

    } else {
      return ShareIntentStatus.alreadyAdded;
    }
  }

  static Future<bool> _isDuplicate(String fileName) async {
    List<DictionaryModel> all = await bookClient.readAllElements();

    for(int i =0; i<all.length; i++) {
      if (all[i].id == fileName) return true;
    }

    return false;
  }*/


}
