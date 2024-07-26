import 'package:flutter/material.dart';

class BasicButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double? height;

  // final FontWeight ? fontWeight;

  const BasicButton(
      {required this.onPressed,
      required this.title,
      this.height,
      // this.fontWeight,
      super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(height ?? 80),
      ),
      onPressed: onPressed,
      child: Text(title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            // fontWeight: fontWeight ?? FontWeight.bold,
            fontSize: 19,
            color: Color(0xffF6F6F6),
          )),
    );
  }
}
