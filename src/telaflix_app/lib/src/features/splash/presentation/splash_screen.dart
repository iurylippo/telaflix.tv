import 'dart:async';

import 'package:flutter/material.dart';

import '../../home/presentation/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  static const _navigateDelay = Duration(seconds: 3);

  late final AnimationController _logoEntranceController;
  late final AnimationController _logoPulseController;
  late final Animation<double> _logoEntranceOpacity;
  late final Animation<double> _logoEntranceScale;
  late final Animation<double> _logoPulseScale;

  Timer? _navigationTimer;

  @override
  void initState() {
    super.initState();

    _logoEntranceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _logoPulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _logoEntranceOpacity = CurvedAnimation(
      parent: _logoEntranceController,
      curve: Curves.easeOutCubic,
    );
    _logoEntranceScale = Tween<double>(begin: 0.8, end: 1).animate(
      CurvedAnimation(
        parent: _logoEntranceController,
        curve: Curves.easeOutBack,
      ),
    );
    _logoPulseScale = Tween<double>(begin: 1, end: 1.04).animate(
      CurvedAnimation(parent: _logoPulseController, curve: Curves.easeInOut),
    );

    _logoEntranceController.forward();
    _logoPulseController.repeat(reverse: true);

    _navigationTimer = Timer(_navigateDelay, _openHomeScreen);
  }

  @override
  void dispose() {
    _navigationTimer?.cancel();
    _logoEntranceController.dispose();
    _logoPulseController.dispose();
    super.dispose();
  }

  void _openHomeScreen() {
    if (!mounted) return;

    Navigator.of(context).pushReplacement(
      PageRouteBuilder<void>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const HomeScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFF36E21), Color(0xFF07070A)],
          ),
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final logoWidth = (constraints.maxWidth * 0.85).clamp(
                240.0,
                520.0,
              );

              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FadeTransition(
                      opacity: _logoEntranceOpacity,
                      child: ScaleTransition(
                        scale: _logoEntranceScale,
                        child: ScaleTransition(
                          scale: _logoPulseScale,
                          child: Image.asset(
                            'assets/images/logo.png',
                            key: const Key('splash-logo'),
                            width: logoWidth,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    const SizedBox(
                      key: Key('splash-loader'),
                      width: 40,
                      height: 40,
                      child: CircularProgressIndicator(
                        strokeWidth: 4,
                        backgroundColor: Color(0x1AFFFFFF),
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Color(0xFFFFB3AE),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
