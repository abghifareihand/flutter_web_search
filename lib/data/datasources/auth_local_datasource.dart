import 'package:shared_preferences/shared_preferences.dart';
import 'package:wifipos_web/data/models/login_response_model.dart';

class AuthLocalDatasource {
  static const authKey = 'authKey';

  Future<bool> saveAuthData(LoginResponseModel model) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final result = await pref.setString(authKey, model.toJson());
    return result;
  }

  Future<bool> removeAuthData() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final result = await pref.remove(authKey);
    return result;
  }

  Future<String> getToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final authJson = pref.getString(authKey) ?? '';
    final authModel = LoginResponseModel.fromJson(authJson);
    return authModel.token;
  }

  Future<String> getUsername() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final authJson = pref.getString(authKey) ?? '';
    final authModel = LoginResponseModel.fromJson(authJson);
    return authModel.username;
  }

  Future<bool> isLogin() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final authJson = pref.getString(authKey) ?? '';
    return authJson.isNotEmpty;
  }
}
