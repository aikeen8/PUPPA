import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../shared/widgets/puppa_button.dart';
import '../../../../shared/widgets/puppa_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.brown,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24), // wider space for big text
          child: Column(
            children: [
              const Spacer(flex: 3),

              Stack(
                alignment: Alignment.center,
                children: [
                  Text(
                    'WELCOME BACK TO',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Heyam',
                      fontSize: 24,
                      letterSpacing: 1.2,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 2.2
                        ..color = AppColors.darkBrown,
                    ),
                  ),
                  const Text(
                    'WELCOME BACK TO',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Heyam',
                      fontSize: 24,
                      letterSpacing: 1.2,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              Stack(
                alignment: Alignment.center,
                children: [
                  Text(
                    'PUPPA',
                    style: TextStyle(
                      fontFamily: 'Heyam',
                      fontSize: 124,
                      height: 0.75,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 3.2
                        ..color = AppColors.darkBrown,
                    ),
                  ),
                  const Text(
                    'PUPPA',
                    style: TextStyle(
                      fontFamily: 'Heyam',
                      fontSize: 124,
                      height: 0.75,
                      color: AppColors.yellow,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // wrapped form elements in extra padding to make them shorter
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Column(
                  children: [
                    const PuppaTextField(
                      hintText: 'email/username',
                      icon: Icons.person_rounded,
                    ),

                    const SizedBox(height: 16),

                    const PuppaTextField(
                      hintText: 'password',
                      icon: Icons.password_rounded,
                      obscureText: true,
                    ),

                    const SizedBox(height: 12),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: 20,
                              width: 20,
                              child: Checkbox(
                                value: false,
                                onChanged: (value) {},
                                activeColor: AppColors.yellow,
                                checkColor: AppColors.brown,
                                side: BorderSide(
                                  color: AppColors.white.withOpacity(0.95),
                                  width: 1.5,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'remember me',
                              style: TextStyle(
                                fontFamily: 'GoogleSansFlex',
                                fontSize: 12,
                                color: AppColors.white.withOpacity(0.95),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'forgot password?',
                          style: TextStyle(
                            fontFamily: 'GoogleSansFlex',
                            fontSize: 12,
                            color: AppColors.white.withOpacity(0.95),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 28),

                    PuppaButton(
                      label: 'LOG IN',
                      backgroundColor: AppColors.yellow,
                      textColor: AppColors.brown,
                      height: 64,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),

              const Spacer(flex: 2),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don’t have an account? ',
                    style: TextStyle(
                      fontFamily: 'GoogleSansFlex',
                      fontSize: 13,
                      color: AppColors.white.withOpacity(0.95),
                    ),
                  ),
                  Stack(
                    children: [
                      Text(
                        'REGISTER',
                        style: TextStyle(
                          fontFamily: 'Heyam',
                          fontSize: 15,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 1.8
                            ..color = AppColors.darkBrown,
                        ),
                      ),
                      const Text(
                        'REGISTER',
                        style: TextStyle(
                          fontFamily: 'Heyam',
                          fontSize: 15,
                          color: AppColors.yellow,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}