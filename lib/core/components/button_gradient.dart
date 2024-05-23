import 'package:flutter/material.dart';
import 'package:wifipos_web/core/constants/fonts.dart';

class ButtonGradient extends StatelessWidget {
  final String text;
  final double height;
  final double width;
  final VoidCallback onPressed;

  const ButtonGradient({
    required this.text,
    required this.onPressed,
    super.key,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xff9FE680), Color(0xff0CBAF9)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: AppFont.whiteText.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
        ),
      ),
    );
  }
}
