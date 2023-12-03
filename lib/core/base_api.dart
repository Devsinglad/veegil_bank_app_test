import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart' show Response;
import 'package:veegil_bank_app_test/src/data_src.dart';

import '../utils/enum.dart';
import '../utils/helper.dart';

enum HttpMethod { get, post, patch, put, delete }

class ApiService {
  static final Map<String, String> _requestHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  ApiService();

  Future<ResponseModel> call({
    required HttpMethod method,
    required String endpoint,
    Map<String, dynamic>? reqBody,
    bool protected = true,
  }) async {
    try {
      Map<String, String> headers = !protected
          ? {}
          : {
              ..._requestHeaders,
            };

      switch (method) {
        case HttpMethod.post:
          var response = await http.post(
            Uri.parse(endpoint),
            headers: headers,
            body: reqBody != null ? jsonEncode(reqBody) : null,
          );
          return _handleResponse(response);

        case HttpMethod.get:
          var response = await http.get(
            Uri.parse(endpoint),
            headers: headers,
          );
          return _handleResponse(response);

        case HttpMethod.patch:
          var response = await http.patch(
            Uri.parse(endpoint),
            headers: headers,
            body: reqBody != null ? jsonEncode(reqBody) : null,
          );
          return _handleResponse(response);

        case HttpMethod.put:
          var response = await http.put(
            Uri.parse(endpoint),
            headers: headers,
            body: reqBody != null ? jsonEncode(reqBody) : null,
          );
          return _handleResponse(response);

        case HttpMethod.delete:
          var response = await http.delete(
            Uri.parse(endpoint),
            headers: headers,
          );
          return _handleResponse(response);
      }
    } catch (e) {
      debugPrint(e.toString());
      return ResponseModel(
        http.Response(
          'Error occurred during the request',
          500,
          headers: {},
          request: http.Request('UNKNOWN', Uri.parse('')),
        ),
      );
    }
  }

  ResponseModel _handleResponse(Response response) {
    try{
      ButtonState _buttonState;

      if (response.statusCode == 200) {
        var decode = jsonDecode(response.body);

        _buttonState = ButtonState.success;
        toastMessage(
          text: decode['message'],
        );
        return ResponseModel(response);
      } else if (response.statusCode == 401) {
        var decode = jsonDecode(response.body);

        _buttonState = ButtonState.idle;

        toastMessage(text: decode['message'], isError: true);
        return ResponseModel(response);
      } else if (response.statusCode == 404) {
        var decode = jsonDecode(response.body);

        _buttonState = ButtonState.idle;

        toastMessage(text: decode['message'], isError: true);

        return ResponseModel(response);
      } else {

        _buttonState = ButtonState.idle;

        toastMessage(text: 'Bad Request', isError: true);
        return ResponseModel(response);
      }

    }catch(e){
      debugPrint(e.toString());
      return ResponseModel(
        http.Response(
          'Error occurred while handling the response',
          500,
          headers: {},
          request: http.Request('UNKNOWN', Uri.parse('')),
        ),
      );

    }

  }
}