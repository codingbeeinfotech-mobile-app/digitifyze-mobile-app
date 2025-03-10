// To parse this JSON data, do
//
//     final kycLeadRequest = kycLeadRequestFromJson(jsonString);

import 'dart:convert';

KycLeadRequest kycLeadRequestFromJson(String str) =>
    KycLeadRequest.fromJson(json.decode(str));

String kycLeadRequestToJson(KycLeadRequest data) => json.encode(data.toJson());

class KycLeadRequest {
  int leadId;  bool isSmartPhoneUser;
  int maritialStatus;
  String aadharNo;
  String dob;
  String currentAddress;
  String permanentAddress;
  String panNo;
  int bankId;
  String accountNo;
  String ifscCode;
  String ref1Name;
  String ref1MobileNo;
  String ref2Name;
  String ref2MobileNo;
  int cibilScore;
  int loanNo;
  String dlNo;
  String rcNo;
  String rcDate;
  String vehicleDate;
  int vehicleAge;
  double latitude;
  double longitude;
  String userPic;
  String aadharFrontPic;
  String aadharBackPic;
  String panCardPic;
  String nocDocument;
  String dlPic;
  String rcPic;
  String blanckCheckPic;
  String selfieWithDriver;
  String driverPic1;
  String driverPic2;
  String driverPic3;
  String driverPic4;
  String driverPic5;
  String ownershipPic;
  int entryBy;
  DateTime entryDate;
  int updateBy;
  DateTime updateDate;
  int vehicleOwnershipId;
  int vehicleMakeId;
  int houseOwnershipId;




  KycLeadRequest({
    required this.leadId,
    required this.vehicleOwnershipId,
    required this.vehicleMakeId,
    required this.houseOwnershipId,
    required this.isSmartPhoneUser,
    required this.maritialStatus,
    required this.aadharNo,
    required this.dob,
    required this.currentAddress,
    required this.permanentAddress,
    required this.panNo,
    required this.bankId,
    required this.accountNo,
    required this.ifscCode,
    required this.ref1Name,
    required this.ref1MobileNo,
    required this.ref2Name,
    required this.ref2MobileNo,
    required this.cibilScore,
    required this.loanNo,
    required this.dlNo,
    required this.rcNo,
    required this.rcDate,
    required this.vehicleDate,
    required this.vehicleAge,
    required this.latitude,
    required this.longitude,
    required this.userPic,
    required this.aadharFrontPic,
    required this.aadharBackPic,
    required this.panCardPic,
    required this.nocDocument,
    required this.dlPic,
    required this.rcPic,
    required this.blanckCheckPic,
    required this.selfieWithDriver,
    required this.driverPic1,
    required this.driverPic2,
    required this.driverPic3,
    required this.driverPic4,
    required this.driverPic5,
    required this.ownershipPic,
    required this.entryBy,
    required this.entryDate,
    required this.updateBy,
    required this.updateDate,
  });

  factory KycLeadRequest.fromJson(Map<String, dynamic> json) => KycLeadRequest(
        leadId: json["LeadId"],
          isSmartPhoneUser: json["IsSmartPhoneUser"],
        maritialStatus: json["MaritialStatus"],
        aadharNo: json["AadharNo"],
        dob: json['DOB'],
        currentAddress: json["CurrentAddress"],
        permanentAddress: json["PermanentAddress"],
        panNo: json["PanNo"],
        bankId: json["BankId"],
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
        rcDate: json["RCDate"],
        vehicleDate: json["VehicleDate"],
        vehicleAge: json["VehicleAge"],
        latitude: json["Latitude"]?.toDouble(),
        longitude: json["Longitude"]?.toDouble(),
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
        entryDate: DateTime.parse(json["EntryDate"]),
        updateBy: json["UpdateBy"],
        updateDate: DateTime.parse(json["UpdateDate"]),
    vehicleOwnershipId: json["VehicleOwnershipId"],
    vehicleMakeId: json["VehicleMakeId"],
    houseOwnershipId: json["HouseOwnershipId"],

  );

  Map<String, dynamic> toJson() => {
        "LeadId": leadId,
          "IsSmartPhoneUser": isSmartPhoneUser,
        "MaritialStatus": maritialStatus,
        "AadharNo": aadharNo,
        "DOB": dob,
        "CurrentAddress": currentAddress,
        "PermanentAddress": permanentAddress,
        "PanNo": panNo,
        "BankId": bankId,
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
        "EntryDate": entryDate.toString(),
        "UpdateBy": updateBy,
        "UpdateDate": updateDate.toString(),
    "VehicleOwnershipId": vehicleOwnershipId,
    "VehicleMakeId": vehicleMakeId,
    "HouseOwnershipId": houseOwnershipId,

  };
}
