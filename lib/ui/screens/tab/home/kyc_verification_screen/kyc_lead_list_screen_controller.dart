import 'package:digitifyze/model/response/lead_res_model.dart';
import 'package:digitifyze/services/kyc_service.dart';
import 'package:digitifyze/utils/import_utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'kyc_lead_list_screen_controller.g.dart';

@riverpod
class KycLeadListScreenController extends _$KycLeadListScreenController {
  late final PageController pageController;


  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isKycDetailLoading = false;
  bool get isKycDetailLoading => _isKycDetailLoading;


  List<Map<String, dynamic>> selfieList = [];

  //Pagination value
  int pageId = 1;
  int recordCount = 10;
  int totalCount = 0;
  String sortDirection = "ASC,ASC";
  TextEditingController searchLeadController = TextEditingController();

  int _selectLeadId = 0;
  int get selectedLeadId => _selectLeadId;
  onTapKycLeadList(int id) {
    _selectLeadId = id;
    debugPrint("Kyc Lead Id === $_selectLeadId");
  }

  final List<GetLeadDatum> _getKycDataList = <GetLeadDatum>[];
  List<GetLeadDatum> get getKycDataList => _getKycDataList;

  @override
  FutureOr<void> build() async {
    startLoading();
    pageController = PageController();
    await getAllFields();
    stopLoading();
  }


  Future<void> getAllFields() async {
    startLoading();
    await Future.wait([
      getKycList(),
    ]);
    stopLoading();
  }

  Future<void> getKycList() async {

    state = const AsyncLoading();

    GetLeadModel? getLeadModel = await ref.read(kycServiceProvider).getKycList(
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
        _getKycDataList.clear();
        _getKycDataList.addAll(getLeadModel.data ?? []);
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

}
