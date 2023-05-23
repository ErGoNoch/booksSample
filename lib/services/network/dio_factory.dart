import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../config_reader.dart';

const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "content-type";
const String ACCEPT = "accept";

class DioFactory {
  Dio getClientDio() {
    Dio dio = Dio();
    int timeOut = 60 * 1000; // 1 min
    // String? oracleUser = ConfigReader.OracleUser();
    // String? password = ConfigReader.OraclePassword();
    // String basicAuth =
    //     'Basic ${base64.encode(utf8.encode('$oracleUser:$password'))}';
    //
    Map<String, dynamic> headers = {
      CONTENT_TYPE: APPLICATION_JSON,
    };

    dio.options = BaseOptions(
        baseUrl: '${ConfigReader.baseUrl()}',
        connectTimeout: Duration(milliseconds: timeOut),
        receiveTimeout: Duration(milliseconds: timeOut),
        headers: headers);

    if (kReleaseMode) {
      print("release mode no logs");
    } else {
      dio.interceptors.add(PrettyDioLogger(
          requestHeader: true, requestBody: true, responseHeader: true));
    }

    return dio;
  }
}
