import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _logoScale;

  static const double _boneSize = 50;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2300),
    );

    _logoScale = Tween<double>(begin: 0.96, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.0,
          0.18,
          curve: Curves.easeOutBack,
        ),
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Offset _getBoneOffset(double progress) {
    // These are the LEFT positions of the bone image.
    // They are adjusted so the CENTER of the bone sits above each letter.
    final letterXPositions = <double>[
      40,  // first P
      108, // U
      174, // second P
      240, // third P
      305, // A
    ];

    final totalJumps = letterXPositions.length - 1;
    final scaledProgress = progress * totalJumps;

    final currentIndex = scaledProgress.floor().clamp(0, totalJumps - 1);
    final nextIndex = currentIndex + 1;

    final localProgress = scaledProgress - currentIndex;

    final startX = letterXPositions[currentIndex];
    final endX = letterXPositions[nextIndex];

    final x = startX + ((endX - startX) * localProgress);

    // Jump arc.
    final jumpHeight = math.sin(localProgress * math.pi) * 28;

    // Lower value = bone goes higher.
    // This keeps it floating above the letters instead of touching them.
    final y = -18 - jumpHeight;

    return Offset(x, y);
  }

  @override
  Widget build(BuildContext context) {
    const double logoBoxWidth = 390;
    const double logoBoxHeight = 180;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: ScaleTransition(
          scale: _logoScale,
          child: SizedBox(
            width: logoBoxWidth,
            height: logoBoxHeight,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                final boneProgress = CurvedAnimation(
                  parent: _controller,
                  curve: const Interval(
                    0.18,
                    1.0,
                    curve: Curves.easeInOut,
                  ),
                ).value;

                final boneOffset = _getBoneOffset(boneProgress);

                return Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.center,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Text(
                              'PUPPA',
                              style: TextStyle(
                                fontFamily: 'Heyam',
                                fontSize: 122,
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 2.6
                                  ..color = AppColors.darkBrown,
                              ),
                            ),
                            const Text(
                              'PUPPA',
                              style: TextStyle(
                                fontFamily: 'Heyam',
                                fontSize: 122,
                                color: AppColors.brown,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Positioned(
                      left: boneOffset.dx,
                      top: boneOffset.dy,
                      child: Transform.rotate(
                        angle: -0.25,
                        child: Image.asset(
                          'assets/icons/bone.png',
                          width: _boneSize,
                          height: _boneSize,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}