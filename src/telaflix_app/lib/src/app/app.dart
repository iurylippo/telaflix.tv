import 'package:flutter/material.dart';

import '../features/splash/presentation/splash_screen.dart';
import 'theme/app_theme.dart';

class TelaflixApp extends StatelessWidget {
  const TelaflixApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Telaflix.TV',
      theme: AppTheme.light,
      home: const SplashScreen(),
    );
  }
}
