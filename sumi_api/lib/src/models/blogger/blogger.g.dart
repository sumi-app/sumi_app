// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blogger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiBlogger _$ApiBloggerFromJson(Map<String, dynamic> json) {
  return ApiBlogger(
    id: json['id'] as int,
    name: json['name'] as String,
    login: json['login'] as String,
    type: json['type'] as String,
    socialNetwork: json['social_network'] as int,
    description: json['description'] as String,
    count: json['count'] as int,
    avatar: json['avatar'] as String,
    cost: json['cost'] as int,
    coverage: json['coverage'] as int,
  );
}

Map<String, dynamic> _$ApiBloggerToJson(ApiBlogger instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'login': instance.login,
      'type': instance.type,
      'social_network': instance.socialNetwork,
      'description': instance.description,
      'count': instance.count,
      'avatar': instance.avatar,
      'cost': instance.cost,
      'coverage': instance.coverage,
    };
