import 'package:digitifyze/ui/screens/tab/home/assets_management_screen/tabs/assigned_tab_screen.dart';
import 'package:digitifyze/ui/screens/tab/home/assets_management_screen/tabs/fresh_stock_tab_screen.dart';
import 'package:digitifyze/ui/screens/tab/home/assets_management_screen/tabs/recovered_tab_screen.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'assets_management_controller.g.dart';

@riverpod
class AssetsManagementController extends _$AssetsManagementController {

  late TabController tabController;

  List<String> tabList = ['Fresh Stock','Assigned','Recovered'];
  List<Widget> tabviewList = [
    FreshStockTabScreen(),
    AssignedTabScreen(),
    RecoveredTabScreen(),
  ];
  int _currentPage = 0;
  int get currentPage => _currentPage;
  PageController pageController = PageController();


  @override
  FutureOr<void> build() async {
    return;
  }


  changePage({required int index}) {
    state = AsyncLoading();
    pageController.animateToPage(index,
        duration: Duration(milliseconds: 100), curve: Curves.linear);

    _currentPage = index;
    debugPrint("Current Page => $_currentPage");

    state = AsyncValue.data(_currentPage);
  }


}
