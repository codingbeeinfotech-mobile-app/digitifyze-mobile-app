import 'package:digitifyze/model/response/lead_field_model.dart';
import 'package:digitifyze/model/response/lead_res_model.dart';
import 'package:digitifyze/services/lead_service.dart';
import 'package:digitifyze/ui/widgets/validate.dart';
import 'package:digitifyze/utils/import_utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_lead_screen_controller.g.dart';

@riverpod
class AddLeadScreenController extends _$AddLeadScreenController {
  String selectLeadSource = "";
  String selectGender = "";
  String selectState = "";
  String selectCity = "";
  String selectCluster = "";
  String selectDealer = "";
  String selectBusinessSegment = "";
  String selectVehicleType = "";
  String selectSalesType = "";
  String selectVehicleFinanceStatus = "";
  String selectServiceType = "";
  String selectMoveToKyc = "";
  String userId = "";

  List<LeadFieldsModel> selectLeadSourceList = [];
  List<LeadFieldsModel> selectGenderList = [];
  List<LeadFieldsModel> selectStateList = [];
  List<LeadFieldsModel> selectCityList = [];
  List<LeadFieldsModel> selectClusterList = [];
  List<LeadFieldsModel> selectDealerList = [];
  List<LeadFieldsModel> selectBusinessSegmentList = [];
  List<LeadFieldsModel> selectVehicleTypeList = [];
  List<LeadFieldsModel> selectSalesTypeList = [];
  List<LeadFieldsModel> selectVehicleFinanceStatusList = [];
  List<GetLeadDatum> _getLeadDataList = [];
  List<GetLeadDatum> get getLeadDataList => _getLeadDataList;

  List<LeadFieldsModel> selectServiceTypeList = [];
  // List<LeadFieldsModel> selectSalesTypeList = [];
  List<LeadFieldsModel> selectMoveToKycList = [];

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController alternateNoController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController landMarkController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController influencerReferralIdController = TextEditingController();

  FocusNode firstNameFocus = FocusNode();
  FocusNode lastNameFocus = FocusNode();
  FocusNode mobileNoFocus = FocusNode();
  FocusNode alternateNoFocus = FocusNode();
  FocusNode addressFocus = FocusNode();
  FocusNode landMarkFocus = FocusNode();
  FocusNode pinCodeFocus = FocusNode();

  bool _isSubmit = false;
  bool get isSubmit => _isSubmit;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isInsertLeadLoading = false;
  bool get isInsertLeadLoading => _isInsertLeadLoading;

  //Pagination value
  int pageId = 1;
  int recordCount = 10;
  int totalCount = 0;
  String sortDirection = "ASC,ASC";
  TextEditingController searchLeadController = TextEditingController();

  int _selectLeadId = 0;
  int get selectedLeadId => _selectLeadId;

  onTapLeadList(int id) {
    _selectLeadId = id;
    debugPrint("Kyc Lead Id === $_selectLeadId");
  }

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

  onSelectLeadSource(String? selectedName) async {
    state = const AsyncLoading();
    LeadFieldsModel? selectedLead = selectLeadSourceList.firstWhere(
      (lead) => lead.name == selectedName,
      orElse: () => LeadFieldsModel(name: "", value: ""),
    );

    selectLeadSource = selectedLead.value ?? ""; // Store the selected ID
    validateLeadSource(selectLeadSource);
    state = const AsyncValue.data(null);
  }

  onChangeInfluencerReferralId() {
    state = const AsyncLoading();
    validateInfluencerReferralId(influencerReferralIdController.text,isInfluencer: selectLeadSource == "3" ?true:false);
    state = const AsyncValue.data(null);
  }

  onChangeFirstName() {
    state = const AsyncLoading();
    validateFirstName(firstNameController.text);
    state = const AsyncValue.data(null);
  }

  onChangeLastName() {
    state = const AsyncLoading();
    validateLastName(lastNameController.text);
    state = const AsyncValue.data(null);
  }

  onChangeMobileNo() {
    state = const AsyncLoading();
    validatePhone(mobileNoController.text);
    if(mobileNoController.text.length==10){
      mobileNoFocus.unfocus();
    }
    state = const AsyncValue.data(null);
  }



  onChangePinCode() {
    state = const AsyncLoading();
    validatePinCode(pinCodeController.text);
    if(pinCodeController.text.length == 6){
      pinCodeFocus.unfocus();
    }
    state = const AsyncValue.data(null);
  }

  onChangeAddress() {
    state = const AsyncLoading();
    validateAddress(addressController.text);
    state = const AsyncValue.data(null);
  }

  onSelectGender(String? selectedName) async {
    state = const AsyncLoading();
    LeadFieldsModel? selectedGender = selectGenderList.firstWhere(
      (lead) => lead.name == selectedName,
      orElse: () => LeadFieldsModel(name: "", value: ""),
    );

    selectGender = selectedGender.value ?? ""; // Store the selected ID
    validateLeadSource(selectGender);
    state = const AsyncValue.data(null);
  }

  onSelectState(String? selectedName) async {
    state = const AsyncLoading();
    LeadFieldsModel? selectedState = selectStateList.firstWhere(
      (lead) => lead.name == selectedName,
      orElse: () => LeadFieldsModel(name: "", value: ""),
    );

    selectState = selectedState.value ?? ""; // Store the selected ID

    validateLeadSource(selectState);
    await getCityList();
    // state = const AsyncLoading();
    state = const AsyncValue.data(null);
  }

  onSelectCity(String? selectedName) async {
    state = const AsyncLoading();
    LeadFieldsModel? selectedCity = selectCityList.firstWhere(
      (lead) => lead.name == selectedName,
      orElse: () => LeadFieldsModel(name: "", value: ""),
    );

    selectCity = selectedCity.value ?? ""; // Store the selected ID
    validateLeadSource(selectCity);
    state = const AsyncValue.data(null);
  }

  onSelectCluster(String? selectedName) async {
    state = const AsyncLoading();
    LeadFieldsModel? selectedCluser = selectClusterList.firstWhere(
      (lead) => lead.name == selectedName,
      orElse: () => LeadFieldsModel(name: "", value: ""),
    );

    selectCluster = selectedCluser.value ?? ""; // Store the selected ID
    validateLeadSource(selectCluster);
    state = const AsyncValue.data(null);
  }

  onSelectDealer(String? selectedName) async {
    state = const AsyncLoading();
    LeadFieldsModel? selectedDealer = selectDealerList.firstWhere(
      (lead) => lead.name == selectedName,
      orElse: () => LeadFieldsModel(name: "", value: ""),
    );

    selectDealer = selectedDealer.value ?? ""; // Store the selected ID
    validateLeadSource(selectDealer);
    state = const AsyncValue.data(null);
  }

  onSelectBusinessSegment(String? selectedName) async {
    state = const AsyncLoading();
    LeadFieldsModel? selectedBusinessSegment =
        selectBusinessSegmentList.firstWhere(
      (lead) => lead.name == selectedName,
      orElse: () => LeadFieldsModel(name: "", value: ""),
    );

    selectBusinessSegment =
        selectedBusinessSegment.value ?? ""; // Store the selected ID
    validateLeadSource(selectBusinessSegment);

    state = const AsyncValue.data(null);
  }

  onSelectVehicleType(String? selectedName) async {
    state = const AsyncLoading();
    LeadFieldsModel? selectedVehicleType = selectVehicleTypeList.firstWhere(
      (lead) => lead.name == selectedName,
      orElse: () => LeadFieldsModel(name: "", value: ""),
    );

    selectVehicleType =
        selectedVehicleType.value ?? ""; // Store the selected ID
    validateLeadSource(selectVehicleType);
    state = const AsyncValue.data(null);
  }

  onSelectSalesType(String? selectedName) async {
    state = const AsyncLoading();
    LeadFieldsModel? selectedVehicleType = selectSalesTypeList.firstWhere(
          (lead) => lead.name == selectedName,
      orElse: () => LeadFieldsModel(name: "", value: ""),
    );

    selectSalesType =
        selectedVehicleType.value ?? ""; // Store the selected ID
    validateLeadSource(selectSalesType);
    state = const AsyncValue.data(null);
  }

  onSelectServiceType(String? selectedName) async {
    state = const AsyncLoading();
    LeadFieldsModel? selectedServiceType = selectServiceTypeList.firstWhere(
      (lead) => lead.name == selectedName,
      orElse: () => LeadFieldsModel(name: "", value: ""),
    );

    selectServiceType =
        selectedServiceType.value ?? ""; // Store the selected ID
    validateLeadSource(selectServiceType);
    state = const AsyncValue.data(null);
  }

//  onSelectSalesType(String? selectedName)async{
//   state = const AsyncLoading();
//   LeadFieldsModel? selectedSalesType =  selectSalesTypeList.firstWhere(
//         (lead) => lead.name == selectedName,
//     orElse: () => LeadFieldsModel(name: "", value: ""),
//   );
//
//    selectSalesType = selectedSalesType.value ?? "";  // Store the selected ID
//   validateDropDown( selectSalesType);
//   state = const AsyncValue.data(null);
// }
  onSelectVehicleFinanceStatus(String? selectedName) async {
    state = const AsyncLoading();
    LeadFieldsModel? selectedVehicleFinanceType =
        selectVehicleFinanceStatusList.firstWhere(
      (lead) => lead.name == selectedName,
      orElse: () => LeadFieldsModel(name: "", value: ""),
    );

    selectVehicleFinanceStatus =
        selectedVehicleFinanceType.value ?? ""; // Store the selected ID
    validateLeadSource(selectVehicleFinanceStatus);

    state = const AsyncValue.data(null);
  }

  onSelectMoveToKyc(String? value) async {
    state = const AsyncLoading();
    selectMoveToKyc = value!;
    validateDropDown(selectMoveToKyc);

    state = const AsyncValue.data(null);
  }

  Future<void> getAllFields() async {
    startLoading();
    await Future.wait([
      getLeadSourceList(),
      getGenderList(),
      getStateList(),
      getClusterList(),
      getDealerList(),
      getBusinessSegmentList(),
      getVehicleTypeList(),
      getSalesTypeList(),
      getLeadServiceTypeList(),
      getVehicleFinanceStatusList(),
    ]);
    stopLoading();
  }

  Future<void> getLeadSourceList() async {
    await _fetchLeadListData(
        () => ref.read(leadServiceProvider).getLeadSourceList(),
        selectLeadSourceList);
    print("selectLeadSourceList $selectLeadSourceList") ;
  }

  Future<void> getGenderList() async {
    await _fetchLeadListData(
        () => ref.read(leadServiceProvider).getGenderList(), selectGenderList);
  }

  Future<void> getStateList() async {
    await _fetchLeadListData(
        () => ref.read(leadServiceProvider).getStateList(), selectStateList);
  }

  Future<void> getCityList() async {
    await _fetchLeadListData(
        () => ref
            .read(leadServiceProvider)
            .getCityList(stateId: int.parse(selectState)),
        selectCityList);
  }

  Future<void> getClusterList() async {
    await _fetchLeadListData(
        () => ref.read(leadServiceProvider).getClusterList(),
        selectClusterList);
  }

  Future<void> getDealerList() async {
    await _fetchLeadListData(
        () => ref.read(leadServiceProvider).getDealerList(), selectDealerList);
  }

  Future<void> getBusinessSegmentList() async {
    await _fetchLeadListData(
        () => ref.read(leadServiceProvider).getBusinessSegmentList(),
        selectBusinessSegmentList);
  }

  Future<void> getVehicleTypeList() async {
    await _fetchLeadListData(
        () => ref.read(leadServiceProvider).getVehicleTypeList(),
        selectVehicleTypeList);
  }

  Future<void> getSalesTypeList() async {
    await _fetchLeadListData(
            () => ref.read(leadServiceProvider).getSalesTypeList(),
        selectSalesTypeList);
  }

  Future<void> getLeadServiceTypeList() async {
    await _fetchLeadListData(
        () => ref.read(leadServiceProvider).getLeadServiceTypeList(),
        selectServiceTypeList);
  }

  Future<void> getVehicleFinanceStatusList() async {
    await _fetchLeadListData(
        () => ref.read(leadServiceProvider).getVehicleFinanceStatusList(),
        selectVehicleFinanceStatusList);
  }

  // Generic method to handle different data types
  Future<void> _fetchLeadData<T>(
    Future<GetLeadModel?> Function()
        fetchFunction, // Expect Future<GetLeadModel?>
    List<T> targetList,
  ) async {
    try {
      final leadModel = await fetchFunction();
      if (leadModel != null && leadModel.data != null) {
        targetList.clear();
        targetList.addAll(leadModel.data! as List<T>); // ✅ Extract 'data' list
      } else {
        debugPrint("Error: leadModel or leadModel.data is null");
      }
    } catch (e, stackTrace) {
      debugPrint("Exception: $e\n$stackTrace");
    }
  }

  // Generic method to handle different data types
  Future<void> _fetchLeadListData<T>(
      Future<List<T>?> Function() fetchFunction, List<T> targetList) async {
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

  clearLeadData(){
    firstNameController.clear();
    lastNameController.clear();
    mobileNoController.clear();
    addressController.clear();
    alternateNoController.clear();
    landMarkController.clear();
     selectLeadSource = "";
    selectGender = "";
     selectState = "";
    selectCity = "";
    selectCluster = "";
    selectDealer = "";
     selectBusinessSegment = "";
    selectVehicleType = "";
     selectVehicleFinanceStatus = "";
     selectServiceType = "";
     selectSalesType = "";
    selectMoveToKyc = "";
  }

  void startLeadDetailLoading() {
    state = const AsyncLoading();
    _isInsertLeadLoading = true;
    state = const AsyncValue.data(null);
  }

  void stopLeadDetailLoading() {
    state = const AsyncLoading();
    _isInsertLeadLoading = false;
    state = const AsyncValue.data(null);
  }

  void onSaveButtonTap() {
    // Check if any required field is empty
    // bool isValid = [
    //   selectLeadSource,
    //   selectGender,
    //   selectState,
    //   selectCity,
    //   selectCluster,
    //   selectDealer,
    //   selectBusinessSegment,
    //   // selectSalesType,
    //   selectVehicleType,
    //   selectSalesType,
    //   selectServiceType,
    //   selectVehicleFinanceStatus,
    //   // selectMoveToKyc,
    //   firstNameController.text.trim(),
    //   lastNameController.text.trim(),
    //   mobileNoController.text.trim(),
    //   pinCodeController.text.trim(),
    //   addressController.text.trim(),
    // ].every((value) => value.isNotEmpty);

    if (selectLeadSource.isEmpty || selectLeadSource == "0") {
      return;
    }

    if (selectGender.isEmpty || selectGender == "0") {
      return;
    }

    if (selectState.isEmpty || selectState == "0") {
      return;
    }

    if (selectCity.isEmpty || selectCity == "0") {
      return;
    }

    if (selectCluster.isEmpty || selectCluster == "0") {
      return;
    }

    if (selectDealer.isEmpty || selectDealer == "0") {
      return;
    }

    if (selectBusinessSegment.isEmpty || selectBusinessSegment == "0") {
      return;
    }

    if (selectVehicleType.isEmpty || selectVehicleType == "0") {
      return;
    }

    if (selectSalesType.isEmpty || selectSalesType == "0") {
      return;
    }

    if (selectServiceType.isEmpty || selectServiceType == "0") {
      return;
    }

    if (selectVehicleFinanceStatus.isEmpty || selectVehicleFinanceStatus == "0") {
      return;
    }

    if(selectLeadSource == "3" || selectLeadSource == "4"){
      if(influencerReferralIdController.text.trim().isEmpty){
        return;
      }
    }

    if(firstNameController.text.trim().isEmpty){
      return;
    }

    if(lastNameController.text.trim().isEmpty){
      return;
    }

    if(mobileNoController.text.trim().isEmpty){
      return;
    }

    if(pinCodeController.text.trim().isEmpty){
      return;
    }

    if(addressController.text.trim().isEmpty){
      return;
    }

    // if (!isValid) {
    //   debugPrint("Validation failed: Some required fields are empty.");
    //   return;
    // }
    leadInsert();

  }

  Future<void> leadInsert() async {
    startLeadDetailLoading();
    try {
      debugPrint("Starting leadInsert...");

      final leadModel = await ref.read(leadServiceProvider).leadInsert(
            firstName: firstNameController.text.trim(),
            lastName: lastNameController.text.trim(),
            mobileNo: mobileNoController.text.trim(),
            alternateMobileNo: alternateNoController.text.trim(),
            sourceId: int.parse(selectLeadSource),
            genderId: int.parse(selectGender),
            address: addressController.text.trim(),
            landmark: landMarkController.text.trim(),
            stateId: int.parse(selectState),
            cityId: int.parse(selectCity),
            clusterId: int.parse(selectCluster),
            dealerId: int.parse(selectDealer),
            businessSegmentId: int.parse(selectBusinessSegment),
            vehicleTypeId: int.parse(selectVehicleType),
            serviceTypeId: int.parse(selectServiceType),
            vehicleFinanceStatusId: int.parse(selectVehicleFinanceStatus),
            moveToKycVerification: selectMoveToKyc == "Yes" ? true : false,
            userId: int.parse(userId),
            referralCode: selectLeadSource == "3" || selectLeadSource == "4" ? influencerReferralIdController.text.trim() : "",
            salesTypeId: int.parse(selectSalesType),
            pinCode: pinCodeController.text.trim(),
          );
    } catch (e, stackTrace) {
      debugPrint("Exception in leadInsert: $e\n$stackTrace");
      stopLeadDetailLoading();
    }
    startLeadDetailLoading();
  }

}

