import 'package:freezed_annotation/freezed_annotation.dart';

part 'person_model.freezed.dart';

part 'person_model.g.dart';

@freezed
class Person with _$Person {
  const factory Person(
      {@JsonKey(name: 'birth_year') String? birthYear,
      @JsonKey(name: 'death_year') String? deathYear,
      required String name}) = _Person;

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
}
