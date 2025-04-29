import 'package:flutter/material.dart';

class InputBorderTile {
  static OutlineInputBorder inputborder() {
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide(
          width: 1.5,
        ));
  }

  static OutlineInputBorder focusborder() {
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide(
          width: 1.5,
        ));
  }
}
