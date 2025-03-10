import 'package:digitifyze/ui/widgets/common_widgets/gradient_text.dart';
import 'package:digitifyze/utils/import_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddKycSuccessfullyScreen extends ConsumerWidget{
  const AddKycSuccessfullyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
   return Scaffold(
     body: SizedBox(
       width: MediaQuery.of(context).size.width,
       height: MediaQuery.of(context).size.height,
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.center,
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
          Image.asset(AppImg.success,width: 172.w,height: 162.h,),
           SizedBox(height: 33.h,),
           GradientText(text: S.of(context).congrats, style: TextStyles().robotoSize14Regular(color: Colors.black).copyWith(fontSize: 30), gradient: LinearGradient(
               colors: [
                 ColorStyles().celestialBlue!,
                 ColorStyles().orangePink!,
               ]),),
           SizedBox(height: 12.h,),
           commonText(text: S.of(context).yourKycVerificationSubmittedSuccessFully,textAlign: TextAlign.center,style: TextStyles().robotoSize14Regular(color: Colors.black).copyWith(fontSize: 23))
         ],
       ),
     ),
   );
  }

}
