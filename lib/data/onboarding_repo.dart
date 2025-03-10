import 'package:digitifyze/data/api_client.dart';
import 'package:digitifyze/utils/import_utils.dart';

import '../model/response/lead_res_model.dart';

abstract class OnBoardingRepository {

  Future<GetLeadModel?> getOnboardingList({
    required int pageId,
    required int recordCount,
    required String orderByColumn,
    required String sortDirection,
    required String searchKeyword,
  });

}

class OnBoardingRepository1 extends OnBoardingRepository {
  final ApiClient api;
  OnBoardingRepository1(this.api);


  @override
  Future<GetLeadModel?> getOnboardingList(
      {
        required int pageId,
        required int recordCount,
        required String orderByColumn,
        required String sortDirection,
        required String searchKeyword
      }) async {

    final body = {
      "moduleId": 3,
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

          print("OnboardingFieldsList: $leadFieldsList");

          return leadFieldsList;
        },
      );
    } catch (e) {
      debugPrint('Error during get onboarding list: $e');
      return null;
    }

  }

}

// Provider for OnBoardingRepository
final onboardingRepositoryProvider = Provider<OnBoardingRepository>((ref) {
  return OnBoardingRepository1(ApiClient());
});