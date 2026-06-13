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
    this.controller,
    this.validator,
  });

  final String hintText;
  final IconData icon;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      style: const TextStyle(
        fontFamily: 'GoogleSansFlex',
        fontSize: 15,
        color: AppColors.darkBrown,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontFamily: 'GoogleSansFlex',
          fontSize: 13,
          color: AppColors.darkBrown.withValues(alpha: 0.45), // updated
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
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            color: Color(0xFFFF9999), 
            width: 1.2,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            color: Color(0xFFFF9999), 
            width: 1.6,
          ),
        ),
        errorStyle: const TextStyle(
          fontFamily: 'GoogleSansFlex',
          fontWeight: FontWeight.w600,
          fontSize: 11,
          color: Color(0xFFFF9999), 
        ),
      ),
    );
  }
}