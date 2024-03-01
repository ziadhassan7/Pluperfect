import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pluperfect/core/styles/box_decoration.dart';
import 'nav_bar.dart';

class NavBarButton extends StatefulWidget {
  NavBarButton(
      {Key? key,
        this.label,
        required this.icon,
        required this.onTap,
        required this.index,
        this.colorSelected,
        this.colorUnSelected,
        this.semanticLabel,
      })
      : super(key: key);
  final String? label;
  final String icon;
  final Function(int index) onTap;
  final int index;
  Color? colorSelected;
  Color? colorUnSelected;
  String? semanticLabel;

  @override
  State<NavBarButton> createState() => _NavBarButtonState();
}

class _NavBarButtonState extends State<NavBarButton> {

  static int currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    widget.colorSelected ??= CustomNavBar.globalColorSelected;
    widget.colorUnSelected ??= CustomNavBar.globalColorUnSelected;

    bool selected = currentIndex == widget.index;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: (){
            widget.onTap(widget.index);

            setState(() {
              currentIndex = widget.index;
            });
          },
          icon: SvgPicture.asset(
              widget.icon,
              width: 28,
              semanticsLabel: widget.semanticLabel,
              color: selected
                  ? widget.colorSelected
                  : widget.colorUnSelected),
        ),

        (widget.label != null)
          ? Text(
            widget.label!,
            style: TextStyle(
              fontSize: 12,
              height: .1,
              color: selected
                ? widget.colorSelected
                : widget.colorUnSelected),)
          : const SizedBox.shrink(),


        Visibility(
          visible: selected,
          child: Container(
            height: 3,
            width: 6,
            decoration: CustomDecoration(
              radius: 4,
              backgroundColor: widget.colorSelected
            ),
          ),
        ),
      ],
    );
  }
}
