import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'dashboard_screen_controller.g.dart';

@riverpod
class DashboardScreenController extends _$DashboardScreenController {


  int _currentPage = 0;
  int get currentPage => _currentPage;

  @override
  Future<Map<String, dynamic>> build() async {
  return {
    "currentPage": 0,
  };
  }


  changeCurrentPage(value){
    state = AsyncData({"currentPage": value});
  }





}
