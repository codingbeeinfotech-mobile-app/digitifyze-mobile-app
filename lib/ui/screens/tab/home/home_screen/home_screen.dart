import 'package:digitifyze/ui/screens/tab/home/assets_management_screen/assets_management_screen.dart';
import 'package:digitifyze/ui/screens/tab/home/home_screen/home_screen_controller.dart';
import 'package:digitifyze/ui/screens/tab/home/kyc_verification_screen/kyc_lead_list_screen.dart';
import 'package:digitifyze/ui/screens/tab/home/lead_screen/lead_list_screen.dart';
import 'package:digitifyze/ui/screens/tab/home/on_boarding_screen/on_boarding_list_screen.dart';
import 'package:digitifyze/ui/screens/tab/home/product_assign_screen/product_assign_screen.dart';
import 'package:digitifyze/ui/widgets/common_gridview.dart';
import 'package:digitifyze/utils/import_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _MyConsumerStatefulWidgetState();
}

class _MyConsumerStatefulWidgetState extends ConsumerState<HomeScreen> {



  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    controller() => ref.read(homeScreenControllerProvider.notifier);
    final homeMenuList = controller().getMenuList(context: context);

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 29.h,),
          commonRichText(
              text1: "Fixed ",
              style1: TextStyles().robotoSize16SemiBold(color: ColorStyles().black!).copyWith(fontSize: 24.sp),
              text2: "Battery",
              style2: TextStyles().robotoSize16SemiBold(color: ColorStyles().orangePink!).copyWith(fontSize: 24.sp)
          ),
          SizedBox(height: 38.h,),
          CommonGridView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            width: w,
            itemCount: homeMenuList.length,
            mainAxisExtent: null,
            childAspectRatio: 1.0,
            crossAxisSpacing: 18.0,
            mainAxisSpacing: 18.0,
            crossAxisCount: 3,
            maxCrossAxisExtent: 0.0 ,
            itemBuilder: (context,index ) {
              var item = homeMenuList[index];
              return GestureDetector(
                onTap: () {
                  if(index==1){
                    commonNavigator(child: LeadListScreen());
                  }else if(index==2){
                    commonNavigator(child: KycLeadListScreen());
                  }else if(index==3){
                    commonNavigator(child: OnBoardingListScreen());
                  }else if(index==4){
                    commonNavigator(child: ProductAssignScreen());
                  }else if(index==6){
                    commonNavigator(child: AssetsManagementScreen());
                  }
                  else{
                    DialogServiceV1().showToast(content: "In Progress",);
                  }

                },
                child: Container(
                  decoration: BoxDecoration(
                      color: ColorStyles().white!,  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withAlpha((0.1 * 255).round()), // Shadow color
                      blurRadius: 10,
                      offset: const Offset(2, 2), // Position of the shadow
                    ),

                    // BoxShadow(
                    //   color: Colors.black12.withOpacity(0.07), // Shadow color with 7% opacity
                    //   offset: Offset(8, 8), // X and Y offset
                    //   blurRadius: 50, // Blur radius
                    //   spreadRadius: 0, // Spread radius
                    // ),

                  ],
                      // color: Colors.red,
                      borderRadius: BorderRadius.circular(15.r)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Image.asset(item['imgPath'],fit: BoxFit.cover,
                        width: 40.w,),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.w),
                        child: commonText(text: item['title'],overflow: TextOverflow.ellipsis,maxLines: 2,textAlign: TextAlign.center,style: TextStyles().robotoSize16Medium(color: ColorStyles().black!).copyWith(fontSize: 10.sp)),
                      )
                    ],
                  ),
                ),
              );
            },

          ),
          SizedBox(height: 38.h,),
        ],
      ),
    );
  }



  Widget buildDetails (context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6.h,horizontal: 10.w),
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
                commonText(text: "Ravikant Shinde", style: TextStyles().robotoSize16SemiBold(color: ColorStyles().white!)),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    commonText(text: "${S.of(context).empCode}: ", style: TextStyles().robotoSize14Regular(color: ColorStyles().white!).copyWith(fontSize: 12.sp)),
                    commonText(text: "RVD:1254", style: TextStyles().robotoSize14SemiBold(color: ColorStyles().white!).copyWith(fontSize: 12.sp)),
                  ],
                ),
                SizedBox(height: 13.h,),
                commonText(text: "${S.of(context).lastLogin}: 01/01/2025, 12:55pm", style: TextStyles().robotoSize14Regular(color: ColorStyles().white!).copyWith(fontSize: 10.sp)),

              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(AppImg.icClockIn,height: 59.h,width: 54.w,),
              commonText(text:S.of(context).clockIn,textAlign: TextAlign.center,style: TextStyles().robotoSize14Regular(color: ColorStyles().white!).copyWith(fontSize: 10.sp)),
            ],
          ),
        ],
      ),
    );
  }

  Widget smallButton ({required String iconPath}) {
    return Container(
      height: 36.h ,
      width: 36.h ,
      padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 8.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: ColorStyles().orangePink!)
        // color: Colors.red,
      ),
      child: Image.asset(iconPath),
    );
  }
}
