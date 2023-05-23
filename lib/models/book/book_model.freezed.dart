// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Book _$BookFromJson(Map<String, dynamic> json) {
  return _Book.fromJson(json);
}

/// @nodoc
mixin _$Book {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: "media_type")
  String get mediaType => throw _privateConstructorUsedError;
  @JsonKey(name: "download_count")
  int get downloadCount => throw _privateConstructorUsedError;
  List<String> get subjects => throw _privateConstructorUsedError;
  List<String> get bookshelves => throw _privateConstructorUsedError;
  List<String> get languages => throw _privateConstructorUsedError;
  bool? get copyright => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookCopyWith<Book> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookCopyWith<$Res> {
  factory $BookCopyWith(Book value, $Res Function(Book) then) =
      _$BookCopyWithImpl<$Res, Book>;
  @useResult
  $Res call(
      {String id,
      String title,
      @JsonKey(name: "media_type") String mediaType,
      @JsonKey(name: "download_count") int downloadCount,
      List<String> subjects,
      List<String> bookshelves,
      List<String> languages,
      bool? copyright});
}

/// @nodoc
class _$BookCopyWithImpl<$Res, $Val extends Book>
    implements $BookCopyWith<$Res> {
  _$BookCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? mediaType = null,
    Object? downloadCount = null,
    Object? subjects = null,
    Object? bookshelves = null,
    Object? languages = null,
    Object? copyright = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      mediaType: null == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String,
      downloadCount: null == downloadCount
          ? _value.downloadCount
          : downloadCount // ignore: cast_nullable_to_non_nullable
              as int,
      subjects: null == subjects
          ? _value.subjects
          : subjects // ignore: cast_nullable_to_non_nullable
              as List<String>,
      bookshelves: null == bookshelves
          ? _value.bookshelves
          : bookshelves // ignore: cast_nullable_to_non_nullable
              as List<String>,
      languages: null == languages
          ? _value.languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<String>,
      copyright: freezed == copyright
          ? _value.copyright
          : copyright // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BookCopyWith<$Res> implements $BookCopyWith<$Res> {
  factory _$$_BookCopyWith(_$_Book value, $Res Function(_$_Book) then) =
      __$$_BookCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      @JsonKey(name: "media_type") String mediaType,
      @JsonKey(name: "download_count") int downloadCount,
      List<String> subjects,
      List<String> bookshelves,
      List<String> languages,
      bool? copyright});
}

/// @nodoc
class __$$_BookCopyWithImpl<$Res> extends _$BookCopyWithImpl<$Res, _$_Book>
    implements _$$_BookCopyWith<$Res> {
  __$$_BookCopyWithImpl(_$_Book _value, $Res Function(_$_Book) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? mediaType = null,
    Object? downloadCount = null,
    Object? subjects = null,
    Object? bookshelves = null,
    Object? languages = null,
    Object? copyright = freezed,
  }) {
    return _then(_$_Book(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      mediaType: null == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String,
      downloadCount: null == downloadCount
          ? _value.downloadCount
          : downloadCount // ignore: cast_nullable_to_non_nullable
              as int,
      subjects: null == subjects
          ? _value._subjects
          : subjects // ignore: cast_nullable_to_non_nullable
              as List<String>,
      bookshelves: null == bookshelves
          ? _value._bookshelves
          : bookshelves // ignore: cast_nullable_to_non_nullable
              as List<String>,
      languages: null == languages
          ? _value._languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<String>,
      copyright: freezed == copyright
          ? _value.copyright
          : copyright // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Book implements _Book {
  const _$_Book(
      {required this.id,
      required this.title,
      @JsonKey(name: "media_type") required this.mediaType,
      @JsonKey(name: "download_count") required this.downloadCount,
      required final List<String> subjects,
      required final List<String> bookshelves,
      required final List<String> languages,
      this.copyright})
      : _subjects = subjects,
        _bookshelves = bookshelves,
        _languages = languages;

  factory _$_Book.fromJson(Map<String, dynamic> json) => _$$_BookFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  @JsonKey(name: "media_type")
  final String mediaType;
  @override
  @JsonKey(name: "download_count")
  final int downloadCount;
  final List<String> _subjects;
  @override
  List<String> get subjects {
    if (_subjects is EqualUnmodifiableListView) return _subjects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subjects);
  }

  final List<String> _bookshelves;
  @override
  List<String> get bookshelves {
    if (_bookshelves is EqualUnmodifiableListView) return _bookshelves;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bookshelves);
  }

  final List<String> _languages;
  @override
  List<String> get languages {
    if (_languages is EqualUnmodifiableListView) return _languages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_languages);
  }

  @override
  final bool? copyright;

  @override
  String toString() {
    return 'Book(id: $id, title: $title, mediaType: $mediaType, downloadCount: $downloadCount, subjects: $subjects, bookshelves: $bookshelves, languages: $languages, copyright: $copyright)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Book &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.mediaType, mediaType) ||
                other.mediaType == mediaType) &&
            (identical(other.downloadCount, downloadCount) ||
                other.downloadCount == downloadCount) &&
            const DeepCollectionEquality().equals(other._subjects, _subjects) &&
            const DeepCollectionEquality()
                .equals(other._bookshelves, _bookshelves) &&
            const DeepCollectionEquality()
                .equals(other._languages, _languages) &&
            (identical(other.copyright, copyright) ||
                other.copyright == copyright));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      mediaType,
      downloadCount,
      const DeepCollectionEquality().hash(_subjects),
      const DeepCollectionEquality().hash(_bookshelves),
      const DeepCollectionEquality().hash(_languages),
      copyright);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BookCopyWith<_$_Book> get copyWith =>
      __$$_BookCopyWithImpl<_$_Book>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BookToJson(
      this,
    );
  }
}

abstract class _Book implements Book {
  const factory _Book(
      {required final String id,
      required final String title,
      @JsonKey(name: "media_type") required final String mediaType,
      @JsonKey(name: "download_count") required final int downloadCount,
      required final List<String> subjects,
      required final List<String> bookshelves,
      required final List<String> languages,
      final bool? copyright}) = _$_Book;

  factory _Book.fromJson(Map<String, dynamic> json) = _$_Book.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  @JsonKey(name: "media_type")
  String get mediaType;
  @override
  @JsonKey(name: "download_count")
  int get downloadCount;
  @override
  List<String> get subjects;
  @override
  List<String> get bookshelves;
  @override
  List<String> get languages;
  @override
  bool? get copyright;
  @override
  @JsonKey(ignore: true)
  _$$_BookCopyWith<_$_Book> get copyWith => throw _privateConstructorUsedError;
}
