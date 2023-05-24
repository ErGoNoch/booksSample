import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../config_reader.dart';

const String applicationJson = "application/json";
const String contentType = "content-type";
const String accept = "accept";
const String baseUrl = "http://gutendex.com";

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
      contentType: applicationJson,
    };

    dio.options = BaseOptions(
        // baseUrl: '${ConfigReader.baseUrl()}',
        baseUrl: baseUrl,
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
