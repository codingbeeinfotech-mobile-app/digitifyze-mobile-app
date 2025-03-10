
class GetLeadModel {
  final int? totalCount;
  final int? filterCount;
  final List<GetLeadDatum>? data;

  GetLeadModel({
    this.totalCount,
    this.filterCount,
    this.data,
  });

  factory GetLeadModel.fromJson(Map<String, dynamic> json) => GetLeadModel(
    totalCount: json["TotalCount"],
    filterCount: json["FilterCount"],
    data: json["data"] == null ? [] : List<GetLeadDatum>.from(json["data"]!.map((x) => GetLeadDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "TotalCount": totalCount,
    "FilterCount": filterCount,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class GetLeadDatum {
  final int? leadId;
  final int? sourceId;
  final String? source;
  final String? leadCode;
  final dynamic firstName;
  final dynamic lastName;
  final DateTime? dateOfBirth;
  final dynamic mobileNo;
  final dynamic alternateMobileNo;
  final int? genderId;
  final dynamic gender;
  final dynamic pincode;
  final dynamic address;
  final dynamic landmark;
  final int? countryId;
  final dynamic countryName;
  final int? stateId;
  final dynamic stateName;
  final int? cityId;
  final dynamic cityName;
  final int? clusterId;
  final dynamic cluster;
  final int? dealerId;
  final dynamic dealer;
  final int? businessSegmentId;
  final dynamic businessSegment;
  final int? vehicleTypeId;
  final dynamic vehicleType;
  final int? serviceTypeId;
  final dynamic serviceType;
  final int? vehicleFinanceStatusId;
  final dynamic vehicleFinanceStatus;
  final bool? moveToKycVerification;
  final int? userId;
  final dynamic entryByName;
  final dynamic statusId;
  final String? status;
  final dynamic approvedStatus;
  final dynamic activeStatus;
  final dynamic remark;
  final DateTime? fromDate;
  final DateTime? entryDate;
  final DateTime? toDate;
  final bool? isOnlyRemarkUpdate;
  final int? totalCount;
  final int? filterCount;
  final int? salesTypeId;
  final String? salesType;
  final String? referralCode;

  GetLeadDatum({
    this.leadId,
    this.sourceId,
    this.source,
    this.leadCode,
    this.firstName,
    this.lastName,
    this.dateOfBirth,
    this.mobileNo,
    this.alternateMobileNo,
    this.genderId,
    this.gender,
    this.pincode,
    this.address,
    this.landmark,
    this.countryId,
    this.countryName,
    this.stateId,
    this.stateName,
    this.cityId,
    this.cityName,
    this.clusterId,
    this.cluster,
    this.dealerId,
    this.dealer,
    this.businessSegmentId,
    this.businessSegment,
    this.vehicleTypeId,
    this.vehicleType,
    this.serviceTypeId,
    this.serviceType,
    this.vehicleFinanceStatusId,
    this.vehicleFinanceStatus,
    this.moveToKycVerification,
    this.userId,
    this.entryByName,
    this.statusId,
    this.status,
    this.approvedStatus,
    this.activeStatus,
    this.remark,
    this.fromDate,
    this.entryDate,
    this.toDate,
    this.isOnlyRemarkUpdate,
    this.totalCount,
    this.filterCount,
    this.salesTypeId,
    this.salesType,
    this.referralCode,
  });

  factory GetLeadDatum.fromJson(Map<String, dynamic> json) => GetLeadDatum(
    leadId: json["LeadId"],
    sourceId: json["SourceId"],
    source: json["Source"],
    leadCode: json["LeadCode"],
    firstName: json["FirstName"],
    lastName: json["LastName"],
    dateOfBirth: json["DateOfBirth"] == null ? null : DateTime.parse(json["DateOfBirth"]),
    mobileNo: json["MobileNo"],
    alternateMobileNo: json["AlternateMobileNo"],
    genderId: json["GenderId"],
    gender: json["Gender"],
    pincode: json["Pincode"],
    address: json["Address"],
    landmark: json["Landmark"],
    countryId: json["CountryId"],
    countryName: json["CountryName"],
    stateId: json["StateId"],
    stateName: json["StateName"],
    cityId: json["CityId"],
    cityName: json["CityName"],
    clusterId: json["ClusterId"],
    cluster: json["Cluster"],
    dealerId: json["DealerId"],
    dealer: json["Dealer"],
    businessSegmentId: json["BusinessSegmentId"],
    businessSegment: json["BusinessSegment"],
    vehicleTypeId: json["VehicleTypeId"],
    vehicleType: json["VehicleType"],
    serviceTypeId: json["ServiceTypeId"],
    serviceType: json["ServiceType"],
    vehicleFinanceStatusId: json["VehicleFinanceStatusId"],
    vehicleFinanceStatus: json["VehicleFinanceStatus"],
    moveToKycVerification: json["MoveToKycVerification"],
    userId: json["UserId"],
    entryByName: json["EntryByName"],
    statusId: json["StatusId"],
    status: json["Status"],
    approvedStatus: json["ApprovedStatus"],
    activeStatus: json["ActiveStatus"],
    remark: json["Remark"],
    fromDate: json["FromDate"] == null ? null : DateTime.parse(json["FromDate"]),
    entryDate: json["EntryDate"] == null ? null : DateTime.parse(json["EntryDate"]),
    toDate: json["ToDate"] == null ? null : DateTime.parse(json["ToDate"]),
    isOnlyRemarkUpdate: json["IsOnlyRemarkUpdate"],
    totalCount: json["TotalCount"],
    filterCount: json["FilterCount"],
    salesTypeId: json["SalesTypeId"],
    salesType: json["SalesType"],
    referralCode: json["ReferralCode"],
  );

  Map<String, dynamic> toJson() => {
    "LeadId": leadId,
    "SourceId": sourceId,
    "Source": source,
    "LeadCode": leadCode,
    "FirstName": firstName,
    "LastName": lastName,
    "DateOfBirth": dateOfBirth?.toIso8601String(),
    "MobileNo": mobileNo,
    "AlternateMobileNo": alternateMobileNo,
    "GenderId": genderId,
    "Gender": gender,
    "Pincode": pincode,
    "Address": address,
    "Landmark": landmark,
    "CountryId": countryId,
    "CountryName": countryName,
    "StateId": stateId,
    "StateName": stateName,
    "CityId": cityId,
    "CityName": cityName,
    "ClusterId": clusterId,
    "Cluster": cluster,
    "DealerId": dealerId,
    "Dealer": dealer,
    "BusinessSegmentId": businessSegmentId,
    "BusinessSegment": businessSegment,
    "VehicleTypeId": vehicleTypeId,
    "VehicleType": vehicleType,
    "ServiceTypeId": serviceTypeId,
    "ServiceType": serviceType,
    "VehicleFinanceStatusId": vehicleFinanceStatusId,
    "VehicleFinanceStatus": vehicleFinanceStatus,
    "MoveToKycVerification": moveToKycVerification,
    "UserId": userId,
    "EntryByName": entryByName,
    "StatusId": statusId,
    "Status": status,
    "ApprovedStatus": approvedStatus,
    "ActiveStatus": activeStatus,
    "Remark": remark,
    "FromDate": fromDate?.toString(),
    "EntryDate": entryDate?.toString(),
    "ToDate": toDate?.toString(),
    "IsOnlyRemarkUpdate": isOnlyRemarkUpdate,
    "TotalCount": totalCount,
    "FilterCount": filterCount,
    "SalesTypeId": salesTypeId,
    "SalesType": salesType,
    "ReferralCode": referralCode,
  };
}
