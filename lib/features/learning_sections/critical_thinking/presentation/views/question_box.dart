import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluperfect/core/app_widgets/text_view/text_view.dart';
import 'package:pluperfect/features/learning_sections/common/decoration_container.dart';
import 'package:pluperfect/features/learning_sections/critical_thinking/presentation/cubit/questions/question_states.dart';
import '../cubit/questions/question_cubit.dart';

class QuestionBox extends StatefulWidget {
  const QuestionBox({super.key});

  @override
  State<QuestionBox> createState() => _QuestionBoxState();
}

class _QuestionBoxState extends State<QuestionBox> {

  @override
  void initState() {
    super.initState();
    //Initial quote
    WidgetsBinding.instance
        .addPostFrameCallback((_) => context.read<QuestionCubit>().refresh());
  }

  @override
  Widget build(BuildContext context) {

    return DecorationContainer(
        child: BlocBuilder<QuestionCubit, QuestionStates>(
          builder: (context, state){


            if(state is LoadingState){
              return const Center(child: CircularProgressIndicator(),);
            }

            if(state is ResponseState){
              return TextView(state.question, scale: TypeScale.headline1,);
            }

            return const SizedBox.shrink();
          },
      )
    );
  }
}
