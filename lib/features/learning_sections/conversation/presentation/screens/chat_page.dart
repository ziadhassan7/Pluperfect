import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluperfect/core/styles/color_theme.dart';
import 'package:pluperfect/features/learning_sections/conversation/presentation/view/chat_bottom_toolbar.dart';
import 'package:pluperfect/features/learning_sections/conversation/presentation/view/chat_response_box.dart';
import 'package:pluperfect/features/learning_sections/conversation/presentation/view/chat_timer/chat_timer.dart';
import '../../../../../core/styles/padding.dart';
import '../../../common/close_page_controller.dart';
import '../../../common/exit_button.dart';
import '../../../common/steps_widget/steps_widget.dart';
import '../cubit/chat_cubit.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  final Color color = ColorTheme.blue;
  final int numberOfSteps= 6;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) =>
        context.read<ChatCubit>().openInteraction()
    );
  }

  @override
  Widget build(BuildContext context){

    return PopScope(
      canPop: true,
      onPopInvoked: (didPop){
        ClosePageController.exit(context);
      },

      child: Scaffold(
        backgroundColor: ColorTheme.background,

        body: SafeArea(
          child: Center(
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    ///Top Bar
                    Padding(
                      padding: const CustomPadding(top: 26, bottom: 12, horizontal: 38),
                      child: Expanded(
                        child: Row(
                          children: [
                            const ExitButton(),

                            StepsWidget(numberOfSteps: numberOfSteps, color: color),
                          ],
                        ),
                      ),
                    ),

                    ///Chat Response Box
                    ChatResponseBox(color),


                    const Spacer(),

                  ],
                ),

                ///Bottom Bar & Timer
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ChatTimer(color: color,),

                      ChatBottomToolbar(color, maximumSteps: numberOfSteps,),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


}
