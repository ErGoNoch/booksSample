import 'package:freezed_annotation/freezed_annotation.dart';

import '../person/person_model.dart';

part 'book_model.g.dart';

@JsonSerializable()
class Book {
  int id;
  String title;
  @JsonKey(name: "media_type") String mediaType;
  @JsonKey(name: "download_count") int downloadCount;
  List<String> subjects;
  List<String> bookshelves;
  List<String> languages;
  bool? copyright;
  List<Person> authors;
  List<Person> translators;

  Book(this.id, this.title, this.mediaType,
      this.downloadCount, this.subjects, this.bookshelves, this.languages,
      this.copyright, this.authors, this.translators);

  //fromJson
  factory Book.fromJson(Map<String, dynamic> json) =>
      _$BookFromJson(json);
}
