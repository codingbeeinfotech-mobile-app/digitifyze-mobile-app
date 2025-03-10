import 'package:digitifyze/ui/screens/on_boarding_screen/on_boarding_screen_controller.dart';
import 'package:digitifyze/utils/import_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WidgetOnBoarding extends ConsumerWidget {
  final String imgPath;
  final String title;
  final String subTitle;
  final bool firstPage;
  const WidgetOnBoarding(
      {super.key,
      required this.imgPath,
      required this.title,
      required this.subTitle,
      this.firstPage = false,
      });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    controller() => ref.read(onBoardingScreenControllerProvider.notifier);
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            imgPath,
            height: 345.h,

          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal:50.w),
                child: commonText(
                  text: title,
                  textAlign: TextAlign.center,
                  style: TextStyles()
                      .lexendMediumSize24(color: firstPage ? Colors.transparent :ColorStyles().black!),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              if(firstPage)...[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal:50.w),
                  child: RichText(text: TextSpan(
                      text: "${S.of(context).journeyWith} ",
                      style: TextStyles().robotoSize16Bold(color: ColorStyles().black!).copyWith(fontWeight: FontWeight.w400),
                      children: [
                        TextSpan(
                          text: S.of(context).dizitifyze,
                          style: TextStyles().robotoSize16Bold(color: ColorStyles().black!).copyWith(fontWeight: FontWeight.w600),
                        )
                      ]
                  ),

                  ),
                )
              ]else ... [
                commonText(
                  text: subTitle,
                  textAlign: TextAlign.center,
                  style: TextStyles()
                      .robotoSize16Regular(color: ColorStyles().black!),
                ),
              ],
            ],
          ),
          GestureDetector(
            onTap: () {
              controller().navigateToSignup( );
            },
            child: Container(
              padding:   EdgeInsets.symmetric(horizontal: 60.w, vertical: 18.h),
              decoration: BoxDecoration(
                 color: ColorStyles().orangePink,
                  borderRadius: BorderRadius.circular(15.r),),
              child: Text(S.of(context).next,
                  style: TextStyles().bentonSansSize16Regular(color: ColorStyles().white!)),
            ),
          ),
        ],
      ),
    );
  }
}
