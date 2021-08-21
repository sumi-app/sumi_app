// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiReview _$ApiReviewFromJson(Map<String, dynamic> json) {
  return ApiReview(
    id: json['id'] as int,
    bloggerId: json['blogger_id'] as int,
    postLink: json['post_link'] as String,
  );
}

Map<String, dynamic> _$ApiReviewToJson(ApiReview instance) => <String, dynamic>{
      'id': instance.id,
      'blogger_id': instance.bloggerId,
      'post_link': instance.postLink,
    };
