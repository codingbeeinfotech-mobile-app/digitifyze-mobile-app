import 'package:digitifyze/model/response/lead_res_model.dart';
import 'package:digitifyze/services/lead_service.dart';
import 'package:digitifyze/utils/import_utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'lead_screen_controller.g.dart';

@riverpod
class LeadScreenController extends _$LeadScreenController {

  List<GetLeadDatum> _getLeadDataList = [];
  List<GetLeadDatum> get getLeadDataList => _getLeadDataList;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

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

  String userId = "";

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

  Future<void> getAllFields() async {
    startLoading();
    await Future.wait([
      getLeadList(),
    ]);
    stopLoading();
  }

  Future<void> getLeadList() async {
    state = const AsyncLoading();

    GetLeadModel? getLeadModel =
        await ref.read(leadServiceProvider).getLeadList(
              pageId: pageId,
              recordCount: recordCount,
              orderByColumn: "Clead.EntryDate,Clead.UpdateDate",
              sortDirection: sortDirection,
              searchKeyword: searchLeadController.text.trim(),
            );

    if (getLeadModel != null) {
      if (getLeadModel.totalCount != null) {
        if(searchLeadController.text.trim().isEmpty){
          totalCount = getLeadModel.totalCount!;
        }else{
          totalCount = getLeadModel.filterCount!;
        }

      }
      if (getLeadModel.data != null) {
        _getLeadDataList.clear();
        _getLeadDataList.addAll(getLeadModel.data ?? []);
      } else {
        pageId = pageId - 1;
      }
    } else {
      pageId = pageId - 1;
    }
    debugPrint("Current Page => $pageId");

    state = const AsyncValue.data(null);

    // await _fetchLeadData(
    //     () => ref.read(leadServiceProvider).getLeadList(
    //           pageId: pageId,
    //           recordCount: 10,
    //           orderByColumn: "Clead.EntryDate,Clead.UpdateDate",
    //           sortDirection: sortDirection,
    //           searchKeyword: searchLeadController.text,
    //         ),
    //     _getLeadDataList);
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
}
