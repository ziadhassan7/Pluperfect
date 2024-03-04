import 'package:flutter/material.dart';
import 'package:pluperfect/core/app_widgets/text_view/custom_text.dart';
import 'package:pluperfect/core/constants/colors.dart';
import 'package:pluperfect/core/localization/localization.dart';
import 'package:pluperfect/core/styles/color_theme.dart';


enum TypeScale{
  small,
  caption,
  description,
  userInput,
  normal,
  headline1,
  headline2,
  headline3,
  arabic,
}

class TextView extends StatelessWidget {
  final String text;
  final Color? color;
  final TypeScale scale;
  final FontWeight? weight;
  final TextDirection? direction;

  const TextView(
    this.text, {
    Key? key,
    this.color,
    this.scale = TypeScale.normal,
    this.weight,
    this.direction,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return getText(context);
  }

  Widget getText(BuildContext context){

    switch (scale) {
    //Small
      case TypeScale.small:
        return CustomText(text, color: color ?? ColorTheme.text, weight: weight, size: 12, fontFamily: FontFamily.sansation, maxLine: 1000, textDirection: direction ?? getTextDirectionBasedOnLocal(context));
    //Caption
      case TypeScale.caption:
        return CustomText(text, color: color ?? grey, weight: weight, size: 14, fontFamily: FontFamily.sansation,  maxLine: 1000, textDirection: direction ?? getTextDirectionBasedOnLocal(context));
    //Description
      case TypeScale.description:
        return CustomText(text, color: color ?? ColorTheme.text, size: 16, fontFamily: FontFamily.sansation_light, maxLine: 1000,  textDirection: direction ?? getTextDirectionBasedOnLocal(context));
    //UserInput
      case TypeScale.userInput:
        return CustomText(text, color: grey, weight: weight, size: 16, fontFamily: FontFamily.sansation, maxLine: 1000, textDirection: direction ?? getTextDirectionBasedOnLocal(context));
    //Normal
      case TypeScale.normal:
        return CustomText(text, color: color ?? ColorTheme.text, weight: weight, size: 16, fontFamily: FontFamily.sansation, maxLine: 1000, textDirection: direction ?? getTextDirectionBasedOnLocal(context));
    //Headline1
      case TypeScale.headline1:
        return CustomText(text, color: color ?? ColorTheme.text, weight: weight, size: 18, fontFamily: FontFamily.sansation, maxLine: 1000, textDirection: direction ?? getTextDirectionBasedOnLocal(context));
    //Headline2
      case TypeScale.headline2:
        return CustomText(text, color: color ?? ColorTheme.text, weight: weight, size: 22, fontFamily: FontFamily.sansation, maxLine: 1000, textDirection: direction ?? getTextDirectionBasedOnLocal(context));
    //Headline3
      case TypeScale.headline3:
        return CustomText(text, color: color ?? ColorTheme.text, weight: FontWeight.bold, size: 25, fontFamily: FontFamily.comforta, maxLine: 1000, textDirection: direction ?? getTextDirectionBasedOnLocal(context));
    //Arabic
      case TypeScale.arabic:
        return CustomText(text, color: color ?? ColorTheme.text, weight: weight, size: 18, fontFamily: FontFamily.sansation, maxLine: 1000, textDirection: TextDirection.rtl,);
    }

  }


  getTextDirectionBasedOnLocal(BuildContext context){

    if(LocalizationHandler.getCurrentLocal(context) == const Locale('ar')){
      return TextDirection.rtl;

    } else {
      return TextDirection.ltr;
    }
  }
}
