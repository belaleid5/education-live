import 'package:education_live_app/core/routes/routes_names.dart';
import 'package:education_live_app/core/theme/colors/my_colors.dart';
import 'package:education_live_app/features/splash/presentation/refactor/splash_body.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool _showSplashBody = false;

  @override
  void initState() {
    super.initState();
    _checkAuthStatus();
  }

  Future<void> _checkAuthStatus() async {
    await Future.delayed(const Duration(milliseconds: 800));

    if (!mounted) return;

    final session = Supabase.instance.client.auth.currentSession;

    if (session != null) {
   
      Navigator.pushReplacementNamed(context, AppRoutesNames.home);
    } else {
   
      setState(() {
        _showSplashBody = true;
      });
    }
  }

  void _navigateToLogin() {
    Navigator.pushReplacementNamed(context, AppRoutesNames.login);
  }

  @override
  Widget build(BuildContext context) {
    if (!_showSplashBody) {
      return Scaffold(
        backgroundColor: context.colors.background,
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

  
    return Scaffold(
      backgroundColor: context.colors.background,
      body: SplashBody(onGetStarted: _navigateToLogin),
    );
  }
}