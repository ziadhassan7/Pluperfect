import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/styles/padding.dart';
import '../../../common/azure_mic/view/azure_mic_button.dart';
import '../cubit/hear/hear_cubit.dart';
import '../views/hear_box.dart';

class HearPage extends StatelessWidget {
  const HearPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(250, 251, 255, 1), //rgba(250, 251, 255, 1)

      body: SafeArea(
        child: Stack(
          children: [

            Padding(
              padding: const CustomPadding(vertical: 24, horizontal: 38),

              child: Column(
                children: [

                  ///Top Widget
                  Padding(
                    padding: const CustomPadding(bottom: 20, horizontal: 8),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(Icons.close_rounded, color: black, size: 28,)),

                        //const Center(child: ScreenProgressBar(),),
                      ],
                    ),
                  ),


                  /// Quotes
                  const HearBox(),

                  //const ScoreWidget(), //your score

                  const Spacer(),

                  AzureMicButton(
                    onResponse: (userInput){
                      //trigger a score widget
                      context.read<HearCubit>().score(userInput);
                    },
                  ),

                  /// Navigation
                  //BottomNavigation(level),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
