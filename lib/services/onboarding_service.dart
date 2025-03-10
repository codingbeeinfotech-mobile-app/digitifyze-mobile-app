import 'package:digitifyze/data/onboarding_repo.dart';
import 'package:digitifyze/model/response/lead_res_model.dart';

import '../utils/import_utils.dart';

abstract class OnboardingService {

  Future<GetLeadModel?> getOnboardingList({
    required int pageId,
    required int recordCount,
    required String orderByColumn,
    required String sortDirection,
    required String searchKeyword,
  });

}

class OnboardingService1 extends OnboardingService {

  OnboardingService1(
      this.onBoardingRepository,
      );

  final OnBoardingRepository onBoardingRepository;


  @override
  Future<GetLeadModel?> getOnboardingList(
      {
        required int pageId,
        required int recordCount,
        required String orderByColumn,
        required String sortDirection,
        required String searchKeyword
      }) async {
       return await onBoardingRepository.getOnboardingList(
            pageId: pageId,
            recordCount: recordCount,
            orderByColumn: orderByColumn,
            sortDirection: sortDirection,
            searchKeyword: searchKeyword
        );
  }


}

final leadServiceProvider = Provider.autoDispose<OnboardingService>((ref) {
  final service = OnboardingService1(
    ref.watch(onboardingRepositoryProvider),
  );
  return service;
});