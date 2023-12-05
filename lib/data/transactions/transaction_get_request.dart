import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../core/api_const.dart';
import '../../core/base_api.dart';
import '../../models/api_model/userModel.dart';
import '../auth/auth_request.dart';
import '../base_response.dart';

class TransactionGetApi extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  final ApiRoutes _apiRoutes = ApiRoutes();
  List userList = <UserAccount>[];
  UserAccount? userAccount;

  Future<Object?> getUsers(context) async {
    ResponseModel responseModel = await _apiService.call(
      method: HttpMethod.get,
      endpoint: '${_apiRoutes.baseUrl}${_apiRoutes.users}',
    );
    if (responseModel.isSuccess) {
      print(responseModel.statusCode);
      var decodedData = jsonDecode(responseModel.response.body);
      print(decodedData);
      final responseData = UserData.fromJson(decodedData);
      userList = responseData.data;
      notifyListeners();

      /// Get the stored phone number
      var authApi = Provider.of<AuthApi>(context, listen: false);
      String? storedNumber = authApi.getStoredNumber();

      /// Check if the stored phone number is available
      if (storedNumber != null) {
        /// Find the user account based on the stored phone number
        userAccount = responseData.data.firstWhere(
          (account) => account.phoneNumber == storedNumber,
        );
        print(userAccount?.balance);
      } else {
        return null;
      }
    }
    return null;
  }
}