import 'package:food_delivery_dbestech/data/api/api_client.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';

class UserRepo {
  final ApiClient apiClient;
  UserRepo({required this.apiClient});

  Future<Response> getUserInfo() async {
    return await apiClient.getData(AppConstants.USER_INFO_URI);
  }
  //
  // void saveUserToken(body) {}
  //
  // void saveUserNumberAndPassword(String number, String password) {}
}
