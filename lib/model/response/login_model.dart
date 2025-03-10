

class LoginModel {
  String? clientName;
  String? clientId;
  String? companyId;
  String? flagMsg;
  String? isLogin;
  String? mobileNo;
  String? roleId;
  String? userId;
  String? userName;
  String? wareHouseId;
  dynamic fcmToken;
  int? userTypeId;

  LoginModel({
    this.clientName,
    this.clientId,
    this.companyId,
    this.flagMsg,
    this.isLogin,
    this.mobileNo,
    this.roleId,
    this.userId,
    this.userName,
    this.wareHouseId,
    this.fcmToken,
    this.userTypeId,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    clientName: json["ClientName"],
    clientId: json["ClientId"],
    companyId: json["CompanyId"],
    flagMsg: json["FlagMsg"],
    isLogin: json["IsLogin"],
    mobileNo: json["MobileNo"],
    roleId: json["RoleId"],
    userId: json["UserId"],
    userName: json["UserName"],
    wareHouseId: json["WareHouseId"],
    fcmToken: json["FcmToken"],
    userTypeId: json["UserTypeId"],
  );

  Map<String, dynamic> toJson() => {
    "ClientName": clientName,
    "ClientId": clientId,
    "CompanyId": companyId,
    "FlagMsg": flagMsg,
    "IsLogin": isLogin,
    "MobileNo": mobileNo,
    "RoleId": roleId,
    "UserId": userId,
    "UserName": userName,
    "WareHouseId": wareHouseId,
    "FcmToken": fcmToken,
    "UserTypeId": userTypeId,
  };
}
