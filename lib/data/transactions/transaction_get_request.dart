import 'dart:convert';

import 'package:flutter/cupertino.dart';
import '../../core/api_const.dart';
import '../../core/base_api.dart';
import '../../models/api_model/userModel.dart';
import '../../widgets/toast.dart';
import '../base_response.dart';

class TransactionGetApi extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  final ApiRoutes _apiRoutes = ApiRoutes();
List userList=<UserAccount>[];
  Future<UserData> getUsers() async {
    ResponseModel responseModel = await _apiService.call(
      method: HttpMethod.get,
      endpoint: '${_apiRoutes.baseUrl}${_apiRoutes.users}',
    );
    var decodedData= jsonDecode(responseModel.response.body);
final responseData=UserData.fromJson(decodedData);
userList=responseData.data;
    notifyListeners();
    return responseData;
  }
}