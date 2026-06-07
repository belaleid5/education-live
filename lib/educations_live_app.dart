import 'package:education_live_app/core/env/env_varible.dart';
import 'package:education_live_app/core/language/app_localizations_setup.dart';
import 'package:education_live_app/core/routes/app_routes.dart';
import 'package:education_live_app/core/routes/routes_names.dart';
import 'package:education_live_app/core/theme/app_theme.dart';
import 'package:education_live_app/features/app/ui/app_cubit_cubit.dart';
import 'package:education_live_app/features/concetvitiy/ui/connectivity_controller.dart';
import 'package:education_live_app/features/error/ui/no_network.dart';
import 'package:education_live_app/shared/utils/app_responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EducationsLiveApp extends StatelessWidget {
  const EducationsLiveApp({super.key});

  static const double _designWidth = 430;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: ConnectivityController.instance.isConnected,
      builder: (context, isConnected, _) {
        if (!isConnected) {
          return MaterialApp(
            debugShowCheckedModeBanner: EnvVariable.instance.isDebugMode,
            home: const NoNetwork(),
          );
        }

        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: AppResponsive(
            width: _designWidth,
            child: Builder(
              builder: (context) {
                final isDark = context.select<AppCubit, bool>((c) => c.isDark);
                final langCode = context.select<AppCubit, String>(
                  (c) => c.currentLangCode,
                );

                return MaterialApp(
                  debugShowCheckedModeBanner: EnvVariable.instance.isDebugMode,
                  initialRoute: AppRoutesNames.splash,
                  onGenerateRoute: AppRouter.onGenerateRoute,

                  theme: AppTheme.buildLight(langCode),
                  darkTheme: AppTheme.buildDark(langCode),
                  themeMode: isDark ? ThemeMode.dark : ThemeMode.light,

                  locale: Locale(langCode),
                  supportedLocales: AppLocalizationsSetup.supportedLocales,
                  localizationsDelegates:
                      AppLocalizationsSetup.localizationsDelegates,
                  localeResolutionCallback:
                      AppLocalizationsSetup.localeResolutionCallback,

                  builder: (context, child) => Directionality(
                    textDirection: langCode == 'ar'
                        ? TextDirection.rtl
                        : TextDirection.ltr,
                    child: child!,
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
