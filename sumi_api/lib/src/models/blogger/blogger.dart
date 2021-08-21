import 'package:json_annotation/json_annotation.dart';

part 'blogger.g.dart';

@JsonSerializable()
class ApiBlogger {
  const ApiBlogger({
    required this.id,
    required this.name,
    required this.login,
    required this.type,
    required this.socialNetwork,
    required this.description,
    required this.count,
    required this.avatar,
    required this.cost,
    required this.coverage,
  });

  final int id;
  @JsonKey(required: false)
  final String name;
  final String login;
  @JsonKey(required: false)
  final String type;
  @JsonKey(name: "social_network", required: false)
  final int socialNetwork;
  @JsonKey(required: false)
  final String description;
  @JsonKey(required: false)
  final int count;
  @JsonKey(required: false)
  final String avatar;
  @JsonKey(required: false)
  final int cost;
  @JsonKey(required: false)
  final int coverage;

  factory ApiBlogger.fromJson(Map<String, dynamic> json) =>
      _$ApiBloggerFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ApiBloggerToJson(this);
}
