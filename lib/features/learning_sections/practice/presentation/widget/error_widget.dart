import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluperfect/core/app_widgets/text_view/text_view.dart';
import '../cubit/practice_cubit.dart';
import '../screens/practice_page.dart';

class ErrorMessageWidget extends StatelessWidget {
  const ErrorMessageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: InkWell(
            onTap: ()=> context.read<PracticeCubit>().refresh(section: PracticePage.section),
            child: const TextView("An Error Occurred. Try to refresh", color: Colors.red,)));
  }
}
