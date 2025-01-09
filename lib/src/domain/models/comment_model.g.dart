// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentModelImpl _$$CommentModelImplFromJson(Map<String, dynamic> json) =>
    _$CommentModelImpl(
      id: (json['id'] as num?)?.toInt() ?? -1,
      objectId: (json['objectId'] as num?)?.toInt() ?? -1,
      creatorKey: json['creatorKey'] as String? ?? '',
      created: json['created'] as String?,
      creatorEmail: json['creatorEmail'] as String?,
      isPrivate: json['isPrivate'] as bool?,
      body: json['body'] as String?,
      avatar: json['Avatar'] as String?,
      totalReply: (json['TotalReply'] as num?)?.toInt(),
      objectType: $enumDecodeNullable(_$CommentTypeEnumMap, json['objectType']),
      creatorFullName: json['creatorFullName'] as String?,
      updated: json['updated'] as String?,
      updaterKey: json['updaterKey'] as String?,
    );

Map<String, dynamic> _$$CommentModelImplToJson(_$CommentModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'objectId': instance.objectId,
      'creatorKey': instance.creatorKey,
      'created': instance.created,
      'creatorEmail': instance.creatorEmail,
      'isPrivate': instance.isPrivate,
      'body': instance.body,
      'Avatar': instance.avatar,
      'TotalReply': instance.totalReply,
      'objectType': _$CommentTypeEnumMap[instance.objectType],
      'creatorFullName': instance.creatorFullName,
      'updated': instance.updated,
      'updaterKey': instance.updaterKey,
    };

const _$CommentTypeEnumMap = {
  CommentType.ticket: 'Ticket',
};
