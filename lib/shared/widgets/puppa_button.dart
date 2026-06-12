import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

class PuppaButton extends StatelessWidget {
  const PuppaButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.backgroundColor = AppColors.brown,
    this.textColor = AppColors.yellow,
    this.height = 56,
  });

  final String label;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
            side: const BorderSide(
              color: AppColors.darkBrown,
              width: 1.4,
            ),
          ),
        ),
        child: Transform.translate(
          offset: const Offset(0, 3), // nudges text down to fix font baseline
          child: Text(
            label,
            textAlign: TextAlign.center, // ensures horizontal center
            style: const TextStyle(
              fontFamily: 'Heyam',
              fontSize: 32,
              letterSpacing: 1,
            ),
          ),
        ),
      ),
    );
  }
}