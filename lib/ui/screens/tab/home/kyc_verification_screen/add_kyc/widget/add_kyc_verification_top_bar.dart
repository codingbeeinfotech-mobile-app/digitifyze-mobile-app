import 'package:digitifyze/ui/widgets/common_widgets/common_iconbutton.dart';
import 'package:digitifyze/utils/import_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddKycVerificationTopBar extends ConsumerWidget {
  const AddKycVerificationTopBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 257.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            ColorStyles().celestialBlue!,
            ColorStyles().orangePink!,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          AppBar(
            backgroundColor: Colors.transparent,
            leading: CommonIconButton(
              containerwidth: 50.h,
              containerheight: 50.h,
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.r),
              ),
              centericon: Icon(
                Icons.arrow_back_outlined,
                color: ColorStyles().white!,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            centerTitle: true,
            title: commonText(
              text: S.of(context).kycVerification,
              style: TextStyles()
                  .robotoSize16SemiBold(color: ColorStyles().white!)
                  .copyWith(fontSize: 20.sp),
            ),
          ),
        ],
      ),
    );
  }
}
