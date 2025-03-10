import 'dart:io';

import 'package:digitifyze/model/request/insert_lead_kyc_request.dart';
import 'package:digitifyze/model/response/kyc_detail_model.dart';
import 'package:digitifyze/model/response/lead_field_model.dart';
import 'package:digitifyze/model/response/lead_res_model.dart';
import 'package:digitifyze/ui/screens/bottom_nav_bar/bottom_nav_bar_screen.dart';
import 'package:digitifyze/utils/import_utils.dart';

import 'api_client.dart';

abstract class KycRepository {
  Future<GetLeadModel?> getKycList({
    required int pageId,
    required int recordCount,
    required String orderByColumn,
    required String sortDirection,
    required String searchKeyword,
  });

  Future<List<LeadFieldsModel>?> getMaritalStatusList();

  Future<List<LeadFieldsModel>?> getVehicleOwnershipList();

  Future<List<LeadFieldsModel>?> getHouseOwnershipList();

  Future<List<LeadFieldsModel>?> getBankList();

  Future<List<LeadFieldsModel>?> getVehicleMakeList();

  Future<void> insertLeadKyc({
    required KycLeadRequest kycLeadRequest,
    required List<File> imagePath,
    required List<String> imageParam,
  });

  Future<dynamic> getLeadKYCDetails({required int leadId});
}

class KycRepositoryV1 extends KycRepository {
  final ApiClient api;
  KycRepositoryV1(this.api);

  @override
  Future<void> insertLeadKyc({
    required KycLeadRequest kycLeadRequest,
    required List<File> imagePath,
    required List<String> imageParam,
  }) async {
    final body = kycLeadRequest
        .toJson()
        .map((key, value) => MapEntry(key, value.toString()));

    try {
      await api.multiImagemultiParamPartData(
          uri: Uri.parse(AppConfig.kycInsert),
          headers: api.createHeaders(authToken: ''),
          body: {"leadKYC": jsonEncode(body)},
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
          imageparam: imageParam,
          imagepath: imagePath);
    } catch (e) {
      debugPrint("Get Kyc Exception => $e");
    }
  }

  @override
  Future<dynamic> getLeadKYCDetails({required int leadId}) async {
    try {
      return await api.postData(
          uri: Uri.parse("${AppConfig.leadKYCDetailsById}$leadId"),
          body: {},
          headers: api.createHeaders(authToken: ''),
          builder: (data) {
            Map<String, dynamic> jsonMap = json.decode(data);
            KycDetailModel kycLeadModel = KycDetailModel.fromJson(jsonMap);
            return kycLeadModel;
          });
    } catch (e) {
      debugPrint("Get Kyc Exception => $e");
      return KycDetailModel();
    }
  }

  @override
  Future<GetLeadModel?> getKycList({
    required int pageId,
    required int recordCount,
    required String orderByColumn,
    required String sortDirection,
    required String searchKeyword,
  }) async {
    final body = {
      "moduleId": 2,
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

          GetLeadModel kycFieldsList = GetLeadModel.fromJson(jsonMap);

          print("KycFieldsList: $kycFieldsList");

          return kycFieldsList;
        },
      );
    } catch (e) {
      debugPrint("Get Kyc Exception => $e");
      return null;
    }
  }

  @override
  Future<List<LeadFieldsModel>?> getMaritalStatusList() async {
    try {
      return await api.getData(
        uri: Uri.parse("${AppConfig.getGeneralListById}125"),
        headers: api.createHeaders(authToken: ''),
        builder: (data) {
          List<dynamic> jsonList = json.decode(data); // Decode JSON as List

          List<LeadFieldsModel> leadFieldsList = jsonList
              .map((json) => LeadFieldsModel.fromJson(json))
              .toList(); // Convert List<dynamic> to List<LeadFieldsModel>

          leadFieldsList.insert(
            0,
            LeadFieldsModel(
                name: "Select Marital Status",
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
  Future<List<LeadFieldsModel>?> getVehicleOwnershipList() async {
    try {
      return await api.getData(
        uri: Uri.parse("${AppConfig.getGeneralListById}127"),
        headers: api.createHeaders(authToken: ''),
        builder: (data) {
          List<dynamic> jsonList = json.decode(data); // Decode JSON as List

          List<LeadFieldsModel> leadFieldsList = jsonList
              .map((json) => LeadFieldsModel.fromJson(json))
              .toList(); // Convert List<dynamic> to List<LeadFieldsModel>

          leadFieldsList.insert(
            0,
            LeadFieldsModel(
                name: "Select Vehicle Ownership",
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
  Future<List<LeadFieldsModel>?> getHouseOwnershipList() async {
    try {
      return await api.getData(
        uri: Uri.parse("${AppConfig.getGeneralListById}128"),
        headers: api.createHeaders(authToken: ''),
        builder: (data) {
          List<dynamic> jsonList = json.decode(data); // Decode JSON as List

          List<LeadFieldsModel> leadFieldsList = jsonList
              .map((json) => LeadFieldsModel.fromJson(json))
              .toList(); // Convert List<dynamic> to List<LeadFieldsModel>

          leadFieldsList.insert(
            0,
            LeadFieldsModel(
                name: "Select House Ownership",
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
  Future<List<LeadFieldsModel>?> getBankList() async {
    try {
      return await api.getData(
        uri: Uri.parse("${AppConfig.getGeneralListById}124"),
        headers: api.createHeaders(authToken: ''),
        builder: (data) {
          List<dynamic> jsonList = json.decode(data); // Decode JSON as List

          List<LeadFieldsModel> leadFieldsList = jsonList
              .map((json) => LeadFieldsModel.fromJson(json))
              .toList(); // Convert List<dynamic> to List<LeadFieldsModel>

          leadFieldsList.insert(
            0,
            LeadFieldsModel(
                name: "Select Bank",
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
  Future<List<LeadFieldsModel>?> getVehicleMakeList() async {
    try {
      return await api.getData(
        uri: Uri.parse("${AppConfig.getGeneralListById}129"),
        headers: api.createHeaders(authToken: ''),
        builder: (data) {
          List<dynamic> jsonList = json.decode(data); // Decode JSON as List

          List<LeadFieldsModel> leadFieldsList = jsonList
              .map((json) => LeadFieldsModel.fromJson(json))
              .toList(); // Convert List<dynamic> to List<LeadFieldsModel>

          leadFieldsList.insert(
            0,
            LeadFieldsModel(
                name: "Select Vehicle Make",
                value: "0",
                isActive: false,
                description: ""
            ),
          );

          print("Vehicle Make List : $leadFieldsList");

          return leadFieldsList;
        },
      );
    } catch (e) {
      debugPrint('Error during getLoginToken: $e');
      return null;
    }
  }
}

// Provider for LoginRepository
final kycRepositoryProvider = Provider<KycRepository>((ref) {
  return KycRepositoryV1(ApiClient());
});
