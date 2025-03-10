import 'dart:convert';

import 'package:digitifyze/model/response/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static final AppPreferences _instance = AppPreferences._internal();
  static SharedPreferences? _preferences;

  static const String languageKey = "Language";
  static const String fcmToken = "FcmToken";
  static const String loginToken = "loginToken";
  static const String authToken = "authToken";
  static const String isLogin = "IsLogin";
  static const String userId = "userId";
  static const String isOnBoarding = "IsOnboarding";

  factory AppPreferences() {
    return _instance;
  }

  AppPreferences._internal();

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  /// Set Language
  Future<void> setLanguage(String value) async {
    await _preferences?.setString(languageKey, value);
  }
  String getLanguage() {
    return _preferences?.getString(languageKey) ?? 'en';
  }

  /// Set FCMToken
  Future<void> setFCMToken(String value) async {
    await _preferences?.setString(fcmToken, value);
  }
  String getFCMToken() {
    return _preferences?.getString(fcmToken) ?? '';
  }
  ///Set AuthToken
  Future<void> setAuthToken(String value) async {
    await _preferences?.setString(authToken, value);
  }
  String getAuthToken() {
    return _preferences?.getString(authToken) ?? '';
  }
  /// Set LoginToken
  Future<void> setLoginToken(String value) async {
    await _preferences?.setString(loginToken, value);
  }
  String getLoginToken() {
    return _preferences?.getString(loginToken) ?? '';
  }
  /// Set  UserId
  Future<void> setUserId(String value) async {
    await _preferences?.setString(userId, value);
  }
  String getUserId() {
    return _preferences?.getString(userId) ?? '';
  }
  /// Set User Login
  Future<void> setIsLoggedIn(bool value) async {
    await _preferences?.setBool(isLogin, value);
  }
  bool getIsLoggedIn() {
    return _preferences?.getBool(isLogin) ?? false;
  }
  /// Set Onboarding
  Future<void> setIsOnBoarding(bool value) async {
    await _preferences?.setBool(isOnBoarding, value);
  }
  bool getIsOnBoarding() {
    return _preferences?.getBool(isOnBoarding) ?? false;
  }




  Future<void> clearPreferences() async {
    await _preferences?.clear();
  }
}
