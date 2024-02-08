import 'package:flutter/material.dart';

enum FontFamily {
  sansation,
  sansation_light,
  comforta,
  notoSans,
}

class CustomText extends StatelessWidget {
  final String text;
  final double? size;
  final FontWeight? weight;
  final Color? color;
  final int? maxLine;
  final bool? softWrap;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final double scale;
  final FontFamily? fontFamily;
  static FontFamily? defaultFontFamily;

  const CustomText(
      this.text,
      {
        Key? key,
        this.size,
        this.weight,
        this.color,
        this.maxLine,
        this.softWrap,
        this.overflow = TextOverflow.ellipsis,
        this.textAlign = TextAlign.start,
        this.textDirection,
        this.scale = 1,
        this.fontFamily
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,

      textAlign: textAlign,
      maxLines: maxLine,
      softWrap: softWrap,
      textDirection: textDirection,
      overflow: overflow,

      style: getTheme(
        size: (size!=null)? size!*scale : size,
        weight: weight,
        color: color,
      ),

    );
  }

  TextStyle getTheme({double? size, FontWeight? weight, Color? color}){

    //get default font
    FontFamily? currentFamily = defaultFontFamily;

    //override, if provided a font family
    if(fontFamily != null){
      currentFamily = fontFamily;
    }


    switch (currentFamily) {
    //Comforta
      case FontFamily.comforta:
        return TextStyle(fontFamily: 'Comforta', fontSize: size, fontWeight: weight, color: color);
    //Sansation
      case FontFamily.sansation:
        return TextStyle(fontFamily: 'Sansation', fontSize: size, fontWeight: weight, color: color);
    //Sansation Light
      case FontFamily.sansation_light:
        return TextStyle(fontFamily: 'Sansation', fontSize: size, fontWeight: FontWeight.w300, color: color);
    //Noto Sans
      case FontFamily.notoSans:
        return TextStyle(fontFamily: 'NotoSans', fontSize: size, fontWeight: weight, color: color);

    //default - null
      case null:
        return TextStyle(fontSize: size, fontWeight: weight, color: color);
    }

  }

}