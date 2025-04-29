import 'package:flutter/material.dart';
import 'package:login/widgets/flush_bar.dart';

class ResponseActionButton{
  Object? response;
  String? messageError;
  TypeToast? typeToast;
  Icon? iconToast;

  ResponseActionButton(this.response, this.messageError, this.typeToast, this.iconToast);
}