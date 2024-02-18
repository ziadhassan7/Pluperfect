import 'package:flutter/material.dart';
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
  final IconData icon;
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
          icon: Icon(
              widget.icon,
              size: 25,
              semanticLabel: widget.semanticLabel,
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
          : const SizedBox.shrink()
      ],
    );
  }
}
