import 'package:flutter/material.dart';
import 'button.dart';

class CustomNavBar extends StatelessWidget {
  CustomNavBar(
      {Key? key,
      this.elevation = 0,
      this.height,
      this.padding,
      this.borderRadius = BorderRadius.zero,
      this.backgroundColor = Colors.white,
      this.foregroundColorSelected = Colors.black,
      this.foregroundColorUnSelected = Colors.grey,
      this.enableTint = false,
      required this.children})
      : super(key: key);

  final double elevation;
  final double? height;
  final EdgeInsets? padding;
  final BorderRadiusGeometry borderRadius;
  final Color backgroundColor;
  final Color foregroundColorSelected;
  final Color foregroundColorUnSelected;
  final bool enableTint;
  final List<NavBarButton> children;


  static late Color globalColorSelected;
  static late Color globalColorUnSelected;

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    CustomNavBar.globalColorSelected = foregroundColorSelected;
    CustomNavBar.globalColorUnSelected = foregroundColorUnSelected;


    return Material(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(33),
        topRight: Radius.circular(33),
      ),
      elevation: elevation,

      child: ClipRRect(
        borderRadius: borderRadius,

        child: BottomAppBar(
          surfaceTintColor: enableTint? null : Colors.transparent,
          height: height,
          color: backgroundColor,
          child: Padding(
            padding: padding ?? const EdgeInsets.only(left: 28, right: 28,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children,
            ),
          ),
        ),
      ),
    );
  }
}
