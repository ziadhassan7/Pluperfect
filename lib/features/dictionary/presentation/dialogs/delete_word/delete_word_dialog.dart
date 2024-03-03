import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modern_dialog/modern_dialog.dart';
import 'package:pluperfect/core/app_widgets/text_view/text_view.dart';
import 'package:pluperfect/core/styles/color_theme.dart';
import 'package:pluperfect/features/dictionary/presentation/cubit/dictionary_cubit.dart';

class DeleteWordDialog {

  DeleteWordDialog.show(BuildContext context, String word){
    ModernDialog.showStandard(
        context,
        backgroundColor: ColorTheme.onBackground,
        content: TextView("Are you sure you want to delete \"$word\"?"),
        buttonTitle: "Delete",
        mainButtonColor: ColorTheme.red,
        onAccept: () {
          context.read<DictionaryCubit>().delete(word);
        }
    );
  }

}