import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

class PuppaTextField extends StatelessWidget {
  const PuppaTextField({
    super.key,
    required this.hintText,
    required this.icon,
    this.obscureText = false,
    this.suffixIcon,
    this.keyboardType,
  });

  final String hintText;
  final IconData icon;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      keyboardType: keyboardType,
      style: const TextStyle(
        fontFamily: 'GoogleSansFlex',
        fontSize: 15,
        color: AppColors.darkBrown,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontFamily: 'GoogleSansFlex',
          fontSize: 13, // made placeholder smaller
          color: AppColors.darkBrown.withOpacity(0.45),
        ),
        prefixIcon: Icon(
          icon,
          color: AppColors.yellow,
          size: 20,
        ),
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: AppColors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 16,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            color: AppColors.darkBrown,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            color: AppColors.brown,
            width: 1.6,
          ),
        ),
      ),
    );
  }
}