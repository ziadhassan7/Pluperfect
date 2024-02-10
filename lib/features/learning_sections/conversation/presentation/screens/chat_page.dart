import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluperfect/core/app_widgets/text_view/text_view.dart';
import 'package:pluperfect/core/styles/color_theme.dart';
import 'package:pluperfect/core/styles/padding.dart';
import 'package:pluperfect/features/learning_sections/common/listening_animation.dart';
import 'package:pluperfect/features/learning_sections/common/mic/azure_mic/view/azure_mic.dart';
import 'package:pluperfect/features/learning_sections/common/mic/openai_mic/view/mic_button.dart';
import 'package:pluperfect/features/learning_sections/common/speaking_animation.dart';
import '../cubit/chat_cubit.dart';
import '../cubit/chat_state.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

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

      body: Padding(
        padding: const CustomPadding(vertical: 10, horizontal: 25),

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              BlocBuilder<ChatCubit, ChatStates>(
                  builder: (context, state) {

                    if(state is IdleState){
                      return const TextView("Start Speaking!", scale: TypeScale.headline3,);
                    }

                    if(state is ListenState){
                      return listenWidget();
                    }

                    if(state is ResponseState){
                      return TextView(state.input ?? "", scale: TypeScale.headline3,);
                    }

                    return const Center(child: CircularProgressIndicator(),);
                  }
              ),


              AzureMic(
                onResponse: (userInput) {
                  //trigger a score widget
                  context.read<ChatCubit>().startListening();
                },
                color: ColorTheme.blue,),
            ],
          ),
        ),
      ),
    );
  }


  Widget listenWidget(){
    return SpeakingAnimation(color: ColorTheme.blue);
  }
}
