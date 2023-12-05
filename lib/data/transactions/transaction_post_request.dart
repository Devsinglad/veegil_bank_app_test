import 'package:flutter/material.dart';
import 'package:veegil_bank_app_test/config/routes.dart';

import '../../core/api_const.dart';
import '../../core/base_api.dart';
import '../../utils/enum.dart';
import '../base_response.dart';

class TransactionPostApi extends ChangeNotifier {
  ButtonState buttonState = ButtonState.idle;

  final ApiService _apiService = ApiService();
  final ApiRoutes _apiRoutes = ApiRoutes();
  Future<void> transfer({required String phoneNumber,required String amount,context})async {
    buttonState = ButtonState.loading;
    notifyListeners();
    ResponseModel responseModel = await _apiService.call(
      method: HttpMethod.post,
      endpoint: '${_apiRoutes.baseUrl}${_apiRoutes.transfer}',
      reqBody: {
        "phoneNumber": phoneNumber,
        "amount":amount,
      }
    );
    if(responseModel.isSuccess){
      buttonState = ButtonState.success;
      notifyListeners();
      Navigator.pushReplacementNamed(context, RouteGenerator.navigationPage);

      print(responseModel.response.body);
    }else{
      buttonState = ButtonState.idle;
      notifyListeners();
    }

  }
}