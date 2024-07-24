class TokenRes {
  String accessToken;
  String tokenType;
  int expiresIn;

  TokenRes({
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
  });

  TokenRes copyWith({
    String? accessToken,
    String? tokenType,
    int? expiresIn,
  }) =>
      TokenRes(
        accessToken: accessToken ?? this.accessToken,
        tokenType: tokenType ?? this.tokenType,
        expiresIn: expiresIn ?? this.expiresIn,
      );

  factory TokenRes.fromJson(Map<String, dynamic> json) => TokenRes(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        expiresIn: json["expires_in"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "expires_in": expiresIn,
      };
}
