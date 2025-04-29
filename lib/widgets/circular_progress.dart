import 'package:flutter/material.dart';

class CircularProgress extends StatelessWidget {
  final Color color;

  const CircularProgress(this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(color),
        strokeWidth: 3,
      ),
    );
  }
}
