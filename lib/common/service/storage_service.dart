import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:simply_shop/common/entities/user.dart';
import 'package:simply_shop/common/value/constatnt.dart';

class StorageService {
  late final SharedPreferences _prefs;
//直接檢查暫存裡的資料
  bool getDeviceFirstOpen() {
    return _prefs.getBool(AppConstants.STORAGE_DEVICE_OPEN_FIRAT_TIME) ?? false;
  }

  bool getIsLoggedIn() {
    return _prefs.getString(AppConstants.STORAGE_USER_TOKEN_KEY) == null
        ? false
        : true;
  }

  UserItem getUserProfile() {
    var profileOffline =
        _prefs.getString(AppConstants.STORAGE_USER_PROFILE_KEY) ?? "";

    if (profileOffline.isNotEmpty) {
      return UserItem.fromJson(jsonDecode(profileOffline));
    }
    return UserItem();
  }

  getUserToken() {
    return _prefs.getString(AppConstants.STORAGE_USER_TOKEN_KEY) ?? "";
  }

  //初始化
  Future<StorageService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> remove(String key) {
    return _prefs.remove(key);
  }

  //製作儲存方法
  Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  Future<bool> setString(String key, String value) async {
    return await _prefs.setString(key, value);
  }
}
