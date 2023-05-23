// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Book _$$_BookFromJson(Map<String, dynamic> json) => _$_Book(
      id: json['id'] as String,
      title: json['title'] as String,
      mediaType: json['media_type'] as String,
      downloadCount: json['download_count'] as int,
      subjects:
          (json['subjects'] as List<dynamic>).map((e) => e as String).toList(),
      bookshelves: (json['bookshelves'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      languages:
          (json['languages'] as List<dynamic>).map((e) => e as String).toList(),
      copyright: json['copyright'] as bool?,
    );

Map<String, dynamic> _$$_BookToJson(_$_Book instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'media_type': instance.mediaType,
      'download_count': instance.downloadCount,
      'subjects': instance.subjects,
      'bookshelves': instance.bookshelves,
      'languages': instance.languages,
      'copyright': instance.copyright,
    };
