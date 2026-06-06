import 'package:education_live_app/core/storage/shared_pref.dart';
import 'package:education_live_app/features/app/data/app_pref_keys.dart';
import 'package:education_live_app/features/app/ui/app_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit()
    : super(const AppState(isDark: false, languageCode: 'ar', tabIndex: 0));

  bool get isDark => state.isDark;
  String get currentLangCode => state.languageCode;
  int get currentTabIndex => state.tabIndex;

  void init() {
    final savedTheme = SharedPref().getBoolean(AppPrefKeys.themeMode) ?? false;
    final savedLang = SharedPref().getString(AppPrefKeys.language) ?? 'ar';

    emit(state.copyWith(isDark: savedTheme, languageCode: savedLang));
  }

  Future<void> toggleTheme() async {
    final newTheme = !state.isDark;
    await SharedPref().setBoolean(AppPrefKeys.themeMode, newTheme);

    emit(state.copyWith(isDark: newTheme));
  }

  Future<void> changeLanguage(String langCode) async {
    await SharedPref().setString(AppPrefKeys.language, langCode);

    emit(state.copyWith(languageCode: langCode));
  }

  void changeTab(int index) {
    emit(state.copyWith(tabIndex: index));
  }
}
