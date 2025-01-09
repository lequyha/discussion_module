// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CommentModel _$CommentModelFromJson(Map<String, dynamic> json) {
  return _CommentModel.fromJson(json);
}

/// @nodoc
mixin _$CommentModel {
  int get id => throw _privateConstructorUsedError;
  int get objectId => throw _privateConstructorUsedError;
  String get creatorKey => throw _privateConstructorUsedError;
  String? get created => throw _privateConstructorUsedError;
  String? get creatorEmail => throw _privateConstructorUsedError;
  bool? get isPrivate => throw _privateConstructorUsedError;
  String? get body => throw _privateConstructorUsedError;
  @JsonKey(name: 'Avatar')
  String? get avatar => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalReply')
  int? get totalReply => throw _privateConstructorUsedError;
  CommentType? get objectType => throw _privateConstructorUsedError;
  String? get creatorFullName => throw _privateConstructorUsedError;
  String? get updated => throw _privateConstructorUsedError;
  String? get updaterKey => throw _privateConstructorUsedError;

  /// Serializes this CommentModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommentModelCopyWith<CommentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentModelCopyWith<$Res> {
  factory $CommentModelCopyWith(
          CommentModel value, $Res Function(CommentModel) then) =
      _$CommentModelCopyWithImpl<$Res, CommentModel>;
  @useResult
  $Res call(
      {int id,
      int objectId,
      String creatorKey,
      String? created,
      String? creatorEmail,
      bool? isPrivate,
      String? body,
      @JsonKey(name: 'Avatar') String? avatar,
      @JsonKey(name: 'TotalReply') int? totalReply,
      CommentType? objectType,
      String? creatorFullName,
      String? updated,
      String? updaterKey});
}

/// @nodoc
class _$CommentModelCopyWithImpl<$Res, $Val extends CommentModel>
    implements $CommentModelCopyWith<$Res> {
  _$CommentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? objectId = null,
    Object? creatorKey = null,
    Object? created = freezed,
    Object? creatorEmail = freezed,
    Object? isPrivate = freezed,
    Object? body = freezed,
    Object? avatar = freezed,
    Object? totalReply = freezed,
    Object? objectType = freezed,
    Object? creatorFullName = freezed,
    Object? updated = freezed,
    Object? updaterKey = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      objectId: null == objectId
          ? _value.objectId
          : objectId // ignore: cast_nullable_to_non_nullable
              as int,
      creatorKey: null == creatorKey
          ? _value.creatorKey
          : creatorKey // ignore: cast_nullable_to_non_nullable
              as String,
      created: freezed == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as String?,
      creatorEmail: freezed == creatorEmail
          ? _value.creatorEmail
          : creatorEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      isPrivate: freezed == isPrivate
          ? _value.isPrivate
          : isPrivate // ignore: cast_nullable_to_non_nullable
              as bool?,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      totalReply: freezed == totalReply
          ? _value.totalReply
          : totalReply // ignore: cast_nullable_to_non_nullable
              as int?,
      objectType: freezed == objectType
          ? _value.objectType
          : objectType // ignore: cast_nullable_to_non_nullable
              as CommentType?,
      creatorFullName: freezed == creatorFullName
          ? _value.creatorFullName
          : creatorFullName // ignore: cast_nullable_to_non_nullable
              as String?,
      updated: freezed == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as String?,
      updaterKey: freezed == updaterKey
          ? _value.updaterKey
          : updaterKey // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommentModelImplCopyWith<$Res>
    implements $CommentModelCopyWith<$Res> {
  factory _$$CommentModelImplCopyWith(
          _$CommentModelImpl value, $Res Function(_$CommentModelImpl) then) =
      __$$CommentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int objectId,
      String creatorKey,
      String? created,
      String? creatorEmail,
      bool? isPrivate,
      String? body,
      @JsonKey(name: 'Avatar') String? avatar,
      @JsonKey(name: 'TotalReply') int? totalReply,
      CommentType? objectType,
      String? creatorFullName,
      String? updated,
      String? updaterKey});
}

/// @nodoc
class __$$CommentModelImplCopyWithImpl<$Res>
    extends _$CommentModelCopyWithImpl<$Res, _$CommentModelImpl>
    implements _$$CommentModelImplCopyWith<$Res> {
  __$$CommentModelImplCopyWithImpl(
      _$CommentModelImpl _value, $Res Function(_$CommentModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? objectId = null,
    Object? creatorKey = null,
    Object? created = freezed,
    Object? creatorEmail = freezed,
    Object? isPrivate = freezed,
    Object? body = freezed,
    Object? avatar = freezed,
    Object? totalReply = freezed,
    Object? objectType = freezed,
    Object? creatorFullName = freezed,
    Object? updated = freezed,
    Object? updaterKey = freezed,
  }) {
    return _then(_$CommentModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      objectId: null == objectId
          ? _value.objectId
          : objectId // ignore: cast_nullable_to_non_nullable
              as int,
      creatorKey: null == creatorKey
          ? _value.creatorKey
          : creatorKey // ignore: cast_nullable_to_non_nullable
              as String,
      created: freezed == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as String?,
      creatorEmail: freezed == creatorEmail
          ? _value.creatorEmail
          : creatorEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      isPrivate: freezed == isPrivate
          ? _value.isPrivate
          : isPrivate // ignore: cast_nullable_to_non_nullable
              as bool?,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      totalReply: freezed == totalReply
          ? _value.totalReply
          : totalReply // ignore: cast_nullable_to_non_nullable
              as int?,
      objectType: freezed == objectType
          ? _value.objectType
          : objectType // ignore: cast_nullable_to_non_nullable
              as CommentType?,
      creatorFullName: freezed == creatorFullName
          ? _value.creatorFullName
          : creatorFullName // ignore: cast_nullable_to_non_nullable
              as String?,
      updated: freezed == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as String?,
      updaterKey: freezed == updaterKey
          ? _value.updaterKey
          : updaterKey // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommentModelImpl extends _CommentModel {
  const _$CommentModelImpl(
      {this.id = -1,
      this.objectId = -1,
      this.creatorKey = '',
      this.created,
      this.creatorEmail,
      this.isPrivate,
      this.body,
      @JsonKey(name: 'Avatar') this.avatar,
      @JsonKey(name: 'TotalReply') this.totalReply,
      this.objectType,
      this.creatorFullName,
      this.updated,
      this.updaterKey})
      : super._();

  factory _$CommentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommentModelImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final int objectId;
  @override
  @JsonKey()
  final String creatorKey;
  @override
  final String? created;
  @override
  final String? creatorEmail;
  @override
  final bool? isPrivate;
  @override
  final String? body;
  @override
  @JsonKey(name: 'Avatar')
  final String? avatar;
  @override
  @JsonKey(name: 'TotalReply')
  final int? totalReply;
  @override
  final CommentType? objectType;
  @override
  final String? creatorFullName;
  @override
  final String? updated;
  @override
  final String? updaterKey;

  @override
  String toString() {
    return 'CommentModel(id: $id, objectId: $objectId, creatorKey: $creatorKey, created: $created, creatorEmail: $creatorEmail, isPrivate: $isPrivate, body: $body, avatar: $avatar, totalReply: $totalReply, objectType: $objectType, creatorFullName: $creatorFullName, updated: $updated, updaterKey: $updaterKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.objectId, objectId) ||
                other.objectId == objectId) &&
            (identical(other.creatorKey, creatorKey) ||
                other.creatorKey == creatorKey) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.creatorEmail, creatorEmail) ||
                other.creatorEmail == creatorEmail) &&
            (identical(other.isPrivate, isPrivate) ||
                other.isPrivate == isPrivate) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.totalReply, totalReply) ||
                other.totalReply == totalReply) &&
            (identical(other.objectType, objectType) ||
                other.objectType == objectType) &&
            (identical(other.creatorFullName, creatorFullName) ||
                other.creatorFullName == creatorFullName) &&
            (identical(other.updated, updated) || other.updated == updated) &&
            (identical(other.updaterKey, updaterKey) ||
                other.updaterKey == updaterKey));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      objectId,
      creatorKey,
      created,
      creatorEmail,
      isPrivate,
      body,
      avatar,
      totalReply,
      objectType,
      creatorFullName,
      updated,
      updaterKey);

  /// Create a copy of CommentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentModelImplCopyWith<_$CommentModelImpl> get copyWith =>
      __$$CommentModelImplCopyWithImpl<_$CommentModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommentModelImplToJson(
      this,
    );
  }
}

abstract class _CommentModel extends CommentModel {
  const factory _CommentModel(
      {final int id,
      final int objectId,
      final String creatorKey,
      final String? created,
      final String? creatorEmail,
      final bool? isPrivate,
      final String? body,
      @JsonKey(name: 'Avatar') final String? avatar,
      @JsonKey(name: 'TotalReply') final int? totalReply,
      final CommentType? objectType,
      final String? creatorFullName,
      final String? updated,
      final String? updaterKey}) = _$CommentModelImpl;
  const _CommentModel._() : super._();

  factory _CommentModel.fromJson(Map<String, dynamic> json) =
      _$CommentModelImpl.fromJson;

  @override
  int get id;
  @override
  int get objectId;
  @override
  String get creatorKey;
  @override
  String? get created;
  @override
  String? get creatorEmail;
  @override
  bool? get isPrivate;
  @override
  String? get body;
  @override
  @JsonKey(name: 'Avatar')
  String? get avatar;
  @override
  @JsonKey(name: 'TotalReply')
  int? get totalReply;
  @override
  CommentType? get objectType;
  @override
  String? get creatorFullName;
  @override
  String? get updated;
  @override
  String? get updaterKey;

  /// Create a copy of CommentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommentModelImplCopyWith<_$CommentModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
