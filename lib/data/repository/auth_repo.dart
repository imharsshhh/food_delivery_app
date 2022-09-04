import 'package:food_delivery_dbestech/base/signup_body_model.dart';
import 'package:food_delivery_dbestech/data/api/api_client.dart';
import 'package:food_delivery_dbestech/utils/constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  AuthRepo({
    required this.sharedPreferences,
    required this.apiClient,
  });

  Future<Response> registration(SignUpBody signUpBody) async {
    return await apiClient.postData(AppConstants.registrationUri, signUpBody.toJson());
  }

  bool userLoggedIn() {
    return sharedPreferences.containsKey(AppConstants.token);
  }

  Future<String> getUserToken() async {
    return await sharedPreferences.getString(AppConstants.token) ?? "None";
  }

  Future<Response> login(String email, String password) async {
    return await apiClient.postData(
        AppConstants.loginUri, {"email": email, "password": password});
  }

  Future<bool> saveUserToken(String token) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    return await sharedPreferences.setString(AppConstants.token, token);
  }

  Future<void> saveUserNumberAndPassword(String number, String password) async {
    try {
      await sharedPreferences.setString(AppConstants.PHONE, number);
      await sharedPreferences.setString(AppConstants.PASSWORD, password);
    } catch (e) {
      throw e;
    }
  }

  bool clearSharedData() {
    sharedPreferences.remove(AppConstants.token);
    sharedPreferences.remove(AppConstants.PASSWORD);
    sharedPreferences.remove(AppConstants.PHONE);
    apiClient.token = '';
    apiClient.updateHeader('');

    return true;
  }
}
