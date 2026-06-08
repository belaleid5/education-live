import 'package:education_live_app/core/theme/colors/my_colors.dart';
import 'package:education_live_app/features/splash/presentation/refactor/splash_body.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      body: const SplashBody(),
    );
  }
}
