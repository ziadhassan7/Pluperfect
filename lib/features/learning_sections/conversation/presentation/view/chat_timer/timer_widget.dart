import 'dart:async';
import 'package:flutter/material.dart';
import 'package:linear_timer/linear_timer.dart';
import '../../../../../../core/app_widgets/text_view/text_view.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget(this.color, {super.key,});

  final Color color;

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  int _timerCounter = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    //start the timer, update second counts every second
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        // Update the counter every second
        _timerCounter++;
      });
    });
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    _timer.cancel();
    _timerCounter = 0;

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [

          ///Text Timer
          TextView("00:${getTime(_timerCounter)}", color: widget.color,),

          ///Liner Timer
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearTimer(
              color: widget.color,
              minHeight: 18,
              duration: const Duration(seconds: 30),),
          ),
        ],
      ),
    );
  }

  String getTime(int timer){
    return timer<10? "0$timer" : "$timer";
  }
}
