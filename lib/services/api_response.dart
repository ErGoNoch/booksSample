
import 'network/failure.dart';

class ApiResponse<T> {
  ApiResponse({this.response, this.error});

  final T? response;
  final Failure? error;

  bool isSuccess() => response != null;

  bool isFailure() => error != null;
}