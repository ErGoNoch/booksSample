// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Person _$$_PersonFromJson(Map<String, dynamic> json) => _$_Person(
      birthYear: json['birth_year'] as String?,
      deathYear: json['death_year'] as String?,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$_PersonToJson(_$_Person instance) => <String, dynamic>{
      'birth_year': instance.birthYear,
      'death_year': instance.deathYear,
      'name': instance.name,
    };
