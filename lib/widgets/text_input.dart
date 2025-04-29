import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login/inputborder.dart';

class TextInput extends StatelessWidget {
  final String title;
  final TextInputType? type;
  final bool? isObscure;
  final bool? readonly;
  final Icon? prefixIcon;
  final TextInputAction? textInputAction;
  final Function(String)? onChanged;

  const TextInput(this.title,
      {this.type,
      this.isObscure,
      this.onChanged,
      this.textInputAction,
      this.readonly,
      this.prefixIcon,
      super.key});

  @override
  Widget build(BuildContext context) {
    int? maxLines = type == TextInputType.multiline ? 10 : 1;
    return TextField(
      style: const TextStyle(height: 0.9),
      decoration: InputDecoration(
        labelText: title,
        border: InputBorderTile.inputborder(),
        enabledBorder: InputBorderTile.inputborder(),
        focusedBorder: InputBorderTile.focusborder(),
        labelStyle: const TextStyle(color: Colors.black),
        prefixIcon: prefixIcon,
      ),
      keyboardType: type ?? TextInputType.text,
      inputFormatters: type == TextInputType.number
          ? [
              FilteringTextInputFormatter.digitsOnly,
            ]
          : null,
      obscureText: isObscure ?? false,
      onChanged: onChanged,
      textInputAction: textInputAction ?? TextInputAction.next,
      readOnly: (readonly ?? false),
      maxLines: maxLines,
    );
  }
}
