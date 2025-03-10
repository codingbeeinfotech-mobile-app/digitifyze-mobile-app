import 'package:digitifyze/data/api_client.dart';
import 'package:digitifyze/model/response/lead_field_model.dart';
import 'package:digitifyze/model/response/lead_res_model.dart';
import 'package:digitifyze/ui/screens/bottom_nav_bar/bottom_nav_bar_screen.dart';

import '../utils/import_utils.dart';

abstract class LeadRepository {
  Future<List<LeadFieldsModel>?> getLeadSourceList();
  Future<List<LeadFieldsModel>?> getGenderList();
  Future<List<LeadFieldsModel>?> getStateList();
  Future<List<LeadFieldsModel>?> getCityList({required int stateId});
  Future<List<LeadFieldsModel>?> getClusterList();
  Future<List<LeadFieldsModel>?> getDealerList();

  Future<List<LeadFieldsModel>?> getBusinessSegmentList();

  Future<List<LeadFieldsModel>?> getVehicleTypeList();
  Future<List<LeadFieldsModel>?> getSalesTypeList();
  Future<List<LeadFieldsModel>?> getLeadServiceTypeList();
  Future<List<LeadFieldsModel>?> getVehicleFinanceStatusList();

  Future<dynamic> getLeadDetails({required int leadId});

  Future<GetLeadModel?> getLeadList({
    required int pageId,
    required int recordCount,
    required String orderByColumn,
    required String sortDirection,
    required String searchKeyword,
  });

  Future<void> leadInsert({
    required String firstName,
    required String lastName,
    required String mobileNo,
    required String pinCode,
    required String referralCode,
    required String alternateMobileNo,
    required int sourceId,
    required int genderId,
    required String address,
    required String landmark,
    required int stateId,
    required int cityId,
    required int clusterId,
    required int dealerId,
    required int businessSegmentId,
    required int vehicleTypeId,
    required int salesTypeId,
    required int serviceTypeId,
    required int vehicleFinanceStatusId,
    required bool moveToKycVerification,
    required int userId,
  });

  Future<void> leadUpdate({
    required int leadId,
    required String firstName,
    required String lastName,
    required String mobileNo,
    required String pinCode,
    required String referralCode,
    required String alternateMobileNo,
    required int sourceId,
    required int genderId,
    required String address,
    required String landmark,
    required int stateId,
    required int cityId,
    required int clusterId,
    required int dealerId,
    required int businessSegmentId,
    required int vehicleTypeId,
    required int salesTypeId,
    required int serviceTypeId,
    required int vehicleFinanceStatusId,
    required bool moveToKycVerification,
    required int userId,
  });

}

class LeadRepositoryV1 extends LeadRepository {
  LeadRepositoryV1(this.api);
  final ApiClient api;

  @override
  Future<dynamic> getLeadDetails({required int leadId}) async {
    try {
      return await api.postData(
          uri: Uri.parse("${AppConfig.leadDetailsById}$leadId"),
          body: {},
          headers: api.createHeaders(authToken: ''),
          builder: (data) {
            Map<String, dynamic> jsonMap = json.decode(data);
            GetLeadDatum kycLeadModel = GetLeadDatum.fromJson(jsonMap);
            return kycLeadModel;
          });
    } catch (e) {
      debugPrint("Get Lead Exception => $e");
      return GetLeadDatum();
    }
  }

  @override
  Future<List<LeadFieldsModel>?> getLeadSourceList() async {
    try {
      return await api.getData(
        uri: Uri.parse("${AppConfig.getGeneralListById}116"),
        headers: api.createHeaders(authToken: ''),
        builder: (data) {
          List<dynamic> jsonList = json.decode(data); // Decode JSON as List

          List<LeadFieldsModel> leadFieldsList = jsonList
              .map((json) => LeadFieldsModel.fromJson(json))
              .toList(); // Convert List<dynamic> to List<LeadFieldsModel>

          leadFieldsList.insert(
            0,
            LeadFieldsModel(
              name: "Select Lead Source",
              value: "0",
              isActive: false,
              description: ""
            ),
          );

          print("LeadFieldsList: $leadFieldsList");

          return leadFieldsList;
        },
      );
    } catch (e) {
      debugPrint('Error during getLeadSourceList: $e');
      return null;
    }
  }

  @override
  Future<List<LeadFieldsModel>?> getGenderList() async {
    try {
      return await api.getData(
        uri: Uri.parse("${AppConfig.getGeneralListById}117"),
        headers: api.createHeaders(authToken: ''),
        builder: (data) {
          List<dynamic> jsonList = json.decode(data); // Decode JSON as List

          List<LeadFieldsModel> leadFieldsList = jsonList
              .map((json) => LeadFieldsModel.fromJson(json))
              .toList(); // Convert List<dynamic> to List<LeadFieldsModel>

          leadFieldsList.insert(
            0,
            LeadFieldsModel(
                name: "Select Gender",
                value: "0",
                isActive: false,
                description: ""
            ),
          );

          print("LeadFieldsList: $leadFieldsList");

          return leadFieldsList;
        },
      );
    } catch (e) {
      debugPrint('Error during getLoginToken: $e');
      return null;
    }
  }

  @override
  Future<List<LeadFieldsModel>?> getStateList() async {
    try {
      return await api.getData(
        uri: Uri.parse(AppConfig.getStateList),
        headers: api.createHeaders(authToken: ''),
        builder: (data) {
          List<dynamic> jsonList = json.decode(data); // Decode JSON as List

          List<LeadFieldsModel> leadFieldsList = jsonList
              .map((json) => LeadFieldsModel.fromJson(json))
              .toList(); // Convert List<dynamic> to List<LeadFieldsModel>

          leadFieldsList.insert(
            0,
            LeadFieldsModel(
                name: "Select State",
                value: "0",
                isActive: false,
                description: ""
            ),
          );

          print("LeadFieldsList: $leadFieldsList");

          return leadFieldsList;
        },
      );
    } catch (e) {
      debugPrint('Error during getLoginToken: $e');
      return null;
    }
  }

  @override
  Future<List<LeadFieldsModel>?> getCityList({required int stateId}) async {
    try {
      Map<String, dynamic> body = {"StateId": stateId}; // Raw JSON body

      return await api.getDatBody(
        uri: Uri.parse(AppConfig.getCityList),
        body: body,
        headers: api.createHeaders(authToken: ''),
        builder: (data) {
          List<dynamic> jsonList = json.decode(data);
          List<LeadFieldsModel> leadFieldsList =
              jsonList.map((json) => LeadFieldsModel.fromJson(json)).toList();

          leadFieldsList.insert(
            0,
            LeadFieldsModel(
                name: "Select City",
                value: "0",
                isActive: false,
                description: ""
            ),
          );

          print("LeadFieldsList: $leadFieldsList");
          return leadFieldsList;
        },
      );
    } catch (e) {
      debugPrint('Error during getCityList: $e');
      return null;
    }
  }

  @override
  Future<List<LeadFieldsModel>?> getClusterList() async {
    try {
      return await api.getData(
        uri: Uri.parse("${AppConfig.getGeneralListById}122"),
        headers: api.createHeaders(authToken: ''),
        builder: (data) {
          List<dynamic> jsonList = json.decode(data); // Decode JSON as List

          List<LeadFieldsModel> leadFieldsList = jsonList
              .map((json) => LeadFieldsModel.fromJson(json))
              .toList(); // Convert List<dynamic> to List<LeadFieldsModel>

          leadFieldsList.insert(
            0,
            LeadFieldsModel(
                name: "Select Cluster",
                value: "0",
                isActive: false,
                description: ""
            ),
          );

          print("LeadFieldsList: $leadFieldsList");

          return leadFieldsList;
        },
      );
    } catch (e) {
      debugPrint('Error during getLoginToken: $e');
      return null;
    }
  }

  @override
  Future<List<LeadFieldsModel>?> getDealerList() async {
    try {
      return await api.getData(
        uri: Uri.parse("${AppConfig.getGeneralListById}118"),
        headers: api.createHeaders(authToken: ''),
        builder: (data) {
          List<dynamic> jsonList = json.decode(data); // Decode JSON as List

          List<LeadFieldsModel> leadFieldsList = jsonList
              .map((json) => LeadFieldsModel.fromJson(json))
              .toList(); // Convert List<dynamic> to List<LeadFieldsModel>

          leadFieldsList.insert(
            0,
            LeadFieldsModel(
                name: "Select Dealer",
                value: "0",
                isActive: false,
                description: ""
            ),
          );

          print("LeadFieldsList: $leadFieldsList");

          return leadFieldsList;
        },
      );
    } catch (e) {
      debugPrint('Error during getLoginToken: $e');
      return null;
    }
  }

  @override
  Future<List<LeadFieldsModel>?> getBusinessSegmentList() async {
    try {
      return await api.getData(
        uri: Uri.parse("${AppConfig.getGeneralListById}119"),
        headers: api.createHeaders(authToken: ''),
        builder: (data) {
          List<dynamic> jsonList = json.decode(data); // Decode JSON as List

          List<LeadFieldsModel> leadFieldsList = jsonList
              .map((json) => LeadFieldsModel.fromJson(json))
              .toList(); // Convert List<dynamic> to List<LeadFieldsModel>

          leadFieldsList.insert(
            0,
            LeadFieldsModel(
                name: "Select Business Segment",
                value: "0",
                isActive: false,
                description: ""
            ),
          );


          print("LeadFieldsList: $leadFieldsList");

          return leadFieldsList;
        },
      );
    } catch (e) {
      debugPrint('Error during getLoginToken: $e');
      return null;
    }
  }

  @override
  Future<List<LeadFieldsModel>?> getVehicleTypeList() async {
    try {
      return await api.getData(
        uri: Uri.parse("${AppConfig.getGeneralListById}115"),
        headers: api.createHeaders(authToken: ''),
        builder: (data) {
          List<dynamic> jsonList = json.decode(data); // Decode JSON as List

          List<LeadFieldsModel> leadFieldsList = jsonList
              .map((json) => LeadFieldsModel.fromJson(json))
              .toList(); // Convert List<dynamic> to List<LeadFieldsModel>

          leadFieldsList.insert(
            0,
            LeadFieldsModel(
                name: "Select Vehicle Type",
                value: "0",
                isActive: false,
                description: ""
            ),
          );

          print("LeadFieldsList: $leadFieldsList");

          return leadFieldsList;
        },
      );
    } catch (e) {
      debugPrint('Error during getLoginToken: $e');
      return null;
    }
  }

  @override
  Future<List<LeadFieldsModel>?> getSalesTypeList() async {
    try {
      return await api.getData(
        uri: Uri.parse("${AppConfig.getGeneralListById}130"),
        headers: api.createHeaders(authToken: ''),
        builder: (data) {
          List<dynamic> jsonList = json.decode(data); // Decode JSON as List

          List<LeadFieldsModel> leadFieldsList = jsonList
              .map((json) => LeadFieldsModel.fromJson(json))
              .toList(); // Convert List<dynamic> to List<LeadFieldsModel>

          leadFieldsList.insert(
            0,
            LeadFieldsModel(
                name: "Select Sales Type",
                value: "0",
                isActive: false,
                description: ""
            ),
          );

          print("LeadFieldsList: $leadFieldsList");

          return leadFieldsList;
        },
      );
    } catch (e) {
      debugPrint('Error during getLoginToken: $e');
      return null;
    }
  }

  @override
  Future<List<LeadFieldsModel>?> getLeadServiceTypeList() async {
    try {
      return await api.getData(
        uri: Uri.parse("${AppConfig.getGeneralListById}120"),
        headers: api.createHeaders(authToken: ''),
        builder: (data) {
          List<dynamic> jsonList = json.decode(data); // Decode JSON as List

          List<LeadFieldsModel> leadFieldsList = jsonList
              .map((json) => LeadFieldsModel.fromJson(json))
              .toList(); // Convert List<dynamic> to List<LeadFieldsModel>

          leadFieldsList.insert(
            0,
            LeadFieldsModel(
                name: "Select Service Type",
                value: "0",
                isActive: false,
                description: ""
            ),
          );

          print("LeadFieldsList: $leadFieldsList");

          return leadFieldsList;
        },
      );
    } catch (e) {
      debugPrint('Error during getLoginToken: $e');
      return null;
    }
  }

  @override
  Future<List<LeadFieldsModel>?> getVehicleFinanceStatusList() async {
    try {
      return await api.getData(
        uri: Uri.parse("${AppConfig.getGeneralListById}121"),
        headers: api.createHeaders(authToken: ''),
        builder: (data) {
          List<dynamic> jsonList = json.decode(data); // Decode JSON as List

          List<LeadFieldsModel> leadFieldsList = jsonList
              .map((json) => LeadFieldsModel.fromJson(json))
              .toList(); // Convert List<dynamic> to List<LeadFieldsModel>

          leadFieldsList.insert(
            0,
            LeadFieldsModel(
                name: "Select Vehicle Finance Status",
                value: "0",
                isActive: false,
                description: ""
            ),
          );

          print("LeadFieldsList: $leadFieldsList");

          return leadFieldsList;
        },
      );
    } catch (e) {
      debugPrint('Error during getLoginToken: $e');
      return null;
    }
  }

  @override
  Future<GetLeadModel?> getLeadList({
    required int pageId,
    required int recordCount,
    required String orderByColumn,
    required String sortDirection,
    required String searchKeyword,
  }) async {
    final body = {
      "moduleId": 1,
      "pageId": pageId,
      "recordCount": recordCount,
      "orderByColumn": orderByColumn,
      "sortDirection": sortDirection,
      "searchKeyword": searchKeyword,
    };
    try {
      return await api.postData(
        uri: Uri.parse(AppConfig.leadListByPagination),
        body: body,
        headers: api.createHeaders(authToken: ''),
        builder: (data) {
          Map<String, dynamic> jsonMap =
              json.decode(data); // Decode JSON as List

          GetLeadModel leadFieldsList = GetLeadModel.fromJson(jsonMap); // Convert List<dynamic> to List<LeadFieldsModel>

          print("LeadFieldsList: $leadFieldsList");

          return leadFieldsList;
        },
      );

      // return await api.getData(
      //   uri: Uri.parse(AppConfig.getLeadList),
      //   headers: api.createHeaders(authToken: ''),
      //   builder: (data) {
      //     List<dynamic> jsonList = json.decode(data); // Decode JSON as List
      //
      //     List<GetLeadModel> leadFieldsList =
      //     jsonList.map((json) => GetLeadModel.fromJson(json)).toList(); // Convert List<dynamic> to List<LeadFieldsModel>
      //
      //     print("LeadFieldsList: $leadFieldsList");
      //
      //     return leadFieldsList;
      //   },
      // );
    } catch (e) {
      debugPrint('Error during getLoginToken: $e');
      return null;
    }
  }

  @override
  Future<void> leadInsert({
    required String firstName,
    required String lastName,
    required String mobileNo,
    required String pinCode,
    required String referralCode,
    required String alternateMobileNo,
    required int genderId,
    required int sourceId,
    required String address,
    required String landmark,
    required int stateId,
    required int cityId,
    required int clusterId,
    required int dealerId,
    required int businessSegmentId,
    required int vehicleTypeId,
    required int salesTypeId,
    required int serviceTypeId,
    required int vehicleFinanceStatusId,
    required bool moveToKycVerification,
    required int userId,
  }) async {
    final body = {
      "FirstName": firstName,
      "LastName": lastName,
      "MobileNo": mobileNo,
      "AlternateMobileNo": alternateMobileNo,
      "GenderId": genderId,
      "SourceId": sourceId,
      "Address": address,
      "Landmark": landmark,
      "StateId": stateId,
      "CityId": cityId,
      "ClusterId": clusterId,
      "DealerId": dealerId,
      "BusinessSegmentId": businessSegmentId,
      "VehicleTypeId": vehicleTypeId,
      "ServiceTypeId": serviceTypeId,
      "VehicleFinanceStatusId": vehicleFinanceStatusId,
      "MoveToKycVerification": moveToKycVerification,
      "UserId": userId,
      "SalesTypeId": salesTypeId,
      "Pincode": pinCode,
      "ReferralCode": referralCode
    };

    try {
      return await api.postData(
        uri: Uri.parse(AppConfig.leadInsert),
        body: body,
        headers: api.createHeaders(
          authToken: '',
        ), // Adjust header logic as needed
        builder: (data) {
          Map<String, dynamic> jsonMap = json.decode(data);

          if (jsonMap["Flag"] != false) {
            commonNavigatorPushAndRemoveUntil(child: BottomNavBarScreen());

            DialogServiceV1().showToast(content: jsonMap['FlagMessage']);
            // Map to `LoginModel`
          } else {
            DialogServiceV1()
                .showToast(hasError: true, content: jsonMap['FlagMessage']);
          }
        },
      );
    } catch (e) {
      debugPrint('Error during designerLogin: $e');
      return null; // Handle errors gracefully
    }
  }

  @override
  Future<void> leadUpdate({
    required int leadId,
    required String firstName,
    required String lastName,
    required String mobileNo,
    required String pinCode,
    required String referralCode,
    required String alternateMobileNo,
    required int sourceId,
    required int genderId,
    required String address,
    required String landmark,
    required int stateId,
    required int cityId,
    required int clusterId,
    required int dealerId,
    required int businessSegmentId,
    required int vehicleTypeId,
    required int salesTypeId,
    required int serviceTypeId,
    required int vehicleFinanceStatusId,
    required bool moveToKycVerification,
    required int userId,
  }) async {
    final body = {
      "LeadId":leadId,
      "FirstName": firstName,
      "LastName": lastName,
      "MobileNo": mobileNo,
      "AlternateMobileNo": alternateMobileNo,
      "GenderId": genderId,
      "SourceId": sourceId,
      "Address": address,
      "Landmark": landmark,
      "StateId": stateId,
      "CityId": cityId,
      "ClusterId": clusterId,
      "DealerId": dealerId,
      "BusinessSegmentId": businessSegmentId,
      "VehicleTypeId": vehicleTypeId,
      "ServiceTypeId": serviceTypeId,
      "VehicleFinanceStatusId": vehicleFinanceStatusId,
      "MoveToKycVerification": moveToKycVerification,
      "UserId": userId,
      "SalesTypeId": salesTypeId,
      "Pincode": pinCode,
      "ReferralCode": referralCode
    };

    try {
      return await api.postData(
        uri: Uri.parse(AppConfig.leadInsert),
        body: body,
        headers: api.createHeaders(
          authToken: '',
        ), // Adjust header logic as needed
        builder: (data) {
          Map<String, dynamic> jsonMap = json.decode(data);

          if (jsonMap["Flag"] != false) {
            commonNavigatorPushAndRemoveUntil(child: BottomNavBarScreen());

            DialogServiceV1().showToast(content: jsonMap['FlagMessage']);
            // Map to `LoginModel`
          } else {
            DialogServiceV1()
                .showToast(hasError: true, content: jsonMap['FlagMessage']);
          }
        },
      );
    } catch (e) {
      debugPrint('Error during designerLogin: $e');
      return null; // Handle errors gracefully
    }
  }

}

// Provider for LoginRepository
final leadRepositoryProvider = Provider<LeadRepository>((ref) {
  return LeadRepositoryV1(ApiClient());
});
