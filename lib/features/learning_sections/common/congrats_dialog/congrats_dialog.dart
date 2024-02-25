import 'package:flutter/cupertino.dart';
import '../../../../core/custom_dialog/custom_dialog.dart';
import 'congratulation_dialog_view.dart';
import 'learning_sections_buttons.dart';

class CongratsDialog {

  final LearningSections currentPage;

  CongratsDialog(BuildContext context, {required this.currentPage}){

    CustomDialog(context, dismissible: false,
        view: CongratulationDialogView(currentPage: currentPage,));
  }

}