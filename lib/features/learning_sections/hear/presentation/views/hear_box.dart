import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluperfect/core/styles/color_theme.dart';
import '../../../../../core/app_widgets/text_view/text_view.dart';
import '../../../../../core/styles/padding.dart';
import '../../../common/decoration_container.dart';
import '../../../common/speaking_animation.dart';
import '../cubit/hear/hear_cubit.dart';
import '../cubit/hear/hear_states.dart';

class HearBox extends StatefulWidget {
  const HearBox({super.key});

  @override
  State<HearBox> createState() => _HearBoxState();
}

class _HearBoxState extends State<HearBox> {

  @override
  void initState() {
    super.initState();
    //Initial quote
    WidgetsBinding.instance
        .addPostFrameCallback((_) => context.read<HearCubit>().refresh());
  }


  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const CustomPadding(vertical: 20, horizontal: 38),

      child: DecorationContainer(
        child: BlocBuilder<HearCubit, HearStates>(
          builder: (context, state){

            //Loading
            if(state is LoadingState){

              return const Center(child: CircularProgressIndicator(),);
            }

            //Speaking
            if(state is SpeakingState){

              return SpeakingAnimation(color: ColorTheme.green,);
            }

            //Idle
            if(state is IdleState){

              return const TextView("Repeat what you heard!", scale: TypeScale.headline2,);
            }


            return const SizedBox.shrink();

          },
        ),
      ),
    );
  }
}
