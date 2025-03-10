import 'package:digitifyze/ui/screens/on_boarding_screen/on_boarding_screen_controller.dart';
import 'package:digitifyze/utils/import_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingScreen extends ConsumerWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(onBoardingScreenControllerProvider);
    controller() => ref.read(onBoardingScreenControllerProvider.notifier);


    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Image.asset(
              AppImg.bgOnBoarding,
              fit: BoxFit.cover,
              height: 591.29.h,
              width: 591.29.h,
            ),
          ),
          PageView.builder(
            itemCount: controller().onBoardingList.length,
            controller: controller().pageController,
            onPageChanged: (value) {
              controller().changePage(index: value);
            },
            itemBuilder: (context, index) {
              return Container(
                  padding: EdgeInsets.symmetric(vertical: 70.h),
                  child:  controller().onBoardingList
                      .elementAt(controller().currentPage));
            },
          )
        ],
      ),
    );
  }
}
