import 'package:http/http.dart';


class ResponseModel {
  Response response;

  ResponseModel(this.response);

  dynamic _data;
  int? _statusCode;

  dynamic get data {
    _data = response.body;
    return _data;
  }

  int? get statusCode {
    _statusCode = response.statusCode;
    return _statusCode;
  }
  bool get isSuccess {
    return statusCode != null && statusCode! >= 200 && statusCode! < 300;
  }
}