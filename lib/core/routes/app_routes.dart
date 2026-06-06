// core/routes/app_routes.dart
import 'package:flutter/material.dart';
import 'routes_names.dart';

class AppRouter {
  AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutesNames.splash:
        return _buildRoute(
          settings,
          const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          ),
        );

      case AppRoutesNames.login:
        return _buildRoute(
          settings,
          const Scaffold(
            body: Center(child: Text('Login Screen')),
          ),
        );

      case AppRoutesNames.register:
        return _buildRoute(
          settings,
          const Scaffold(
            body: Center(child: Text('Register Screen')),
          ),
        );

      case AppRoutesNames.main:
        return _buildRoute(
          settings,
          const Scaffold(
            body: Center(child: Text('Main Screen')),
          ),
        );

      default:
        return _buildRoute(
          settings,
          Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }

  static MaterialPageRoute _buildRoute(
    RouteSettings settings,
    Widget page,
  ) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => page,
    );
  }
}