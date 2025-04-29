import 'package:flutter/material.dart';
import 'package:login/widgets/circular_progress.dart';

class Button extends StatelessWidget {
  const Button(
      {required this.textButton,
      this.onPress,
      required this.color,
      this.height,
      this.width,
      this.textColor,
      this.isLoading,
      Key? key})
      : super(key: key);
  final String textButton;
  final Function()? onPress;
  final Color color;
  final Color? textColor;
  final double? height;
  final double? width;
  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    Color colorWidget = textColor ?? const Color.fromARGB(255, 35, 35, 35);
    final Color primaryColor = Theme.of(context).primaryColor;

    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPress,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (states.contains(MaterialState.disabled)) {
              return color.withOpacity(0.4); // Disabled color
            }
            return color; // Regular color
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        child: isLoading != null && isLoading == true
            ? CircularProgress(primaryColor)
            : FittedBox(
                child: Text(
                  textButton,
                  style: TextStyle(
                    color: colorWidget,
                  ),
                ),
              ),
      ),
    );
  }
}
