import 'package:freezed_annotation/freezed_annotation.dart';

part 'person_model.g.dart';

@JsonSerializable()
class Person {
  @JsonKey(name: 'birth_year')
  String? birthYear;
  @JsonKey(name: 'death_year')
  String? deathYear;
  String name;

  Person(this.birthYear, this.deathYear, this.name);

  //fromJson
  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
}
