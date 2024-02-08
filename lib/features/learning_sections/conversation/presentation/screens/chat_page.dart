import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluperfect/core/app_widgets/text_view/text_view.dart';
import 'package:pluperfect/core/constants/colors.dart';
import 'package:pluperfect/core/styles/padding.dart';
import 'package:pluperfect/features/learning_sections/conversation/presentation/views/mic_button.dart';
import '../cubit/chat/chat_cubit.dart';
import '../cubit/chat/chat_state.dart';

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
      backgroundColor: backgroundLight,

      body: Padding(
        padding: const CustomPadding(vertical: 10, horizontal: 25),

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              BlocBuilder<ChatCubit, ChatStates>(
                  builder: (context, state) {

                    if(state is IdleState){
                      return const Text("Start Speaking!");
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


              const MicButton(),
            ],
          ),
        ),
      ),
    );
  }


  Widget listenWidget(){
    return Image.asset('assets/animations/user_speaking.gif');
  }
}
