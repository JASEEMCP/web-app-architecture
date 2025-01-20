import 'package:json_annotation/json_annotation.dart';

part 'token.g.dart';

@JsonSerializable()
class Token {
  @JsonKey(name: 'refresh_token')
  String? refreshToken;
  @JsonKey(name: 'access_token')
  String? accessToken;
  @JsonKey(name: 'is_profile_created')
  bool? isProfileCreated;
  @JsonKey(name: 'name')
  String? name;

  Token({
    this.refreshToken,
    this.accessToken,
    this.name,
    this.isProfileCreated,
  });

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);

  Map<String, dynamic> toJson() => _$TokenToJson(this);

  Token copyWith({
    String? refreshToken,
    String? accessToken,
    bool? isProfileCreated,
    String? name,
  }) {
    return Token(
      refreshToken: refreshToken ?? this.refreshToken,
      accessToken: accessToken ?? this.accessToken,
      name: name ?? this.name,
      isProfileCreated: isProfileCreated ?? this.isProfileCreated,
    );
  }
}
