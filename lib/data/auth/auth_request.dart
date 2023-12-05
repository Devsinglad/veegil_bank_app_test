import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:veegil_bank_app_test/core/base_api.dart';
import 'package:veegil_bank_app_test/data/base_response.dart';
import 'package:veegil_bank_app_test/src/main.dart';
import '../../core/api_const.dart';
import '../../utils/enum.dart';

import '../local_database.dart/local_db.dart';

class AuthApi extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  final ApiRoutes _apiRoutes = ApiRoutes();
  ButtonState buttonState = ButtonState.idle;
  HiveStorage hiveStorage = HiveStorage(Hive.box(HiveKeys.appBox));

  Future<void> signUp(phoneNumber, password, context) async {
    buttonState = ButtonState.loading;
    notifyListeners();

    ResponseModel responseModel = await _apiService.call(
      method: HttpMethod.post,
      endpoint: '${_apiRoutes.baseUrl}${_apiRoutes.signUp}',
      reqBody: {
        'phoneNumber': phoneNumber,
        'password': password,
      },
    );
    if (responseModel.isSuccess) {

      buttonState = ButtonState.success;
      notifyListeners();
      Navigator.of(context).pushNamed(
        RouteGenerator.registerSuccessPage,
      );
    } else {
      buttonState = ButtonState.idle;
      notifyListeners();

    }
  }

  Future<void> signIn(phoneNumber, password, context) async {
    buttonState = ButtonState.loading;
    notifyListeners();
    ResponseModel responseModel = await _apiService.call(
      method: HttpMethod.post,
      endpoint: '${_apiRoutes.baseUrl}${_apiRoutes.login}',
      reqBody: {
        'phoneNumber': phoneNumber,
        'password': password,
      },
    );
    if (responseModel.isSuccess){
      buttonState=ButtonState.success;
      notifyListeners();
      var decode = jsonDecode(responseModel.response.body);
      await hiveStorage.put(HiveKeys.token, decode['data']['token']);
      await hiveStorage.put(HiveKeys.user, phoneNumber);
      Navigator.of(context).pushReplacementNamed(
        RouteGenerator.navigationPage,
      );
    }else{
      buttonState=ButtonState.idle;
notifyListeners();
    }
  }

  String? getStoredToken() {
    var token = hiveStorage.get<String?>(HiveKeys.token);

    notifyListeners();
    return token;
  }

  String? getStoredNumber() {
    var userNumber = hiveStorage.get<String?>(HiveKeys.user);
    notifyListeners();
    return userNumber;
  }
}