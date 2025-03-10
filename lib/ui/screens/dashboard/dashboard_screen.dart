import 'package:digitifyze/ui/screens/dashboard/dashboard_screen_controller.dart';
import 'package:digitifyze/ui/screens/sign_up_screen/sign_up_screen.dart';
import 'package:digitifyze/ui/screens/tab/home/home_screen/home_screen.dart';
import 'package:digitifyze/ui/widgets/common_widgets/under_development.dart';
import 'package:digitifyze/utils/import_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() =>
      _MyConsumerStatefulWidgetState();
}

class _MyConsumerStatefulWidgetState extends ConsumerState<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final currentPage =
        ref.watch(dashboardScreenControllerProvider.select((state) {
      return state.when(
        data: (map) => map["currentPage"] ?? 0,
        loading: () => -1, // Temporary loading state
        error: (error, _) => -1,
      );
    }));

    debugPrint("TEST");

    return Container(
      color: ColorStyles().whiteLilac!,
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          buildTopBar(),
          if (currentPage != 0) buildDetails(),
          Expanded(
            child: currentPage == -1
                ? Center(child: CircularProgressIndicator())
                : _buildPage(currentPage),
          ),
          commonText(
              text: "Powered by Digitifyze",
              style: TextStyles()
                  .robotoSize12Light(
                  color: ColorStyles().orangePink!)
                  .copyWith(fontWeight: FontWeight.w600,
                  foreground: Paint()
                    ..shader = LinearGradient(begin: Alignment.bottomCenter,end: Alignment.topCenter,

                      colors: <Color>[
                        Color(0xff1A7FA4),   Color(0xff6DE711),

                      ],
                    ).createShader(
                        Rect.fromLTWH(0.0,  0.54.sh, 100.0, 00.5.sh)))),
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
    );
  }

  Widget buildTopBar() {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 25.h,
          ),
          Row( 
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                AppImg.appLogoBlackGrad2Png,
                height: 47.5.h,
              ),
              Row(
                children: [
                  smallButton(
                    iconPath: AppImg.icNotification,
                  ),
                  SizedBox(
                    width: 7.w,
                  ),
                  GestureDetector(
                      onTap: () {
                        AppPreferences().clearPreferences();
                        commonNavigatorPushAndRemoveUntil(
                            child: SignUpScreen());
                      },
                      child: Container(
                        height: 36.h,
                        width: 36.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            border: Border.all(color: ColorStyles().orangePink!)
                            // color: Colors.red,
                            ),
                        child: Icon(
                          Icons.logout,
                          size: 15.w,
                          color: ColorStyles().orangePink!,
                        ),
                      )),
                  SizedBox(
                    width: 7.w,
                  ),
                  smallButton(
                    iconPath: AppImg.icSetting,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPage(int currentPage) {
    switch (currentPage) {
      case 1:
        return HomeScreen();
      case 2:
        return UnderDevelopment(text1: "Battery As", text2: "Service");
      case 3:
        return UnderDevelopment(text1: "Vehicle As", text2: "Service");
      default:
        return DashboardItem();
    }
  }

  Widget buildDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 36.5.h,
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 10.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            gradient: LinearGradient(
              colors: [
                ColorStyles().orangePink!,
                ColorStyles().celestialBlue!,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    commonText(
                        text: "Ravikant Shinde",
                        style: TextStyles()
                            .robotoSize16SemiBold(color: ColorStyles().white!)),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        commonText(
                            text: "${S.of(context).empCode}: ",
                            style: TextStyles()
                                .robotoSize14Regular(
                                    color: ColorStyles().white!)
                                .copyWith(fontSize: 12)),
                        commonText(
                            text: "RVD:1254",
                            style: TextStyles()
                                .robotoSize14SemiBold(
                                    color: ColorStyles().white!)
                                .copyWith(fontSize: 12)),
                      ],
                    ),
                    SizedBox(
                      height: 13.h,
                    ),
                    commonText(
                        text: "${S.of(context).lastLogin}: 01/01/2025, 12:55pm",
                        style: TextStyles()
                            .robotoSize14Regular(color: ColorStyles().white!)
                            .copyWith(fontSize: 10)),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    AppImg.icClockIn,
                    height: 59.h,
                    width: 54.w,
                  ),
                  commonText(
                      text: S.of(context).clockIn,
                      textAlign: TextAlign.center,
                      style: TextStyles()
                          .robotoSize14Regular(color: ColorStyles().white!)
                          .copyWith(fontSize: 10)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget smallButton({required String iconPath}) {
    return Container(
      height: 36.h,
      width: 36.h,
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: ColorStyles().orangePink!)
          // color: Colors.red,
          ),
      child: Image.asset(iconPath),
    );
  }
}

class DashboardItem extends ConsumerWidget {
  const DashboardItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    controller() => ref.read(dashboardScreenControllerProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildMenuItem(
              text: S.of(context).fixedBattery,
              imgPath: AppImg.fixedBattery,
              // h: 50.h,
              onTap: () {
                controller().changeCurrentPage(1);
              },
            ),
            buildMenuItem(
              text: S.of(context).batteryAsService,
              imgPath: AppImg.batteryService,
              onTap: () {
                controller().changeCurrentPage(2);
              },
            ),
          ],
        ),
        SizedBox(
          height: 48.h,
        ),
        buildMenuItem(
          text: S.of(context).vehicleAsService,
          imgPath: AppImg.vehicleService,
          onTap: () {
            controller().changeCurrentPage(3);
          },
        ),
      ],
    );
  }

  Widget buildMenuItem(
      {required String imgPath,
      required String text,
      void Function()? onTap,
      double? h}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 144.h,
        width: 144.w,
        padding: EdgeInsets.symmetric(vertical: 3.h),
        decoration: BoxDecoration(
            color: ColorStyles().white!,
            borderRadius: BorderRadius.circular(32.r),
            boxShadow: [
              BoxShadow(
                color:
                    Colors.grey.withAlpha((0.1 * 255).round()), // Shadow color
                blurRadius: 10,
                offset: const Offset(2, 2), // Position of the shadow
              )
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              imgPath,
              height: 60.h,
            ),
            commonText(
                text: text,
                style: TextStyles()
                    .robotoSize14Regular(color: ColorStyles().black!)
                    .copyWith())
          ],
        ),
      ),
    );
  }

  Widget smallButton({required String iconPath}) {
    return Container(
      height: 36.h,
      width: 36.h,
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: ColorStyles().orangePink!)
          // color: Colors.red,
          ),
      child: Image.asset(iconPath),
    );
  }
}
