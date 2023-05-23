// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Person _$PersonFromJson(Map<String, dynamic> json) => Person(
      json['birth_year'] as String?,
      json['death_year'] as String?,
      json['name'] as String,
    );

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
      'birth_year': instance.birthYear,
      'death_year': instance.deathYear,
      'name': instance.name,
    };
