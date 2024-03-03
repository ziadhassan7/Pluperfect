import 'package:flutter/material.dart';

class SnackBarUtil {

  SnackBarUtil.show(BuildContext context, {required String message}){
    ScaffoldMessenger
        .of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }


}