
class LoginTokenModel {
  final String? accessToken;
  final String? tokenType;
  final int? expiresIn;

  LoginTokenModel({
    this.accessToken,
    this.tokenType,
    this.expiresIn,
  });

  factory LoginTokenModel.fromJson(Map<String, dynamic> json) {
    return LoginTokenModel(
      accessToken: json["access_token"] ?? "",
      tokenType: json["token_type"] ?? "",
      expiresIn: json["expires_in"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "access_token": accessToken,
      "token_type": tokenType,
      "expires_in": expiresIn,
    };
  }
}
