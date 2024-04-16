import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluperfect/features/learning_sections/conversation/presentation/view/thinking_animation.dart';
import '../../../../../core/app_widgets/text_view/text_view.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/styles/app_screen.dart';
import '../../../../../core/styles/color_theme.dart';
import '../../../../../core/styles/padding.dart';
import '../../../common/animation/speaking_animation.dart';
import '../cubit/chat_cubit.dart';
import '../cubit/chat_state.dart';

class ChatResponseBox extends StatelessWidget {
  const ChatResponseBox(this.color, {super.key});

  final Color color;

  @override
  Widget build(BuildContext context) {
    Color loadingWidgetColor = ColorTheme.isDark ? white: color;
    double screenHeight = AppScreen(context).height;

    return Container(
      height: screenHeight *0.7,
      padding: const CustomPadding(vertical: 45, horizontal: 25),

      child: SingleChildScrollView(

        child: BlocBuilder<ChatCubit, ChatStates>(
            builder: (context, state) {

              if(state is LoadingState){

                return Center(child: ThinkingAnimation(color: loadingWidgetColor,),);
              }

              if(state is SpeakState){

                return speakWidget(loadingWidgetColor);
              }

              if(state is ResponseState){
                return TextView(state.input ?? "", scale: TypeScale.comforta,);

              }

              return const SizedBox.shrink();
            }
        ),
      ),
    );
  }

  Widget speakWidget(Color color){
    return SpeakingAnimation(size: 400, color: color,);
  }
}
