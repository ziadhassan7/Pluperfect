import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluperfect/features/learning_sections/common/steps_widget/cubit/steps_cubit.dart';
import 'context_menu/context_menu.dart';

class ClosePageController {

  static exit(BuildContext context, ){
    //close any context menu opened
    closeContextMenu();
    //reset the steps
    resetPageSteps(context);
  }

  static closeContextMenu(){
    ContextMenu.close();
  }

  static resetPageSteps(BuildContext context){
    context.read<StepsCubit>().reset();
  }

}