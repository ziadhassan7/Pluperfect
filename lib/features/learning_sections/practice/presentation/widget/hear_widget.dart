import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/app_widgets/text_view/text_view.dart';
import '../../../../../core/styles/color_theme.dart';
import '../../../common/animation/speaking_animation.dart';
import '../cubit/hear_quote_cubit.dart';

class HearWidget extends StatefulWidget {
  const HearWidget(this.statement, {super.key, required this.color});

  final String statement;
  final Color color;

  @override
  State<HearWidget> createState() => _HearWidgetState();
}

class _HearWidgetState extends State<HearWidget> {

  bool isRepeatApplicable = true;


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => context.read<HearQuoteCubit>().start(widget.statement));
  }

  @override
  Widget build(BuildContext context) {

    bool isSpeaking = context.watch<HearQuoteCubit>().state;

    if(isSpeaking){
      return speakingWidget(widget.statement);

    } else {
      return idleWidget(widget.statement);
    }
  }

  Widget speakingWidget(String statement){
    return SpeakingAnimation(color: widget.color,);
  }

  Widget idleWidget(String statement){
    return Column(
      children: [
        const TextView("Repeat what you heard!", scale: TypeScale.headline2,),

        const SizedBox(height: 20,),

        Visibility(
          visible: isRepeatApplicable,

          child: repeatAgain(),
        )
      ],
    );
  }

  Widget repeatAgain(){

    Color color = ColorTheme.isDark ? Colors.white : widget.color;

    return Row(
      children: [
        const Spacer(),

        TextView("Didn't get it? Repeat Once", color: color, scale: TypeScale.description,),

        const Spacer(),

        IconButton(
            onPressed: (){
              context.read<HearQuoteCubit>().start(widget.statement);
              //do not repeat again
              isRepeatApplicable = false;
            },
            icon: Icon(Icons.repeat_one_rounded, color: color,)
        )
      ],
    );
  }
}
