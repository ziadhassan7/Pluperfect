import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/app_widgets/text_view/text_view.dart';
import '../../../common/decoration_container.dart';
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

    HearStates state = context.watch<HearCubit>().state;


    /*return DecorationContainer(
      child: BlocBuilder(),
    );*/

    //Loading
    if(state is LoadingState){

      return const Center(child: CircularProgressIndicator(),);
    }

    //Speaking
    if(state is SpeakingState){

      return DecorationContainer(
        child: TextView(state.response, scale: TypeScale.headline2,),
      );
    }

    //Idle
    if(state is IdleState){

      return const DecorationContainer(
        child: TextView("Repeat what you heard!", scale: TypeScale.headline2,),
      );
    }


    return const SizedBox.shrink();
  }
}
