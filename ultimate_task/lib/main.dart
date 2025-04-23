import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ultimate_task/app/app.dart';
import 'package:ultimate_task/services/session_service.dart';
final sessionService = SessionService();
void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
   final box = GetStorage();
   sessionService.initialize(); 
  final locale = box.read('locale') ?? 'en';
  runApp(MyApp(locale: locale));

}