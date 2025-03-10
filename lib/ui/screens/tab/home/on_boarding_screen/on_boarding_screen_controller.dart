import 'package:digitifyze/data/onboarding_repo.dart';
import 'package:digitifyze/model/response/lead_res_model.dart';
import 'package:digitifyze/ui/widgets/validate.dart';
import 'package:digitifyze/utils/import_utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/material.dart';

part 'on_boarding_screen_controller.g.dart';

@riverpod
class OnBoardingScreenController extends _$OnBoardingScreenController {
  String selectPaymentFrequency = "";
  String selectPaymentMode = "";
  String selectCouponApplied = "";
  String selectCouponCode = "";
  String userId = "";

  List<String> selectPaymentFrequencyList = ['Monthly','Weekly','Daily'];
  List<String> selectPaymentModeList = ['Cash','Cheque','Online','Others'];
  List<String> selectCouponCodeAppliedList = ["Yes",'No'];
  List<String> selectCouponCodeList = ["COUPON 123",'COUPON 001'];

  TextEditingController schemeNameController = TextEditingController();
  TextEditingController downPaymentController = TextEditingController();
  TextEditingController loanAmountController = TextEditingController();
  TextEditingController emiAmountController = TextEditingController();
  TextEditingController tenureController = TextEditingController();

  FocusNode schemeNameFocus = FocusNode();

  bool _isSubmit = false;
  bool get isSubmit => _isSubmit;
  bool _isLoading = false;
  bool get isLoading => _isLoading;


  //Pagination value
  int pageId = 1;
  int recordCount = 10;
  int totalCount = 0;
  String sortDirection = "ASC,ASC";
  TextEditingController searchLeadController = TextEditingController();


  final List<GetLeadDatum> _getOnboardingDataList = <GetLeadDatum>[];
  List<GetLeadDatum> get getOnboardingDataList => _getOnboardingDataList;


  void changeSubmitValue(bool value) {
    state = AsyncLoading();
    _isSubmit = value;
    state = AsyncValue.data(_isSubmit);
  }

  @override
  Future<void> build() async {
    startLoading();
    userId = AppPreferences().getUserId();
    await getAllFields();
    stopLoading();
  }

  void startLoading() {
    state = const AsyncLoading();
    _isLoading = true;
    state = const AsyncValue.data(null);
  }

  void stopLoading() {
    state = const AsyncLoading();
    _isLoading = false;
    state = const AsyncValue.data(null);
  }

 onSelectPaymentFrequency(String? selectedName)async{
  state = const AsyncLoading();
  // LeadFieldsModel? selectedLead =  selectLeadSourceList.firstWhere(
  //       (lead) => lead.name == selectedName,
  //   orElse: () => LeadFieldsModel(name: "", value: ""),
  // );

   selectPaymentFrequency = selectedName ?? "";  // Store the selected ID
  validateDropDown( selectPaymentFrequency);
  state = const AsyncValue.data(null);
}

  onSelectPaymentMode(String? selectedName)async{
    state = const AsyncLoading();
    // LeadFieldsModel? selectedLead =  selectLeadSourceList.firstWhere(
    //       (lead) => lead.name == selectedName,
    //   orElse: () => LeadFieldsModel(name: "", value: ""),
    // );

    selectPaymentMode = selectedName ?? "";  // Store the selected ID
    validateDropDown( selectPaymentMode);
    state = const AsyncValue.data(null);
  }

  onSelectCouponApplied(String? selectedName)async{
    state = const AsyncLoading();
    // LeadFieldsModel? selectedLead =  selectLeadSourceList.firstWhere(
    //       (lead) => lead.name == selectedName,
    //   orElse: () => LeadFieldsModel(name: "", value: ""),
    // );

    selectCouponApplied = selectedName ?? "";  // Store the selected ID
    validateDropDown( selectCouponApplied);
    state = const AsyncValue.data(null);
  }

  onSelectCouponCode(String? selectedName)async{
    state = const AsyncLoading();
    // LeadFieldsModel? selectedLead =  selectLeadSourceList.firstWhere(
    //       (lead) => lead.name == selectedName,
    //   orElse: () => LeadFieldsModel(name: "", value: ""),
    // );

    selectCouponCode = selectedName ?? "";  // Store the selected ID
    validateDropDown(selectCouponCode);
    state = const AsyncValue.data(null);
  }

 
  Future<void> getAllFields() async {
    startLoading();
    await Future.wait([
      getCouponCodeList(),
      getOnBoardingList(),
    ]);
    stopLoading();
  }


  Future<void> getOnBoardingList() async {

    state = const AsyncLoading();

    GetLeadModel? getLeadModel = await ref.read(onboardingRepositoryProvider).getOnboardingList(
      pageId: pageId,
      recordCount: recordCount,
      orderByColumn: "Clead.EntryDate,Clead.UpdateDate",
      sortDirection: sortDirection,
      searchKeyword: searchLeadController.text,
    );
    if(getLeadModel != null){
      if(getLeadModel.totalCount != null){
        totalCount = getLeadModel.totalCount!;
      }
      if(getLeadModel.data != null){
        _getOnboardingDataList.clear();
        _getOnboardingDataList.addAll(getLeadModel.data ?? []);
        // if(getLeadModel.data!.length < recordCount){
        //   pageId = pageId - 1;
        // }
      }else{
        pageId = pageId - 1;
      }
    }else{
      pageId = pageId - 1;
    }
    debugPrint("Current Page => $pageId");

    state = const AsyncValue.data(null);
  }


  Future<void> getCouponCodeList() async {
    // await _fetchLeadData(
    //     () => ref.read(leadServiceProvider).getGenderList(), selectGenderList);
  }


  // Generic method to handle different data types
  Future<void> _fetchLeadData<T>(Future<List<T>?> Function() fetchFunction, List<T> targetList) async {
    try {
      final leadModel = await fetchFunction();
      if (leadModel != null) {
        targetList.clear();
        targetList.addAll(leadModel);
      } else {
        debugPrint("Error: leadModel is null");
      }
    } catch (e, stackTrace) {
      debugPrint("Exception: $e\n$stackTrace");
    }
  }

  void onSaveButtonTap() {
    // Check if any required field is empty
    bool isValid = [
      selectPaymentFrequency,
      selectPaymentMode,
      selectCouponApplied,
      selectCouponCode,
      schemeNameController.text.trim(),
      downPaymentController.text.trim(),
      emiAmountController.text.trim(),
      tenureController.text.trim(),
    ].every((value) => value.isNotEmpty);

    if (!isValid) {
      debugPrint("Validation failed: Some required fields are empty.");
      return;
    }
  }
}
