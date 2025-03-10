import 'package:digitifyze/ui/screens/dashboard/dashboard_screen.dart';
import 'package:digitifyze/ui/screens/tab/home/home_screen/home_screen.dart';
import 'package:digitifyze/utils/import_utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'bottom_nav_bar_controller.g.dart';

@riverpod

class BottomNavBarController extends _$BottomNavBarController{

  List<Widget> _widgetList = [
    DashboardScreen(),
    Center(child: Text("User")),
    Center(child: Text("Chat")),
    Center(child: Text("Menu")),
  ];
  List get widgetList  => _widgetList;

  int _currentPage = 0;
  int get currentPage => _currentPage;

  FutureOr<void> build() {

  }

  void changeTab(int value) {
    // Update the current page first
    _currentPage = value;

    // Now update the state to reflect the new tab
    state = AsyncData(currentPage);
  }

}
