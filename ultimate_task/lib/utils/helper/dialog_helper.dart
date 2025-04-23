import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DialogHelper {
  static void showLanguageDialog() {
    String? selectedLangCode = Get.locale?.languageCode ?? 'en';

    Get.defaultDialog(
      title: 'select_language'.tr,
      content: StatefulBuilder(
        builder: (context, setState) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioListTile<String>(
                title: Text('english'.tr),
                value: 'en',
                groupValue: selectedLangCode,
                onChanged: (value) {
                  setState(() {
                    selectedLangCode = value!;
                  });
                },
              ),
              RadioListTile<String>(
                title: Text('arabic'.tr),
                value: 'ar',
                groupValue: selectedLangCode,
                onChanged: (value) {
                  setState(() {
                    selectedLangCode = value!;
                  });
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  _changeLanguage(selectedLangCode!);
                  Get.back(); 
                },
                child: Text('apply'.tr),
              ),
            ],
          );
        },
      ),
    );
  }

  static void _changeLanguage(String langCode) {
    final locale = Locale(langCode);
    Get.updateLocale(locale);
    GetStorage().write('locale', langCode);
  }
}

