import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'encrypt_helper.dart';

const String sessionKey = 'sessionKeyAdmin';
const String userKey = 'userKeyAdmin';

class AppPreferences {
  final SharedPreferences _sharedPreferences;
  final EncryptHelper _encryptHelper;

  AppPreferences(this._sharedPreferences, this._encryptHelper);

  Future<void> setSessionIds(String sessionId, String userId) async {
    await _sharedPreferences.setString(
        userKey, _encryptHelper.encrypt(userId) ?? '');
    await _sharedPreferences.setString(
        sessionKey, _encryptHelper.encrypt(sessionId) ?? '');
  }

  String getUserId() {
    final userIdEncry = _sharedPreferences.getString(userKey) ?? '';
    final userIdDecry = _encryptHelper.decrypt(userIdEncry) ?? '';
    if (userIdDecry != '') {
      return userIdDecry;
    }
    return '';
  }

  String getSessionId() {
    final sessionIdEncry = _sharedPreferences.getString(sessionKey) ?? '';
    final sessionIdDecry = _encryptHelper.decrypt(sessionIdEncry) ?? '';
    if (sessionIdDecry != '') {
      return sessionIdDecry;
    }
    return '';
  }

  Future<void> logout() async {
    await _sharedPreferences.remove(sessionKey);
    await _sharedPreferences.remove(userKey);
  }
}
