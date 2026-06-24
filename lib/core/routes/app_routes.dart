// core/routes/app_routes.dart
import 'package:education_live_app/core/routes/custom_page_route.dart';
import 'package:education_live_app/features/auth/presentation/pages/forgot_password.dart';
import 'package:education_live_app/features/auth/presentation/pages/login_page.dart';
import 'package:education_live_app/features/auth/presentation/pages/sign_up_page.dart';
import 'package:education_live_app/features/splash/presentation/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'routes_names.dart';

class AppRouter {
  AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutesNames.splash:
        return _buildRoute(settings, SplashPage());

      case AppRoutesNames.login:
        return _buildRoute(settings, const LoginPage());

      case AppRoutesNames.register:
        return _buildRoute(settings, const SignUpPage());

      case AppRoutesNames.forgotPassword:
        return _buildRoute(settings, const ForgotPassword());

      case AppRoutesNames.main:
        return _buildRoute(
          settings,
          const Scaffold(body: Center(child: Text('Main Screen'))),
        );

      default:
        return _buildRoute(
          settings,
          Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }

  static CustomPageRoute _buildRoute(RouteSettings settings, Widget page) {
    return CustomPageRoute(
      settings: settings,  
      page: page,
    );
  }
}