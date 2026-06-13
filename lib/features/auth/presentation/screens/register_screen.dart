import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../shared/widgets/puppa_button.dart';
import '../../../../shared/widgets/puppa_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();
  bool _showConfirmPassword = false;

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(() {
      final isValid = _passwordController.text.length >= 8;
      if (_showConfirmPassword != isValid) {
        setState(() {
          _showConfirmPassword = isValid;
        });
      }
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  void _handleSignUp() {
    if (_formKey.currentState!.validate()) {
      debugPrint('sign up valid'); // updated
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const Spacer(flex: 3),

              Stack(
                alignment: Alignment.center,
                children: [
                  Text(
                    'WELCOME TO',
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
                    'WELCOME TO',
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
                      color: AppColors.brown,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      PuppaTextField(
                        controller: _emailController,
                        hintText: 'email',
                        icon: Icons.email_rounded,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'please enter your email';
                          }
                          if (!value.contains('@')) {
                            return 'please enter a valid email';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 16),

                      PuppaTextField(
                        controller: _passwordController,
                        hintText: 'password',
                        icon: Icons.password_rounded,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.length < 8) {
                            return 'password must be at least 8 characters';
                          }
                          return null;
                        },
                      ),

                      AnimatedSize(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOut,
                        child: _showConfirmPassword
                            ? Column(
                                children: [
                                  const SizedBox(height: 16),
                                  PuppaTextField(
                                    controller: _confirmController,
                                    hintText: 'confirm password',
                                    icon: Icons.password_rounded,
                                    obscureText: true,
                                    validator: (value) {
                                      if (value != _passwordController.text) {
                                        return 'passwords do not match';
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              )
                            : const SizedBox.shrink(),
                      ),

                      const SizedBox(height: 60), 

                      PuppaButton(
                        label: 'SIGN UP',
                        backgroundColor: AppColors.brown,
                        textColor: AppColors.yellow,
                        height: 64,
                        onPressed: _handleSignUp,
                      ),
                    ],
                  ),
                ),
              ),

              const Spacer(flex: 2),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: TextStyle(
                      fontFamily: 'GoogleSansFlex',
                      fontSize: 13,
                      color: AppColors.brown.withValues(alpha: 0.8), // updated
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Stack(
                      children: [
                        Text(
                          'LOG IN',
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
                          'LOG IN',
                          style: TextStyle(
                            fontFamily: 'Heyam',
                            fontSize: 15,
                            color: AppColors.brown,
                          ),
                        ),
                      ],
                    ),
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