import 'package:education_live_app/core/storage/shared_pref.dart';
import 'package:education_live_app/features/app/data/app_pref_keys.dart';

abstract final class FontFamilyHelper {
  FontFamilyHelper._();

  static const String cairo = 'Cairo';
  static const String poppins = 'Poppins';

  static String getFontFamily([String? langCode]) {
    if (langCode != null) {
      return langCode == 'ar' ? cairo : poppins;
    }

    final storedLang = SharedPref().getString(AppPrefKeys.language);
    final lang = storedLang ?? 'ar';

    return lang == 'ar' ? cairo : poppins;
  }
}
