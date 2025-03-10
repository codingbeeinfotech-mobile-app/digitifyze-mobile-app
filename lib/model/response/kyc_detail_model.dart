// To parse this JSON data, do
//
//     final kycDetailModel = kycDetailModelFromJson(jsonString?);

import 'dart:convert';

KycDetailModel kycDetailModelFromJson(String? str) => KycDetailModel.fromJson(json.decode(str!));

String? kycDetailModelToJson(KycDetailModel data) => json.encode(data.toJson());

class KycDetailModel {
  String? leadCode;
  String? leadName;
  String? mobileNo;
  int? statusId;
  int? stageId;
  int? leadId;
  bool? isSmartPhoneUser;
  int? maritialStatus;
  String? maritialStatusDetail;
  String? aadharNo;
  DateTime? dob;
  String? currentAddress;
  String? permanentAddress;
  String? panNo;
  int? vehicleOwnershipId;
  String? vehicleOwnership;
  int? houseOwnershipId;
  String? houseOwnership;
  int? bankId;
  String? bank;
  String? accountNo;
  String? ifscCode;
  String? ref1Name;
  String? ref1MobileNo;
  String? ref2Name;
  String? ref2MobileNo;
  int? cibilScore;
  int? loanNo;
  String? dlNo;
  String? rcNo;
  DateTime? rcDate;
  DateTime? vehicleDate;
  int? vehicleAge;
  int? vehicleMakeId;
  String? vehicleMake;
  double? latitude;
  double? longitude;
  String? userPic;
  String? aadharFrontPic;
  String? aadharBackPic;
  String? panCardPic;
  String? nocDocument;
  String? dlPic;
  String? rcPic;
  String? blanckCheckPic;
  String? selfieWithDriver;
  String? driverPic1;
  String? driverPic2;
  String? driverPic3;
  String? driverPic4;
  String? driverPic5;
  String? ownershipPic;
  int? entryBy;
  String? entryByName;
  DateTime? entryDate;
  int? updateBy;
  dynamic updateByName;
  DateTime? updateDate;
  bool? isDriverPicMandatory;
  bool? isSmartphoneUserMandatory;
  bool? isMaritalStatusMandatory;
  bool? isAadharPicMandatory;
  bool? isAadharNoMandatory;
  bool? isDateOfBirthMandatory;
  bool? isCurrentAddressMandatory;
  bool? isPermanentMandatory;
  bool? isPancardPicMandatory;
  bool? isPancardNoMandatory;
  bool? isVehicleOwnershipMandatory;
  bool? isNocDocumentationMandatory;
  bool? isLoanNoMandatory;
  bool? isDlPicMandatory;
  bool? isDlNoMandatory;
  bool? isRcPicMandatory;
  bool? isRcNoMandatory;
  bool? isRegistrationDateMandatory;
  bool? isVehicleAgeMandatory;
  bool? isVehicleMakeMandatory;
  bool? isLatitudeMandatory;
  bool? isLongitudeMandatory;
  bool? isBankNameMandatory;
  bool? isAccountNoMandatory;
  bool? isIfscCodeMandatory;
  bool? isBankChequePicMandatory;
  bool? isSelfieWithDriverPicMandatory;
  bool? isReference1NameMandatory;
  bool? isReference1MobileMandatory;
  bool? isReference2NameMandatory;
  bool? isReference2MobileMandatory;
  bool? isHouseOwnershipMandatory;
  bool? isElectricityBillMandatory;
  bool? isCibilScoreMandatory;

  KycDetailModel({
    this.leadCode,
    this.leadName,
    this.mobileNo,
    this.statusId,
    this.stageId,
    this.leadId,
    this.isSmartPhoneUser,
    this.maritialStatus,
    this.maritialStatusDetail,
    this.aadharNo,
    this.dob,
    this.currentAddress,
    this.permanentAddress,
    this.panNo,
    this.vehicleOwnershipId,
    this.vehicleOwnership,
    this.houseOwnershipId,
    this.houseOwnership,
    this.bankId,
    this.bank,
    this.accountNo,
    this.ifscCode,
    this.ref1Name,
    this.ref1MobileNo,
    this.ref2Name,
    this.ref2MobileNo,
    this.cibilScore,
    this.loanNo,
    this.dlNo,
    this.rcNo,
    this.rcDate,
    this.vehicleDate,
    this.vehicleAge,
    this.vehicleMakeId,
    this.vehicleMake,
    this.latitude,
    this.longitude,
    this.userPic,
    this.aadharFrontPic,
    this.aadharBackPic,
    this.panCardPic,
    this.nocDocument,
    this.dlPic,
    this.rcPic,
    this.blanckCheckPic,
    this.selfieWithDriver,
    this.driverPic1,
    this.driverPic2,
    this.driverPic3,
    this.driverPic4,
    this.driverPic5,
    this.ownershipPic,
    this.entryBy,
    this.entryByName,
    this.entryDate,
    this.updateBy,
    this.updateByName,
    this.updateDate,
    this.isDriverPicMandatory,
    this.isSmartphoneUserMandatory,
    this.isMaritalStatusMandatory,
    this.isAadharPicMandatory,
    this.isAadharNoMandatory,
    this.isDateOfBirthMandatory,
    this.isCurrentAddressMandatory,
    this.isPermanentMandatory,
    this.isPancardPicMandatory,
    this.isPancardNoMandatory,
    this.isVehicleOwnershipMandatory,
    this.isNocDocumentationMandatory,
    this.isLoanNoMandatory,
    this.isDlPicMandatory,
    this.isDlNoMandatory,
    this.isRcPicMandatory,
    this.isRcNoMandatory,
    this.isRegistrationDateMandatory,
    this.isVehicleAgeMandatory,
    this.isVehicleMakeMandatory,
    this.isLatitudeMandatory,
    this.isLongitudeMandatory,
    this.isBankNameMandatory,
    this.isAccountNoMandatory,
    this.isIfscCodeMandatory,
    this.isBankChequePicMandatory,
    this.isSelfieWithDriverPicMandatory,
    this.isReference1NameMandatory,
    this.isReference1MobileMandatory,
    this.isReference2NameMandatory,
    this.isReference2MobileMandatory,
    this.isHouseOwnershipMandatory,
    this.isElectricityBillMandatory,
    this.isCibilScoreMandatory,
  });

  factory KycDetailModel.fromJson(Map<String?, dynamic> json) => KycDetailModel(
    leadCode: json["LeadCode"],
    leadName: json["LeadName"],
    mobileNo: json["MobileNo"],
    statusId: json["StatusId"],
    stageId: json["StageId"],
    leadId: json["LeadId"],
    isSmartPhoneUser: json["IsSmartPhoneUser"],
    maritialStatus: json["MaritialStatus"],
    maritialStatusDetail: json["MaritialStatusDetail"],
    aadharNo: json["AadharNo"],
    dob: DateTime.parse(json["DOB"]),
    currentAddress: json["CurrentAddress"],
    permanentAddress: json["PermanentAddress"],
    panNo: json["PanNo"],
    vehicleOwnershipId: json["VehicleOwnershipId"],
    vehicleOwnership: json["VehicleOwnership"],
    houseOwnershipId: json["HouseOwnershipId"],
    houseOwnership: json["HouseOwnership"],
    bankId: json["BankId"],
    bank: json["Bank"],
    accountNo: json["AccountNo"],
    ifscCode: json["IFSCCode"],
    ref1Name: json["Ref1Name"],
    ref1MobileNo: json["Ref1MobileNo"],
    ref2Name: json["Ref2Name"],
    ref2MobileNo: json["Ref2MobileNo"],
    cibilScore: json["CIBILScore"],
    loanNo: json["LoanNo"],
    dlNo: json["DLNo"],
    rcNo: json["RCNo"],
    rcDate: DateTime.parse(json["RCDate"]),
    vehicleDate: DateTime.parse(json["VehicleDate"]),
    vehicleAge: json["VehicleAge"],
    vehicleMakeId: json["VehicleMakeId"],
    vehicleMake: json["VehicleMake"],
    latitude: json["Latitude"].toDouble(),
    longitude: json["Longitude"].toDouble(),
    userPic: json["UserPic"],
    aadharFrontPic: json["AadharFrontPic"],
    aadharBackPic: json["AadharBackPic"],
    panCardPic: json["PanCardPic"],
    nocDocument: json["NOCDocument"],
    dlPic: json["DLPic"],
    rcPic: json["RCPic"],
    blanckCheckPic: json["BlanckCheckPic"],
    selfieWithDriver: json["SelfieWithDriver"],
    driverPic1: json["DriverPic1"],
    driverPic2: json["DriverPic2"],
    driverPic3: json["DriverPic3"],
    driverPic4: json["DriverPic4"],
    driverPic5: json["DriverPic5"],
    ownershipPic: json["OwnershipPic"],
    entryBy: json["EntryBy"],
    entryByName: json["EntryByName"],
    entryDate: DateTime.parse(json["EntryDate"]),
    updateBy: json["UpdateBy"],
    updateByName: json["UpdateByName"],
    updateDate: DateTime.parse(json["UpdateDate"]),
    isDriverPicMandatory: json["IsDriverPicMandatory"],
    isSmartphoneUserMandatory: json["IsSmartphoneUserMandatory"],
    isMaritalStatusMandatory: json["IsMaritalStatusMandatory"],
    isAadharPicMandatory: json["IsAadharPicMandatory"],
    isAadharNoMandatory: json["IsAadharNoMandatory"],
    isDateOfBirthMandatory: json["IsDateOfBirthMandatory"],
    isCurrentAddressMandatory: json["IsCurrentAddressMandatory"],
    isPermanentMandatory: json["IsPermanentMandatory"],
    isPancardPicMandatory: json["IsPancardPicMandatory"],
    isPancardNoMandatory: json["IsPancardNoMandatory"],
    isVehicleOwnershipMandatory: json["IsVehicleOwnershipMandatory"],
    isNocDocumentationMandatory: json["IsNocDocumentationMandatory"],
    isLoanNoMandatory: json["IsLoanNoMandatory"],
    isDlPicMandatory: json["IsDLPicMandatory"],
    isDlNoMandatory: json["IsDLNoMandatory"],
    isRcPicMandatory: json["IsRCPicMandatory"],
    isRcNoMandatory: json["IsRCNoMandatory"],
    isRegistrationDateMandatory: json["IsRegistrationDateMandatory"],
    isVehicleAgeMandatory: json["IsVehicleAgeMandatory"],
    isVehicleMakeMandatory: json["IsVehicleMakeMandatory"],
    isLatitudeMandatory: json["IsLatitudeMandatory"],
    isLongitudeMandatory: json["IsLongitudeMandatory"],
    isBankNameMandatory: json["IsBankNameMandatory"],
    isAccountNoMandatory: json["IsAccountNoMandatory"],
    isIfscCodeMandatory: json["IsIFSCCodeMandatory"],
    isBankChequePicMandatory: json["IsBankChequePicMandatory"],
    isSelfieWithDriverPicMandatory: json["IsSelfieWithDriverPicMandatory"],
    isReference1NameMandatory: json["IsReference1NameMandatory"],
    isReference1MobileMandatory: json["IsReference1MobileMandatory"],
    isReference2NameMandatory: json["IsReference2NameMandatory"],
    isReference2MobileMandatory: json["IsReference2MobileMandatory"],
    isHouseOwnershipMandatory: json["IsHouseOwnershipMandatory"],
    isElectricityBillMandatory: json["IsElectricityBillMandatory"],
    isCibilScoreMandatory: json["IsCIBILScoreMandatory"],
  );

  Map<String?, dynamic> toJson() => {
    "LeadCode": leadCode,
    "LeadName": leadName,
    "MobileNo": mobileNo,
    "StatusId": statusId,
    "StageId": stageId,
    "LeadId": leadId,
    "IsSmartPhoneUser": isSmartPhoneUser,
    "MaritialStatus": maritialStatus,
    "MaritialStatusDetail": maritialStatusDetail,
    "AadharNo": aadharNo,
    "DOB": dob,
    "CurrentAddress": currentAddress,
    "PermanentAddress": permanentAddress,
    "PanNo": panNo,
    "VehicleOwnershipId": vehicleOwnershipId,
    "VehicleOwnership": vehicleOwnership,
    "HouseOwnershipId": houseOwnershipId,
    "HouseOwnership": houseOwnership,
    "BankId": bankId,
    "Bank": bank,
    "AccountNo": accountNo,
    "IFSCCode": ifscCode,
    "Ref1Name": ref1Name,
    "Ref1MobileNo": ref1MobileNo,
    "Ref2Name": ref2Name,
    "Ref2MobileNo": ref2MobileNo,
    "CIBILScore": cibilScore,
    "LoanNo": loanNo,
    "DLNo": dlNo,
    "RCNo": rcNo,
    "RCDate": rcDate,
    "VehicleDate": vehicleDate,
    "VehicleAge": vehicleAge,
    "VehicleMakeId": vehicleMakeId,
    "VehicleMake": vehicleMake,
    "Latitude": latitude,
    "Longitude": longitude,
    "UserPic": userPic,
    "AadharFrontPic": aadharFrontPic,
    "AadharBackPic": aadharBackPic,
    "PanCardPic": panCardPic,
    "NOCDocument": nocDocument,
    "DLPic": dlPic,
    "RCPic": rcPic,
    "BlanckCheckPic": blanckCheckPic,
    "SelfieWithDriver": selfieWithDriver,
    "DriverPic1": driverPic1,
    "DriverPic2": driverPic2,
    "DriverPic3": driverPic3,
    "DriverPic4": driverPic4,
    "DriverPic5": driverPic5,
    "OwnershipPic": ownershipPic,
    "EntryBy": entryBy,
    "EntryByName": entryByName,
    "EntryDate": entryDate,
    "UpdateBy": updateBy,
    "UpdateByName": updateByName,
    "UpdateDate": updateDate,
    "IsDriverPicMandatory": isDriverPicMandatory,
    "IsSmartphoneUserMandatory": isSmartphoneUserMandatory,
    "IsMaritalStatusMandatory": isMaritalStatusMandatory,
    "IsAadharPicMandatory": isAadharPicMandatory,
    "IsAadharNoMandatory": isAadharNoMandatory,
    "IsDateOfBirthMandatory": isDateOfBirthMandatory,
    "IsCurrentAddressMandatory": isCurrentAddressMandatory,
    "IsPermanentMandatory": isPermanentMandatory,
    "IsPancardPicMandatory": isPancardPicMandatory,
    "IsPancardNoMandatory": isPancardNoMandatory,
    "IsVehicleOwnershipMandatory": isVehicleOwnershipMandatory,
    "IsNocDocumentationMandatory": isNocDocumentationMandatory,
    "IsLoanNoMandatory": isLoanNoMandatory,
    "IsDLPicMandatory": isDlPicMandatory,
    "IsDLNoMandatory": isDlNoMandatory,
    "IsRCPicMandatory": isRcPicMandatory,
    "IsRCNoMandatory": isRcNoMandatory,
    "IsRegistrationDateMandatory": isRegistrationDateMandatory,
    "IsVehicleAgeMandatory": isVehicleAgeMandatory,
    "IsVehicleMakeMandatory": isVehicleMakeMandatory,
    "IsLatitudeMandatory": isLatitudeMandatory,
    "IsLongitudeMandatory": isLongitudeMandatory,
    "IsBankNameMandatory": isBankNameMandatory,
    "IsAccountNoMandatory": isAccountNoMandatory,
    "IsIFSCCodeMandatory": isIfscCodeMandatory,
    "IsBankChequePicMandatory": isBankChequePicMandatory,
    "IsSelfieWithDriverPicMandatory": isSelfieWithDriverPicMandatory,
    "IsReference1NameMandatory": isReference1NameMandatory,
    "IsReference1MobileMandatory": isReference1MobileMandatory,
    "IsReference2NameMandatory": isReference2NameMandatory,
    "IsReference2MobileMandatory": isReference2MobileMandatory,
    "IsHouseOwnershipMandatory": isHouseOwnershipMandatory,
    "IsElectricityBillMandatory": isElectricityBillMandatory,
    "IsCIBILScoreMandatory": isCibilScoreMandatory,
  };
}
