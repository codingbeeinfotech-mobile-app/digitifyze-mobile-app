import 'package:digitifyze/utils/import_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UnderDevelopment extends StatelessWidget {
  final String text1;
  final String text2;
  const UnderDevelopment({super.key,required this.text1,required this.text2});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
       children: [

         commonRichText(
             text1: "$text1 ",
             style1: TextStyles().robotoSize16SemiBold(color: ColorStyles().black!).copyWith(fontSize: 24.sp),
             text2: text2,
             style2: TextStyles().robotoSize16SemiBold(color: ColorStyles().orangePink!).copyWith(fontSize: 24.sp)
         ),

         Image.asset(AppImg.underDevelopment,height: 300.h,width: 326.w,),

         commonText(
             text: "Under Development",
             style: TextStyles().robotoSize16SemiBold(color: ColorStyles().celestialBlue!).copyWith(fontSize: 24.sp),
         ),
       ],
    );
  }
}
