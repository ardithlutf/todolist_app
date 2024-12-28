import 'package:flutter/material.dart';

class TextErrorWidget extends StatelessWidget {
  final String errorMsg;
  final TextStyle style;

  const TextErrorWidget(
      {super.key, required this.errorMsg, required this.style});

  @override
  Widget build(BuildContext context) {
    return Text(errorMsg, style: style);
  }
}
