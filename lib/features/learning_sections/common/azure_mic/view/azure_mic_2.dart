import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:pluperfect/core/azure_speech/azure_model.dart';
import 'package:pluperfect/core/styles/color_theme.dart';
import 'package:pluperfect/core/styles/padding.dart';
import '../cubit/mic_cubit.dart';
import '../cubit/mic_states.dart';

class AzureMic2 extends StatefulWidget {
  const AzureMic2({super.key, required this.onResponse});

  final Function(AzureModel) onResponse;

  @override
  State<AzureMic2> createState() => _AzureMic2State();
}

class _AzureMic2State extends State<AzureMic2> with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: (details){
        context.read<AzureMicCubit>().listen();
      },
      onPanEnd: (details){
        context.read<AzureMicCubit>().stop();
      },

      child: BlocBuilder<AzureMicCubit, MicStates>(
          builder: (context, state) {

            //Listening...
            if(state is ListeningState){
              return stopButton();
            }

            //Response
            if(state is IdleState){
              if(state.response != null){
                //trigger a score widget
                widget.onResponse(state.response!);
              }
              return idleButton();
            }

            //Loading
            if(state is LoadingState){
              return const CircularProgressIndicator();
            }

            //Idle
            return idleButton();
          }
      ),
    );
  }

  Widget stopButton(){
    return button('assets/animations/listening.json', true);
    //Lottie.asset('assets/animations/blue.json'),
    //Lottie.asset('assets/animations/blue_good.json'),
    //Lottie.asset('assets/animations/cortona.json'),
    //Lottie.asset('assets/animations/red_mic.json'),
    //Lottie.asset('assets/animations/listening.json'),
    //Lottie.asset('assets/animations/loading.json'),
    //Lottie.asset('assets/animations/mic.json'),
  }

  Widget idleButton(){
    return Padding(
      padding: const CustomPadding.all(20),
      child: SvgPicture.asset('assets/speak.svg',),
    );
  }

  Widget button(String icon, bool shouldAnimate){
    return Lottie.asset(
      icon,
      height: 140, width: 140, fit: BoxFit.fill,
      animate: shouldAnimate,
      frameRate: FrameRate.max,

      delegates: LottieDelegates(
        values: [
          ValueDelegate.color(
            const ['pill top', '**'],
            value: ColorTheme.green,
          ),
          ValueDelegate.color(
            const ['pill down', '**'],
            value: ColorTheme.green,
          ),
          ValueDelegate.color(
            const ['base', '**'],
            value: ColorTheme.green,
          ),
          ValueDelegate.color(
            const ['Half rign', '**'],
            value: ColorTheme.green,
          ),
          ValueDelegate.color(
            const ['01', '**'],
            value: ColorTheme.green,
          ),
          ValueDelegate.color(
            const ['02', '**'],
            value: ColorTheme.green,
          ),
          ValueDelegate.color(
            const ['03', '**'],
            value: ColorTheme.green,
          ),
          ValueDelegate.color(
            const ['04', '**'],
            value: ColorTheme.green,
          ),
          ValueDelegate.color(
            const ['transparent1', '**'],
            value: ColorTheme.green,
          ),
          ValueDelegate.color(
            const ['transparent2', '**'],
            value: ColorTheme.green,
          ),
        ],
      ),

      /* controller: _controller,
        onLoaded: (composition) {
          // Configure the AnimationController
          _controller
            ..duration = composition.duration
            ..forward();
        },*/


    );
  }
}
