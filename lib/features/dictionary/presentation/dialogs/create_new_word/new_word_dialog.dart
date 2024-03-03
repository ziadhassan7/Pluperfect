import 'package:flutter/cupertino.dart';
import 'package:modern_dialog/modern_dialog.dart';
import 'package:pluperfect/core/styles/color_theme.dart';
import 'new_word_dialog_view.dart';

class NewWordDialog{

  NewWordDialog.show(BuildContext context){
    ModernDialog.showCustom(
      context,
      backgroundColor: ColorTheme.onBackground,
      view: const NewWordDialogView(),
    );
  }

}