import 'dart:developer';
import 'dart:io';

import 'package:digitifyze/model/request/insert_lead_kyc_request.dart';
import 'package:digitifyze/model/response/kyc_detail_model.dart';
import 'package:digitifyze/model/response/lead_field_model.dart';
import 'package:digitifyze/services/kyc_service.dart';
import 'package:digitifyze/ui/widgets/validate.dart';
import 'package:digitifyze/utils/enums.dart';
import 'package:digitifyze/utils/import_utils.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:path/path.dart' as path;

part 'add_kyc_verification_screen_controller.g.dart';

@riverpod
class AddKycVerificationScreenController
    extends _$AddKycVerificationScreenController {
  late final PageController pageController;
  bool _isSameAddress = false;
  bool _isSubmitOnGenInfo = false;
  bool _isSubmitOnVehicleInfo = false;
  bool _isSubmitOnBankInfo = false;
  bool isValidateGeneralInfo = false;
  bool isValidateVehicleInfo = false;
  bool isValidateBankInfo = false;

  bool get isSameAddress => _isSameAddress;
  bool get isSubmitOnGenInfo => _isSubmitOnGenInfo;
  bool get isSubmitOnVehicleInfo => _isSubmitOnVehicleInfo;
  bool get isSubmitOnBankInfo => _isSubmitOnBankInfo;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isInsertKycLoading = false;
  bool get isInsertKycLoading => _isInsertKycLoading;

  String smartPhoneUser = "";
  String selectedSmartPhoneUsersId = "";
  String selectedMaritalStatus = "";
  String selectedMaritalStatusId = "";
  String selectedVehicleOwnership = "";
  String selectedVehicleOwnershipId = "";
  String selectedVehicleMake = "";
  String selectedVehicleMakeId = "";
  String selectedHouseOwnership = "";
  String selectedHouseOwnershipId = "";
  String selectedBank = "";
  String selectedBankId = "";

  File? frontAadharPicFile;
  File? backAadharPicFile;
  File? panCardPicFile;
  File? userPicFile;
  File? dlPicFile;
  File? nocPicFile;
  File? rcPicFile;
  File? bankChequePicFile;
  File? billPicFile;

  String frontAadharUrl = "";
  String backAadharUrl = "";
  String panCardUrl = "";
  String userUrl = "";
  String dlUrl = "";
  String nocUrl = "";
  String rcUrl = "";
  String bankChequeUrl = "";
  String billUrl = "";

  TextEditingController aadharNoController = TextEditingController();
  TextEditingController panNoController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController dobApiController = TextEditingController();
  TextEditingController currentAddressController = TextEditingController();
  TextEditingController permanentAddressController = TextEditingController();
  TextEditingController nocController = TextEditingController();
  TextEditingController loanNoController = TextEditingController();
  TextEditingController dlNoController = TextEditingController();
  TextEditingController rcNoController = TextEditingController();
  TextEditingController registrationDateController = TextEditingController();
  TextEditingController registrationApiDateController = TextEditingController();
  TextEditingController vehicleAgeController = TextEditingController();
  TextEditingController vehicleDateController = TextEditingController();
  TextEditingController latitudeNoController = TextEditingController();
  TextEditingController longitudeNoController = TextEditingController();
  TextEditingController accountNoController = TextEditingController();
  TextEditingController ifscCodeController = TextEditingController();
  TextEditingController firstReferenceNameController = TextEditingController();
  TextEditingController firstReferenceMobileNoController =
      TextEditingController();
  TextEditingController secondReferenceNameController = TextEditingController();
  TextEditingController secondReferenceMobileNoController =
      TextEditingController();
  TextEditingController cibilScoreController = TextEditingController();

  FocusNode aadharNoFocusNode = FocusNode();
  FocusNode panNoFocusNode = FocusNode();
  FocusNode dobFocusNode = FocusNode();
  FocusNode nocFocusNode = FocusNode();
  FocusNode currentAddressFocusNode = FocusNode();
  FocusNode permanentAddressFocusNode = FocusNode();
  FocusNode dlNoFocusNode = FocusNode();
  FocusNode loanNoFocusNode = FocusNode();
  FocusNode rcNoFocusNode = FocusNode();
  FocusNode latitudeNoFocusNode = FocusNode();
  FocusNode longitudeNoFocusNode = FocusNode();
  FocusNode accountNoFocusNode = FocusNode();
  FocusNode ifscCodeFocusNode = FocusNode();
  FocusNode firstReferenceNameFocusNode = FocusNode();
  FocusNode secondReferenceNameFocusNode = FocusNode();
  FocusNode firstReferenceMobileNoFocusNode = FocusNode();
  FocusNode secondReferenceMobileNoFocusNode = FocusNode();
  FocusNode cibilFocusNode = FocusNode();

  List<Map<String, dynamic>> selfieList = [];

  //Pagination value
  int pageId = 1;
  String sortDirection = "ASC,ASC";
  TextEditingController searchLeadController = TextEditingController();

  int _selectLeadId = 0;
  int get selectedLeadId => _selectLeadId;
  onTapKycLeadList(int id) {
    _selectLeadId = id;
    debugPrint("Kyc Lead Id === $_selectLeadId");
  }

  final List<LeadFieldsModel> _smartPhoneUserList = <LeadFieldsModel>[
    LeadFieldsModel(
        name: "Select Smart Phone User",
        description: "",
        isActive: false,
        value: "0"),
    LeadFieldsModel(name: "Yes", description: "", isActive: false, value: "1"),
    LeadFieldsModel(name: "No", description: "", isActive: false, value: "2"),
  ];

  List<LeadFieldsModel> get smartPhoneUserList => _smartPhoneUserList;

  final List<LeadFieldsModel> _maritalStatusList = <LeadFieldsModel>[];
  List<LeadFieldsModel> get maritalStatusList => _maritalStatusList;

  final List<LeadFieldsModel> _vehicleOwnershipList = <LeadFieldsModel>[];
  List<LeadFieldsModel> get vehicleOwnershipList => _vehicleOwnershipList;

  final List<LeadFieldsModel> _houseOwnershipList = <LeadFieldsModel>[];
  List<LeadFieldsModel> get houseOwnershipList => _houseOwnershipList;

  final List<LeadFieldsModel> _bankList = <LeadFieldsModel>[];
  List<LeadFieldsModel> get bankList => _bankList;

  final List<LeadFieldsModel> _vehicleMakeList = <LeadFieldsModel>[];
  List<LeadFieldsModel> get vehicleMakeList => _vehicleMakeList;

  KycDetailModel _globalKycDetailModel = KycDetailModel();
  KycDetailModel get globalKycDetailModel => _globalKycDetailModel;

  @override
  FutureOr<void> build({required int existLeadId}) async {
    startLoading();
    _selectLeadId = existLeadId;
    pageController = PageController();
    await getAllFields();
    stopLoading();
  }

  changeSubmitValue(value, section) {
    state = AsyncLoading();
    if (section == 1) {
      _isSubmitOnGenInfo = value;
    } else if (section == 2) {
      _isSubmitOnVehicleInfo = value;
    } else {
      _isSubmitOnBankInfo = value;
    }
    state = AsyncValue.data(value);
  }

  checkValidateGeneralInfo() {
    isValidateGeneralInfo = false;
    if (globalKycDetailModel.isAadharNoMandatory! &&
        validateAadhaar(aadharNoController.text.trim()) != null) {
      return;
    }

    if (globalKycDetailModel.isPancardNoMandatory! &&
        validatePanNo(panNoController.text.trim()) != null) {
      return;
    }
    if (globalKycDetailModel.isCurrentAddressMandatory! &&
        validateAddress(currentAddressController.text) != null) {
      return;
    }
    if (globalKycDetailModel.isPermanentMandatory! &&
        validateAddress(permanentAddressController.text) != null) {
      return;
    }
    if (globalKycDetailModel.isPancardNoMandatory! &&
        panNoController.text.isEmpty) {
      return;
    }
    if (globalKycDetailModel.isSmartphoneUserMandatory!) {
      if (selectedSmartPhoneUsersId.isEmpty ||
          selectedSmartPhoneUsersId == "0") {
        return;
      }
    }
    if (globalKycDetailModel.isMaritalStatusMandatory!) {
      if (selectedMaritalStatusId.isEmpty || selectedMaritalStatusId == "0") {
        return;
      }
    }

    if (globalKycDetailModel.isDriverPicMandatory! &&
        userUrl == "" &&
        userPicFile == null) {
      return;
    }

    if (globalKycDetailModel.isAadharPicMandatory! &&
        frontAadharUrl == "" &&
        frontAadharPicFile == null) {
      return;
    }
    if (globalKycDetailModel.isAadharPicMandatory! &&
        backAadharUrl == "" &&
        backAadharPicFile == null) {
      return;
    }
    if (globalKycDetailModel.isPancardPicMandatory! &&
        panCardUrl == "" &&
        panCardPicFile == null) {
      return;
    }

    isValidateGeneralInfo = true;
  }

  checkValidateVehicleInfo() {
    isValidateVehicleInfo = false;
    // if(validateDropDown(nocController.text) != null){
    //   return;
    // }
    // if(validateDropDown(loanNoController.text) != null){
    //   return;
    // }
    if (globalKycDetailModel.isDlNoMandatory! &&
        validateDlNo(dlNoController.text) != null) {
      return;
    }
    if (globalKycDetailModel.isRcNoMandatory! &&
        validateRcNo(rcNoController.text) != null) {
      return;
    }
    if (globalKycDetailModel.isRegistrationDateMandatory! &&
        validateDropDown(registrationDateController.text) != null) {
      return;
    }
    if (globalKycDetailModel.isVehicleAgeMandatory! &&
        validateDropDown(vehicleAgeController.text) != null) {
      return;
    }
    if (globalKycDetailModel.isLatitudeMandatory! &&
        validateDropDown(latitudeNoController.text) != null) {
      return;
    }
    if (globalKycDetailModel.isLongitudeMandatory! &&
        validateDropDown(longitudeNoController.text) != null) {
      return;
    }
    if (globalKycDetailModel.isHouseOwnershipMandatory!) {
      if (selectedVehicleOwnershipId.isEmpty ||
          selectedVehicleOwnershipId == "0") {
        return;
      }
    }

    if (globalKycDetailModel.isVehicleMakeMandatory!) {
      if (selectedVehicleMakeId.isEmpty || selectedVehicleMakeId == "0") {
        return;
      }
    }

    if (globalKycDetailModel.isDlPicMandatory! &&
        dlUrl == "" &&
        dlPicFile == null) {
      return;
    }
    if (globalKycDetailModel.isRcPicMandatory! &&
        rcUrl == "" &&
        rcPicFile == null) {
      return;
    }
    if (globalKycDetailModel.isNocDocumentationMandatory! &&
        nocUrl == "" &&
        nocPicFile == null) {
      return;
    }

    isValidateVehicleInfo = true;
  }

  checkValidateBankInfo() {
    isValidateBankInfo = false;
    if (globalKycDetailModel.isAccountNoMandatory! &&
        validateDropDown(accountNoController.text) != null) {
      return;
    }
    if (globalKycDetailModel.isIfscCodeMandatory! &&
        validateIFSCCode(ifscCodeController.text) != null) {
      return;
    }
    if (globalKycDetailModel.isDlNoMandatory! &&
        validateDropDown(dlNoController.text) != null) {
      return;
    }
    if (globalKycDetailModel.isReference1NameMandatory! &&
        validateDropDown(firstReferenceNameController.text) != null) {
      return;
    }
    if (globalKycDetailModel.isReference1MobileMandatory! &&
        validatePhone(firstReferenceMobileNoController.text.trim()) != null) {
      return;
    }
    if (globalKycDetailModel.isReference2NameMandatory! &&
        validateDropDown(secondReferenceNameController.text) != null) {
      return;
    }
    if (globalKycDetailModel.isReference2MobileMandatory! &&
        validatePhone(secondReferenceMobileNoController.text.trim()) != null) {
      return;
    }
    if (globalKycDetailModel.isCibilScoreMandatory! &&
        validateDropDown(cibilScoreController.text) != null) {
      return;
    }
    if (globalKycDetailModel.isBankNameMandatory!) {
      if (selectedBankId.isEmpty || selectedBankId == "0") {
        return;
      }
    }

    if (globalKycDetailModel.isHouseOwnershipMandatory!) {
      if (selectedHouseOwnershipId.isEmpty || selectedHouseOwnershipId == "0") {
        return;
      }
    }

    if (globalKycDetailModel.isBankChequePicMandatory! &&
        bankChequeUrl == "" &&
        bankChequePicFile == null) {
      return;
    }
    if (globalKycDetailModel.isElectricityBillMandatory! &&
        billUrl == "" &&
        billPicFile == null) {
      return;
    }
    if (globalKycDetailModel.isSelfieWithDriverPicMandatory! &&
        selfieList.isEmpty) {
      return;
    }

    isValidateBankInfo = true;
  }

  Future<void> getLeadKYCDetails() async {
    // startKycDetailLoading();
    state = const AsyncLoading();
    KycDetailModel? kycDetailModel = await ref
        .read(kycServiceProvider)
        .getLeadKYCDetails(leadId: selectedLeadId);
    if (kycDetailModel != null && kycDetailModel.leadId != null) {
      _globalKycDetailModel = kycDetailModel;
      // debugPrint("kycDetailModel: $kycDetailModel");
      // debugPrint("isDriverPicMan: ${_globalKycDetailModel.isDriverPicMandatory}");
      // debugPrint("isSmartphoneUs: ${_globalKycDetailModel.isSmartphoneUserMandatory}");
      // debugPrint("isMaritalStatu: ${_globalKycDetailModel.isMaritalStatusMandatory}");
      // debugPrint("isAadharNoMand: ${_globalKycDetailModel.isAadharNoMandatory}");
      // debugPrint("isAadharPicMan: ${_globalKycDetailModel.isAadharPicMandatory}");
      // debugPrint("isDateOfBirthM: ${_globalKycDetailModel.isDateOfBirthMandatory}");
      // debugPrint("isCurrentAddre: ${_globalKycDetailModel.isCurrentAddressMandatory}");
      // debugPrint("isPermanentMan: ${_globalKycDetailModel.isPermanentMandatory}");
      // debugPrint("isPancardPicMa: ${_globalKycDetailModel.isPancardPicMandatory}");
      // debugPrint("isPancardNoMan: ${_globalKycDetailModel.isPancardNoMandatory}");
      // debugPrint("isVehicleOwner: ${_globalKycDetailModel.isVehicleOwnershipMandatory}");
      // debugPrint("isNocDocumenta: ${_globalKycDetailModel.isNocDocumentationMandatory}");
      // debugPrint("isLoanNoMandat: ${_globalKycDetailModel.isLoanNoMandatory}");
      // debugPrint("isDlPicMandato: ${_globalKycDetailModel.isDlPicMandatory}");
      // debugPrint("isDlNoMandator: ${_globalKycDetailModel.isDlNoMandatory}");
      // debugPrint("isRcPicMandato: ${_globalKycDetailModel.isRcPicMandatory}");
      // debugPrint("isRcNoMandator: ${_globalKycDetailModel.isRcNoMandatory}");
      // debugPrint("isRegistration: ${_globalKycDetailModel.isRegistrationDateMandatory}");
      // debugPrint("isVehicleAgeMa: ${_globalKycDetailModel.isVehicleAgeMandatory}");
      // debugPrint("isVehicleMakeM: ${_globalKycDetailModel.isVehicleMakeMandatory}");
      // debugPrint("isLatitudeMand: ${_globalKycDetailModel.isLatitudeMandatory}");
      // debugPrint("isLongitudeMan: ${_globalKycDetailModel.isLongitudeMandatory}");
      // debugPrint("isBankNameMand: ${_globalKycDetailModel.isBankNameMandatory}");
      // debugPrint("isBankChequePi: ${_globalKycDetailModel.isBankChequePicMandatory}");
      // debugPrint("isSelfieWithDr: ${_globalKycDetailModel.isSelfieWithDriverPicMandatory}");
      // debugPrint("isReference1Mo: ${_globalKycDetailModel.isReference1MobileMandatory}");
      // debugPrint("isReference1Na: ${_globalKycDetailModel.isReference1NameMandatory}");
      // debugPrint("isReference2Mo: ${_globalKycDetailModel.isReference2MobileMandatory}");
      // debugPrint("isReference2Na: ${_globalKycDetailModel.isReference2NameMandatory}");
      // debugPrint("isHouseOwnersh: ${_globalKycDetailModel.isHouseOwnershipMandatory}");
      // debugPrint("isElectricityB: ${_globalKycDetailModel.isElectricityBillMandatory}");
      // debugPrint("isCibilScoreMa: ${_globalKycDetailModel.isCibilScoreMandatory}");
      // smartPhoneUser = kycDetailModel.isSmartPhoneUser == true ? "Yes" : "No";
      // selectedSmartPhoneUsersId = kycDetailModel.isSmartPhoneUser == true ? "1" : "2";
      //
      // selectedMaritalStatusId = kycDetailModel.maritialStatus.toString();
      // selectedMaritalStatus = kycDetailModel.maritialStatusDetail ?? '';
      //
      // selectedBankId = kycDetailModel.bankId.toString();
      // selectedBank = kycDetailModel.bank ?? '';
      //
      // selectedVehicleOwnershipId = kycDetailModel.vehicleOwnershipId.toString();
      // selectedVehicleOwnership = kycDetailModel.vehicleOwnership ?? '';
      //
      // selectedVehicleMakeId = kycDetailModel.vehicleMakeId.toString();
      // selectedVehicleMake = kycDetailModel.vehicleMake ?? '';
      //
      // selectedHouseOwnershipId = kycDetailModel.houseOwnershipId.toString();
      // selectedHouseOwnership = kycDetailModel.houseOwnership ?? '';
      //
      // accountNoController.text = kycDetailModel.aadharNo ?? '';
      // ifscCodeController.text = kycDetailModel.ifscCode ?? '';
      // firstReferenceMobileNoController.text = kycDetailModel.ref1MobileNo ?? '';
      // secondReferenceMobileNoController.text =
      //     kycDetailModel.ref2MobileNo ?? '';
      // firstReferenceNameController.text = kycDetailModel.ref1Name ?? '';
      // secondReferenceNameController.text = kycDetailModel.ref2Name ?? '';
      // cibilScoreController.text = kycDetailModel.cibilScore.toString();
      //
      // aadharNoController.text = kycDetailModel.aadharNo ?? '';
      // print("digitsOnly ${aadharNoController.text} ${kycDetailModel.aadharNo}");
      // String digitsOnly = aadharNoController.text.replaceAll(RegExp(r'\D'), '');
      // print("digitsOnly $digitsOnly");
      // String formattedText = '';
      //
      // for (int i = 0; i < digitsOnly.length; i++) {
      //   if (i > 0 && i % 4 == 0) {
      //     formattedText += ' ';
      //   }
      //   formattedText += digitsOnly[i];
      // }
      // print("formattedText ${formattedText}");
      // aadharNoController.text = formattedText;
      // dobController.text = DateFormat("dd/MM/yyyy").format(kycDetailModel.dob!);
      // dobApiController.text = kycDetailModel.dob.toString();
      // currentAddressController.text = kycDetailModel.currentAddress ?? '';
      // permanentAddressController.text = kycDetailModel.permanentAddress ?? '';
      // _isSameAddress = currentAddressController.text == permanentAddressController.text;
      // panNoController.text = kycDetailModel.panNo ?? '';
      // loanNoController.text = kycDetailModel.loanNo.toString();
      // dlNoController.text = kycDetailModel.dlNo ?? '';
      // rcNoController.text = kycDetailModel.rcNo ?? '';
      // registrationDateController.text = DateFormat("dd/MM/yyyy").format(kycDetailModel.rcDate!);
      // registrationApiDateController.text = kycDetailModel.rcDate.toString();
      // vehicleDateController.text = kycDetailModel.vehicleDate.toString();
      // vehicleAgeController.text = kycDetailModel.vehicleAge.toString();
      // vehicleAgeController.text = kycDetailModel.vehicleAge.toString();
      // latitudeNoController.text = kycDetailModel.latitude.toString();
      // longitudeNoController.text = kycDetailModel.longitude.toString();
      //
      // userUrl = kycDetailModel.userPic ?? '';
      // frontAadharUrl = kycDetailModel.aadharFrontPic ?? '';
      // backAadharUrl = kycDetailModel.aadharBackPic ?? '';
      // panCardUrl = kycDetailModel.panCardPic ?? '';
      // nocUrl = kycDetailModel.nocDocument ?? '';
      // dlUrl = kycDetailModel.dlPic ?? '';
      // rcUrl = kycDetailModel.rcPic ?? '';
      // bankChequeUrl = kycDetailModel.blanckCheckPic ?? '';
      // billUrl = kycDetailModel.ownershipPic ?? '';
      // selfieList.clear();
      // if (kycDetailModel.selfieWithDriver != "") {
      //   selfieList.add({"url": kycDetailModel.selfieWithDriver});
      // }
      //
      // if (kycDetailModel.driverPic1 != "") {
      //   selfieList.add({"url": kycDetailModel.driverPic1});
      // }
      //
      // if (kycDetailModel.driverPic2 != "") {
      //   selfieList.add({"url": kycDetailModel.driverPic2});
      // }
      //
      // if (kycDetailModel.driverPic3 != "") {
      //   selfieList.add({"url": kycDetailModel.driverPic3});
      // }
      //
      // if (kycDetailModel.driverPic4 != "") {
      //   selfieList.add({"url": kycDetailModel.driverPic4});
      // }
      //
      // if (kycDetailModel.driverPic5 != "") {
      //   selfieList.add({"url": kycDetailModel.driverPic5});
      // }

      checkValidateGeneralInfo();
      checkValidateVehicleInfo();
      checkValidateBankInfo();

      // stopKycDetailLoading();
    } else {
      smartPhoneUser = "";
      selectedMaritalStatusId = "0";
      selectedBankId = "0";

      accountNoController.clear();
      ifscCodeController.clear();
      firstReferenceMobileNoController.clear();
      secondReferenceMobileNoController.clear();
      firstReferenceNameController.clear();
      secondReferenceNameController.clear();
      cibilScoreController.clear();

      aadharNoController.clear();
      currentAddressController.clear();
      permanentAddressController.clear();
      panNoController.clear();
      loanNoController.clear();
      dlNoController.clear();
      rcNoController.clear();
      registrationDateController.clear();
      registrationApiDateController.clear();
      vehicleDateController.clear();
      vehicleAgeController.clear();
      vehicleAgeController.clear();
      latitudeNoController.clear();
      longitudeNoController.clear();

      userUrl = '';
      frontAadharUrl = '';
      backAadharUrl = '';
      panCardUrl = '';
      nocUrl = '';
      dlUrl = '';
      rcUrl = '';
      bankChequeUrl = '';
      billUrl = '';
    }
    state = const AsyncValue.data(null);
    // commonNavigator(child: KycVerificationScreen());
  }

  onSelectSmartPhoneUser(String? selectedName) async {
    state = const AsyncLoading();
    LeadFieldsModel? selectedGender = smartPhoneUserList.firstWhere(
      (lead) => lead.name == selectedName,
      orElse: () => LeadFieldsModel(name: "", value: ""),
    );

    smartPhoneUser = selectedGender.name ?? "";
    selectedSmartPhoneUsersId =
        selectedGender.value ?? "0"; // Store the selected ID
    if (globalKycDetailModel.isSmartphoneUserMandatory!) {
      validateLeadSource(selectedSmartPhoneUsersId);
    }
    checkValidateGeneralInfo();
    state = const AsyncValue.data(null);
  }

  onSelectMaritalStatus(String? selectedName) async {
    state = const AsyncLoading();
    LeadFieldsModel? selectedGender = maritalStatusList.firstWhere(
      (lead) => lead.name == selectedName,
      orElse: () => LeadFieldsModel(name: "", value: ""),
    );

    selectedMaritalStatus = selectedGender.name ?? "";
    selectedMaritalStatusId =
        selectedGender.value ?? "0"; // Store the selected ID
    if (globalKycDetailModel.isMaritalStatusMandatory!) {
      validateLeadSource(selectedMaritalStatusId);
    }
    checkValidateGeneralInfo();
    state = const AsyncValue.data(null);
  }

  onSelectVehicleMake(String? selectedName) async {
    state = const AsyncLoading();
    LeadFieldsModel? selectedGender = vehicleMakeList.firstWhere(
      (lead) => lead.name == selectedName,
      orElse: () => LeadFieldsModel(name: "", value: ""),
    );

    selectedVehicleMake = selectedGender.name ?? "";
    selectedVehicleMakeId =
        selectedGender.value ?? "0"; // Store the selected ID
    if (globalKycDetailModel.isVehicleMakeMandatory!) {
      validateLeadSource(selectedVehicleMakeId);
    }
    checkValidateVehicleInfo();
    state = const AsyncValue.data(null);
  }

  onSelectVehicleOwnership(String? selectedName) async {
    state = const AsyncLoading();
    LeadFieldsModel? selectedGender = vehicleOwnershipList.firstWhere(
      (lead) => lead.name == selectedName,
      orElse: () => LeadFieldsModel(name: "", value: ""),
    );

    selectedVehicleOwnership = selectedGender.name ?? "";
    selectedVehicleOwnershipId =
        selectedGender.value ?? "0"; // Store the selected ID
    if (globalKycDetailModel.isVehicleOwnershipMandatory!) {
      validateLeadSource(selectedVehicleOwnershipId);
    }

    checkValidateVehicleInfo();
    state = const AsyncValue.data(null);
  }

  onSelectHouseOwnership(String? selectedName) async {
    state = const AsyncLoading();
    LeadFieldsModel? selectedGender = houseOwnershipList.firstWhere(
      (lead) => lead.name == selectedName,
      orElse: () => LeadFieldsModel(name: "", value: ""),
    );

    selectedHouseOwnership = selectedGender.name ?? "";
    selectedHouseOwnershipId =
        selectedGender.value ?? "0"; // Store the selected ID
    if (globalKycDetailModel.isHouseOwnershipMandatory!) {
      validateLeadSource(selectedHouseOwnershipId);
    }

    checkValidateBankInfo();
    state = const AsyncValue.data(null);
  }

  onSelectBank(String? selectedName) async {
    state = const AsyncLoading();
    LeadFieldsModel? selectedGender = bankList.firstWhere(
      (lead) => lead.name == selectedName,
      orElse: () => LeadFieldsModel(name: "", value: ""),
    );

    selectedBank = selectedGender.name ?? "";
    selectedBankId = selectedGender.value ?? "0"; // Store the selected ID
    if (globalKycDetailModel.isBankNameMandatory!) {
      validateLeadSource(selectedBankId);
    }

    checkValidateBankInfo();
    state = const AsyncValue.data(null);
  }

  // checkValidateGeneralInfo() {
  //   isValidateGeneralInfo = false;
  //   if (validateAadhaar(aadharNoController.text.trim()) != null) {
  //     return;
  //   }
  //
  //   if (validatePanNo(panNoController.text.trim()) != null) {
  //     return;
  //   }
  //   if (validateAddress(currentAddressController.text) != null) {
  //     return;
  //   }
  //   if (validateAddress(permanentAddressController.text) != null) {
  //     return;
  //   }
  //   if (panNoController.text.isEmpty) {
  //     return;
  //   }
  //   if (selectedSmartPhoneUsersId.isEmpty || selectedSmartPhoneUsersId == "0") {
  //     return;
  //   }
  //   if (selectedMaritalStatusId.isEmpty || selectedMaritalStatusId == "0") {
  //     return;
  //   }
  //
  //   if (userPicFile == null) {
  //     return;
  //   }
  //
  //   if (frontAadharPicFile == null) {
  //     return;
  //   }
  //   if (backAadharPicFile == null) {
  //     return;
  //   }
  //   if (panCardPicFile == null) {
  //     return;
  //   }
  //
  //   isValidateGeneralInfo = true;
  // }
  //
  // checkValidateVehicleInfo() {
  //   isValidateVehicleInfo = false;
  //   // if(validateDropDown(nocController.text) != null){
  //   //   return;
  //   // }
  //   // if(validateDropDown(loanNoController.text) != null){
  //   //   return;
  //   // }
  //   if (validateDlNo(dlNoController.text) != null) {
  //     return;
  //   }
  //   if (validateRcNo(rcNoController.text) != null) {
  //     return;
  //   }
  //   if (validateDropDown(registrationDateController.text) != null) {
  //     return;
  //   }
  //   if (validateDropDown(vehicleAgeController.text) != null) {
  //     return;
  //   }
  //   if (validateDropDown(latitudeNoController.text) != null) {
  //     return;
  //   }
  //   if (validateDropDown(longitudeNoController.text) != null) {
  //     return;
  //   }
  //   if (selectedVehicleOwnershipId.isEmpty || selectedVehicleOwnershipId == "0") {
  //     return;
  //   }
  //   if (selectedVehicleMakeId.isEmpty || selectedVehicleMakeId == "0") {
  //     return;
  //   }
  //   if (dlPicFile == null) {
  //     return;
  //   }
  //   if (rcPicFile == null) {
  //     return;
  //   }
  //   if (nocPicFile == null) {
  //     return;
  //   }
  //
  //   isValidateVehicleInfo = true;
  // }

  void validateDLNumber2(String dlNumber) {
    RegExp reg = RegExp(
        r"^(([A-Z]{2}[0-9]{2})( )|([A-Z]{2}-[0-9]{2}))((19|20)[0-9][0-9])[0-9]{7}" +
            r"|([a-zA-Z]{2}[0-9]{2}[\\/][a-zA-Z]{3}[\\/][0-9]{2}[\\/][0-9]{5})" +
            r"|([a-zA-Z]{2}[0-9]{2}(N)[\\-]{1}((19|20)[0-9][0-9])[\\-][0-9]{7})" +
            r"|([a-zA-Z]{2}[0-9]{14})" +
            r"|([a-zA-Z]{2}[\\-][0-9]{13})" +
            r"|([A-Z]{2}[0-9][ -_](19|20)[0-9]{2}[0-9]{7})$");

    if (!reg.hasMatch(dlNumber.toUpperCase())) {
      dlNoController.clear();
    }
  }

  // checkValidateBankInfo() {
  //   isValidateBankInfo = false;
  //   if (validateDropDown(accountNoController.text) != null) {
  //     return;
  //   }
  //   if (validateIFSCCode(ifscCodeController.text) != null) {
  //     return;
  //   }
  //   if (validateDropDown(dlNoController.text) != null) {
  //     return;
  //   }
  //   if (validateDropDown(firstReferenceNameController.text) != null) {
  //     return;
  //   }
  //   if (validatePhone(firstReferenceMobileNoController.text.trim()) != null) {
  //     return;
  //   }
  //   if (validateDropDown(secondReferenceNameController.text) != null) {
  //     return;
  //   }
  //   if (validatePhone(secondReferenceMobileNoController.text.trim()) != null) {
  //     return;
  //   }
  //   if (validateDropDown(cibilScoreController.text) != null) {
  //     return;
  //   }
  //   if (selectedBankId.isEmpty || selectedBankId == "0" ) {
  //     return;
  //   }
  //   if (selectedHouseOwnershipId.isEmpty || selectedHouseOwnershipId == "0") {
  //     return;
  //   }
  //   if (bankChequePicFile == null) {
  //     return;
  //   }
  //   if (billPicFile == null) {
  //     return;
  //   }
  //   if (selfieList.isEmpty) {
  //     return;
  //   }
  //
  //   isValidateBankInfo = true;
  // }

  changeKYCSection(index) {
    if (pageController.hasClients) {
      // Ensure controller is attached
      pageController.animateToPage(index,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    } else {
      debugPrint("Controller Is Not Attach");
    }
  }

  sameAsCurrentAddress() {
    bool value = _isSameAddress = !_isSameAddress;
    state = AsyncLoading();
    _isSameAddress = value;
    if (value) {
      permanentAddressController.text = currentAddressController.text;
      checkValidateGeneralInfo();
    }
    state = AsyncValue.data(_isSameAddress);
  }

  /// Renames the selected file while preserving its extension and saves it in the app's temp directory
  Future<File> renameFile(File file, String newFileName) async {
    final String extension = path.extension(file.path);
    final Directory tempDir = await getTemporaryDirectory();
    final String newPath = path.join(tempDir.path, "$newFileName$extension");
    return file.copy(newPath); // Copy the file with a new name
  }

  pickFileData({required PicType type, required File file}) async {
    state = AsyncLoading();

    if (type == PicType.adharFront) {
      frontAadharPicFile = file;
      frontAadharUrl = "";
    } else if (type == PicType.adharBack) {
      backAadharPicFile = file;
      backAadharUrl = "";
    } else if (type == PicType.pan) {
      panCardPicFile = file;
      panCardUrl = "";
    } else if (type == PicType.profile) {
      userPicFile = file;
      userUrl = "";
    } else if (type == PicType.noc) {
      nocPicFile = file;
      nocUrl = "";
    } else if (type == PicType.dl) {
      dlPicFile = file;
    } else if (type == PicType.rc) {
      rcPicFile = file;
      rcUrl = "";
    } else if (type == PicType.bankCheque) {
      bankChequePicFile = file;
      bankChequeUrl = "";
    } else if (type == PicType.bill) {
      billPicFile = file;
      billUrl = "";
    } else if (type == PicType.selfie) {
      selfieList.add({
        "url": "",
        "file": file,
      });
    }
    print("file =--= $file");
    state = AsyncValue.data(null);
  }

  Future<void> getAllFields() async {
    startLoading();
    await Future.wait([
      getMaritalStatusList(),
      getVehicleOwnershipList(),
      getHouseOwnershipList(),
      getBankList(),
      getVehicleMakeList(),
      getLeadKYCDetails(),
    ]);
    stopLoading();
  }

  Future<void> getMaritalStatusList() async {
    await _fetchLeadData(
        () => ref.read(kycServiceProvider).getMaritalStatusList(),
        _maritalStatusList);
  }

  Future<void> getVehicleOwnershipList() async {
    await _fetchLeadData(
        () => ref.read(kycServiceProvider).getVehicleOwnershipList(),
        _vehicleOwnershipList);
  }

  Future<void> getHouseOwnershipList() async {
    await _fetchLeadData(
        () => ref.read(kycServiceProvider).getVehicleOwnershipList(),
        _houseOwnershipList);
  }

  Future<void> getBankList() async {
    await _fetchLeadData(
        () => ref.read(kycServiceProvider).getBankList(), _bankList);
  }

  Future<void> getVehicleMakeList() async {
    await _fetchLeadData(
        () => ref.read(kycServiceProvider).getVehicleMakeList(),
        _vehicleMakeList);
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

  // Generic method to handle different data types
  Future<void> _fetchLeadData<T>(
      Future<List<T>?> Function() fetchFunction, List<T> targetList) async {
    try {
      final kycModel = await fetchFunction();
      if (kycModel != null) {
        targetList.clear();
        targetList.addAll(kycModel);
      } else {
        debugPrint("Error: kycModel is null");
      }
    } catch (e, stackTrace) {
      debugPrint("Exception: $e\n$stackTrace");
    }
  }

  void startInsertKycLoading() {
    state = const AsyncLoading();
    _isInsertKycLoading = true;
    state = const AsyncValue.data(null);
  }

  void stopInsertKycLoading() {
    state = const AsyncLoading();
    _isInsertKycLoading = false;
    state = const AsyncValue.data(null);
  }

  Future<void> insertLeadKyc() async {
    startInsertKycLoading();

    List<File> uploadFileList = [];
    List<String> uploadFileParam = [];

    try {
      if (userPicFile != null) {
        uploadFileList.add(await renameFile(userPicFile!, 'UserPic'));
        uploadFileParam.add('userpic');
      }

      if (frontAadharPicFile != null) {
        uploadFileList
            .add(await renameFile(frontAadharPicFile!, 'AadharFrontPic'));
        uploadFileParam.add('aadharfrontpic');
      }

      if (backAadharPicFile != null) {
        uploadFileList
            .add(await renameFile(backAadharPicFile!, 'AadharBackPic'));
        uploadFileParam.add('aadharbackpic');
      }

      if (panCardPicFile != null) {
        uploadFileList.add(await renameFile(panCardPicFile!, 'PanCardPic'));
        uploadFileParam.add('pancardpic');
      }

      if (nocPicFile != null) {
        uploadFileList.add(await renameFile(nocPicFile!, 'NOCDocument'));
        uploadFileParam.add('nocdocument');
      }

      if (dlPicFile != null) {
        uploadFileList.add(await renameFile(dlPicFile!, 'DLPic'));
        uploadFileParam.add('dlpic');
      }

      if (rcPicFile != null) {
        uploadFileList.add(await renameFile(rcPicFile!, 'RCPic'));
        uploadFileParam.add('rcpic');
      }

      if (bankChequePicFile != null) {
        uploadFileList
            .add(await renameFile(bankChequePicFile!, 'BlanckCheckPic'));
        uploadFileParam.add('blanckcheckpic');
      }

      if (billPicFile != null) {
        uploadFileList.add(await renameFile(billPicFile!, 'OwnershipPic'));
        uploadFileParam.add('ownershippic');
      }

      if (selfieList[0]['file'] != null) {
        uploadFileList
            .add(await renameFile(selfieList[0]['file'], "SelfieWithDriver"));
        uploadFileParam.add('selfiewithdriver');
      }

      if (selfieList.length > 1 && selfieList[1]['file'] != null) {
        uploadFileList
            .add(await renameFile(selfieList[1]['file'], "DriverPic1"));
        uploadFileParam.add('driverpic1');
      }
      if (selfieList.length > 2 && selfieList[2]['file'] != null) {
        uploadFileList
            .add(await renameFile(selfieList[2]['file'], "DriverPic2"));
        uploadFileParam.add('driverpic2');
      }
      if (selfieList.length > 3 && selfieList[3]['file'] != null) {
        uploadFileList
            .add(await renameFile(selfieList[3]['file'], "DriverPic3"));
        uploadFileParam.add('driverpic3');
      }
      if (selfieList.length > 4 && selfieList[4]['file'] != null) {
        uploadFileList
            .add(await renameFile(selfieList[4]['file'], "DriverPic4"));
        uploadFileParam.add('driverpic4');
      }
      if (selfieList.length > 5 && selfieList[5]['file'] != null) {
        uploadFileList
            .add(await renameFile(selfieList[5]['file'], "DriverPic5"));
        uploadFileParam.add('driverpic5');
      }

      KycLeadRequest kycLeadRequest = KycLeadRequest(
        leadId: selectedLeadId,
        vehicleOwnershipId: int.parse(selectedVehicleOwnershipId),
        vehicleMakeId: int.parse(selectedVehicleMakeId),
        houseOwnershipId: int.parse(selectedHouseOwnershipId),
        isSmartPhoneUser: smartPhoneUser == "Yes" ? true : false,
        maritialStatus: int.parse(selectedMaritalStatusId),
        aadharNo: aadharNoController.text.replaceAll(' ', '').trim(),
        dob: dobApiController.text,
        currentAddress: currentAddressController.text,
        permanentAddress: permanentAddressController.text,
        panNo: panNoController.text,
        bankId: int.parse(selectedBankId),
        accountNo: accountNoController.text,
        ifscCode: ifscCodeController.text,
        ref1Name: firstReferenceNameController.text,
        ref1MobileNo: firstReferenceMobileNoController.text,
        ref2Name: secondReferenceNameController.text,
        ref2MobileNo: secondReferenceMobileNoController.text,
        cibilScore: int.parse(cibilScoreController.text),
        loanNo: int.parse(loanNoController.text),
        dlNo: dlNoController.text.trim(),
        rcNo: rcNoController.text.trim(),
        rcDate: registrationApiDateController.text,
        vehicleDate: vehicleDateController.text,
        vehicleAge: int.parse(vehicleAgeController.text),
        latitude: double.parse(latitudeNoController.text),
        longitude: double.parse(longitudeNoController.text),
        userPic: "",
        aadharFrontPic: "",
        aadharBackPic: "",
        panCardPic: "",
        nocDocument: "",
        dlPic: "",
        rcPic: "",
        blanckCheckPic: "",
        selfieWithDriver: "",
        driverPic1: "",
        driverPic2: "",
        driverPic3: "",
        driverPic4: "",
        driverPic5: "",
        ownershipPic: "",
        entryBy: 1,
        entryDate: DateTime.now(),
        updateBy: 1,
        updateDate: DateTime.now(),
      );

      log("Insert Kyc Request === ${jsonEncode(kycLeadRequest)}");
      log("Insert Kyc Upload File === ${jsonEncode(uploadFileList.toString())}");
      log("Insert Kyc Upload File Param === ${jsonEncode(uploadFileParam)}");

      await ref.read(kycServiceProvider).insertLeadKyc(
          kycLeadRequest: kycLeadRequest,
          imagePath: uploadFileList,
          imageParam: uploadFileParam);

      stopInsertKycLoading();
    } catch (e, stackTrace) {
      debugPrint("Exception in Add Kyc: $e\n$stackTrace");
      stopInsertKycLoading();
    }

    stopInsertKycLoading();
  }

  // String getFileName(String path) {
  //   String fileName = p.basename(path);
  //   return fileName;
  // }
}
