import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

toast(BuildContext context, TypeToast type, String? title, String? message,
    Icon? icon) async {
  Color color;
  Color messageColor = Colors.white;
  switch (type) {
    case TypeToast.success:
      color = Colors.green;
      break;
    case TypeToast.error:
      color = Colors.red;
      break;
    case TypeToast.warning:
      color = Colors.yellow;
      messageColor = Colors.black;
      break;
    case TypeToast.info:
      color = Theme.of(context).primaryColor;
      break;
  }
  await Flushbar(
    title: title,
    titleColor: messageColor,
    message: message,
    messageColor: messageColor,
    duration: const Duration(seconds: 3),
    flushbarPosition: FlushbarPosition.TOP,
    backgroundColor: color,
    margin: const EdgeInsets.all(8),
    borderRadius: BorderRadius.circular(8),
    icon: icon,
    shouldIconPulse: false,
  ).show(context);
}

enum TypeToast {
  success,
  error,
  warning,
  info,
}
