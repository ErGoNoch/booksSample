import 'package:books_sample/models/book/book_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_response_model.g.dart';

@JsonSerializable()
class BaseResponse {
  int count;
  String? next;
  String? previous;
  List<Book> results;

  BaseResponse(this.count, this.next, this.previous, this.results);

  //fromJson
  factory BaseResponse.fromJson(
          Map<String, dynamic> json) =>
      _$BaseResponseFromJson(json);
}


