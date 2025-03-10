import 'package:digitifyze/ui/screens/bottom_nav_bar/bottom_nav_bar_controller.dart';
import 'package:digitifyze/ui/screens/dashboard/dashboard_screen_controller.dart';
import 'package:digitifyze/utils/import_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavBarScreen extends ConsumerWidget{
  const BottomNavBarScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final currentPage = ref.watch(bottomNavBarControllerProvider);
    controller()=> ref.read(bottomNavBarControllerProvider.notifier);
    final dashboardCurrentPage = ref.watch(dashboardScreenControllerProvider).when(
      data: (map) => map["currentPage"],  // Extract `currentPage` from `AsyncData`
      loading: () => -1,  // Provide a default value while loading
      error: (error, _) => -1,  // Handle error case
    );



    final dashboardController = ref.read(dashboardScreenControllerProvider.notifier);

    return Scaffold(
      backgroundColor: ColorStyles().white!,
      body: controller().widgetList.elementAt(controller().currentPage),

      bottomNavigationBar: SafeArea(
        child: Container(
          height: 74.h,
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: ColorStyles().white!,
            type: BottomNavigationBarType.fixed,
            elevation: 0.0,
            onTap: (value) {
              if (value == 0 && dashboardCurrentPage != 0) {  // Now comparing the actual `currentPage` value
                dashboardController.changeCurrentPage(0);
              }
              controller().changeTab(value);
            },
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(AppImg.icHome,height: 26.h,width: 26.w,),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Image.asset(AppImg.icUser,height: 26.h,width: 26.w,),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Image.asset(AppImg.icChat,height: 26.h,width: 26.w,),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Image.asset(AppImg.icMenu,height: 26.h,width: 26.w,),
                label: "",
              ),
            ],

          ),
        ),
      ),
    );
  }

}
