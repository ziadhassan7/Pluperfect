import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/app_widgets/text_view/text_view.dart';
import '../../../../../core/styles/color_theme.dart';
import '../../../common/animation/speaking_animation.dart';
import '../cubit/speaking_cubit.dart';

class HearWidget extends StatefulWidget {
  const HearWidget(this.statement, {super.key});

  final String statement;

  @override
  State<HearWidget> createState() => _HearWidgetState();
}

class _HearWidgetState extends State<HearWidget> {

  bool isRepeatApplicable = true;


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => context.read<SpeakingCubit>().speak(widget.statement));
  }

  @override
  Widget build(BuildContext context) {

    bool isSpeaking = context.watch<SpeakingCubit>().state;

    if(isSpeaking){
      return speakingWidget(widget.statement);

    } else {
      return idleWidget(widget.statement);
    }
  }

  Widget speakingWidget(String statement){
    return SpeakingAnimation(color: ColorTheme.blue2,);
  }

  Widget idleWidget(String statement){
    return Column(
      children: [
        const TextView("Repeat what you heard!", scale: TypeScale.headline2,),

        const SizedBox(height: 20,),

        Visibility(
          visible: isRepeatApplicable,

          child: Row(
            children: [
              const Spacer(),

              TextView("Didn't get it? Repeat Once", color: ColorTheme.blue2, scale: TypeScale.description,),

              const Spacer(),

              IconButton(
                  onPressed: (){
                    context.read<SpeakingCubit>().speak(widget.statement);
                    //do not repeat again
                    isRepeatApplicable = false;
                  },
                  icon: Icon(Icons.repeat_one_rounded, color: ColorTheme.blue2,)
              )
            ],
          ),
        )
      ],
    );
  }
}
