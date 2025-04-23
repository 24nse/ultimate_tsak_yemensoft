import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          'login': 'Login',
          'home': 'Home',
          'language': 'Language',
          'select_language': 'Select Language',
          'english': 'English',
          'arabic': 'Arabic',
          "apply": "Apply"
},

      
        'ar': {
          'login': 'تسجيل الدخول',
          'home': 'الرئيسية',
          'language': 'اللغة',
          'select_language': 'اختر اللغة',
          'english': 'الإنجليزية',
          'arabic': 'العربية',
           "apply": "تطبيق"
        },
      };
}
