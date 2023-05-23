import 'package:freezed_annotation/freezed_annotation.dart';

part 'book_model.freezed.dart';

part 'book_model.g.dart';

@freezed
class Book with _$Book {
  const factory Book({
    required String id,
    required String title,
    @JsonKey(name: "media_type") required String mediaType,
    @JsonKey(name: "download_count") required int downloadCount,
    required List<String> subjects,
    required List<String> bookshelves,
    required List<String> languages,
    bool? copyright,
  }) = _Book;

  // "authors": <array of Persons>,
  // "translators": <array of Persons>,
  // "copyright": <boolean or null>,
  // "media_type": <string>,
  // "formats": <Format>,

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
}
