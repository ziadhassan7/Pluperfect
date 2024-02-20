import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluperfect/core/app_widgets/text_view/text_view.dart';
import 'package:pluperfect/core/styles/color_theme.dart';
import 'package:pluperfect/features/learning_sections/conversation/presentation/view/bottom_navigation.dart';
import '../../../../../core/styles/padding.dart';
import '../../../common/animation/speaking_animation.dart';
import '../../../common/exit_button.dart';
import '../../../common/steps_widget/steps_widget.dart';
import '../view/loading_animation.dart';
import '../cubit/chat_cubit.dart';
import '../cubit/chat_state.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  final Color color = ColorTheme.blue;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) =>
        context.read<ChatCubit>().openInteraction()
    );
  }

  @override
  Widget build(BuildContext context){

    return Scaffold(
      backgroundColor: ColorTheme.background,

      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              ///Top Bar
              Padding(
                padding: const CustomPadding(top: 26, bottom: 12, horizontal: 38),
                child: Row(
                  children: [
                    const ExitButton(),

                    StepsWidget(numberOfSteps: 6, color: color),
                  ],
                ),
              ),

              ///Chat Box
              Padding(
                padding: const CustomPadding(vertical: 45, horizontal: 25),

                child: BlocBuilder<ChatCubit, ChatStates>(
                    builder: (context, state) {

                      if(state is LoadingState){

                        return const Center(child: LoadingAnimation(),);
                      }

                      if(state is SpeakState){

                        return speakWidget();
                      }

                      if(state is ResponseState){
                        return TextView(state.input ?? "", scale: TypeScale.headline3,);
                      }

                      return const SizedBox.shrink();
                    }
                ),
              ),


              /// Bottom View
              const Spacer(),


              BottomNavigation(color),
            ],
          ),
        ),
      ),
    );
  }

  Widget speakWidget(){
    return const SpeakingAnimation(size: 400,);
  }

}
