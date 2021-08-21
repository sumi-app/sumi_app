import 'package:json_annotation/json_annotation.dart';

part 'review.g.dart';

@JsonSerializable()
class ApiReview {
  const ApiReview({
    required this.id,
    required this.bloggerId,
    required this.postLink,
  });

  final int id;
  @JsonKey(name: 'blogger_id')
  final int bloggerId;
  @JsonKey(name: 'post_link')
  final String postLink;

  factory ApiReview.fromJson(Map<String, dynamic> json) =>
      _$ApiReviewFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ApiReviewToJson(this);
}
