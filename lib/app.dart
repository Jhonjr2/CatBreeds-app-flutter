import 'package:prueba_tecnica/core/theme/app_theme.dart';
import 'package:prueba_tecnica/features/cat_breeds/presentation/pages/splash_page.dart';
import 'package:flutter/material.dart';

class CatBreedsApp extends StatelessWidget {
  const CatBreedsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cat Breeds',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const SplashPage(),
    );
  }
}
