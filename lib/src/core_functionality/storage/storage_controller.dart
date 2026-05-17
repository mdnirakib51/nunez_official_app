
import 'dart:developer';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/storage_keys.dart';
import 'local_storage.dart';

class LocalStorageService {
  static LocalStorageService? _instance;
  SharedPreferences? _prefs;

  // Private constructor
  LocalStorageService._();

  /// Get singleton instance
  static Future<LocalStorageService> getInstance() async {
    if (_instance == null) {
      _instance = LocalStorageService._();
      await _instance!._init();
    }
    return _instance!;
  }

  /// Initialize SharedPreferences
  Future<void> _init() async {
    log("Initializing SharedPreferences...");
    _prefs = await SharedPreferences.getInstance();
    log("SharedPreferences initialized successfully");
  }

  // ==================== Quick Access Getters ====================

  /// Get access token
  String? get accessToken => Get.find<LocalStorage>().getString(key: StorageKeys.accessToken);
  // ==================== Convenience Methods ====================

  /// Save user token
  Future<void> saveUserToken(String token) async {
    return Get.find<LocalStorage>().setString(key: StorageKeys.accessToken, value: token);
  }

}