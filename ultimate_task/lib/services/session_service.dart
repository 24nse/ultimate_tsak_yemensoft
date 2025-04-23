import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ultimate_task/routes/app_pages.dart';


class SessionService with WidgetsBindingObserver {
  Timer? _inactivityTimer;
  final Duration timeoutDuration = const Duration(minutes: 2);
  final GetStorage _storage = GetStorage();

  void initialize() {
    WidgetsBinding.instance.addObserver(this);
    resetTimer(); 
  }

  void resetTimer() {
    _inactivityTimer?.cancel();
    _inactivityTimer = Timer(timeoutDuration, _handleTimeout);
  }

  void _handleTimeout() {
    _storage.erase(); 
    Get.offAllNamed(AppRoutes.login); 
    Get.snackbar('انتهت الجلسة', 'تم تسجيل الخروج بسبب الخمول');
  }

  void stop() {
    _inactivityTimer?.cancel();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      resetTimer(); 
    } else if (state == AppLifecycleState.paused) {
      _inactivityTimer?.cancel(); 
    }
  }
}
