import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LanguageSelectionPage extends StatelessWidget {
  const LanguageSelectionPage({Key? key}) : super(key: key);

  void _changeLanguage(String langCode) {
    final locale = Locale(langCode);
    Get.updateLocale(locale);
    GetStorage().write('locale', langCode);
    Get.back(); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('select_language'.tr),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.defaultDialog(
              title: 'select_language'.tr,
              content: Column(
                children: [
                  ListTile(
                    title: Text('english'.tr),
                    onTap: () => _changeLanguage('en'),
                  ),
                  ListTile(
                    title: Text('arabic'.tr),
                    onTap: () => _changeLanguage('ar'),
                  ),
                ],
              ),
            );
          },
          child: Text('language'.tr),
        ),
      ),
    );
  }
}
