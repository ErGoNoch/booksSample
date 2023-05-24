import 'package:freezed_annotation/freezed_annotation.dart';

part 'person_model.g.dart';

@JsonSerializable()
class Person {
  @JsonKey(name: 'birth_year')
  int? birthYear;
  @JsonKey(name: 'death_year')
  int? deathYear;
  String name;

  Person(this.birthYear, this.deathYear, this.name);

  //fromJson
  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
}
