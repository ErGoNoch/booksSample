// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Book _$BookFromJson(Map<String, dynamic> json) => Book(
      json['id'] as int,
      json['title'] as String,
      json['media_type'] as String,
      json['download_count'] as int,
      (json['subjects'] as List<dynamic>).map((e) => e as String).toList(),
      (json['bookshelves'] as List<dynamic>).map((e) => e as String).toList(),
      (json['languages'] as List<dynamic>).map((e) => e as String).toList(),
      json['copyright'] as bool?,
      (json['authors'] as List<dynamic>)
          .map((e) => Person.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['translators'] as List<dynamic>)
          .map((e) => Person.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
