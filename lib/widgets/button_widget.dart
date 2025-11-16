import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.buttonText,
    this.onPressed,
    this.btnBorderRadius,
    this.side,
    this.btnBackgroundColor,
    this.fontColor,
    this.fontWeight,
    this.fontSize,
  });

  final String buttonText;
  final void Function()? onPressed;
  final double? btnBorderRadius;
  final BorderSide? side;
  final Color? fontColor;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? btnBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: btnBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(btnBorderRadius ?? 4.0),
          side: side ?? BorderSide(),
        ),
      ),
      child: Text(
        buttonText,
        style: TextStyle(
          color: fontColor,
          fontWeight: fontWeight ?? FontWeight.normal,
          fontSize: fontSize ?? 12.0,
        ),
      ),
    );
  }
}
