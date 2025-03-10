import 'package:digitifyze/ui/widgets/common_widgets/common_iconbutton.dart';
import 'package:digitifyze/utils/import_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditLeadTopBar extends ConsumerWidget {
  const EditLeadTopBar({super.key});

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
          // stops: [0.0, 0.7],
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
                borderRadius: BorderRadius.circular(50),
              ),
              centericon: Icon(Icons.arrow_back_outlined,color: ColorStyles().white!,),
              onPressed: () {
                Navigator.pop(context);
              },

            ),
            centerTitle: true,
            title: commonText(text : S.of(context).updateLead,style: TextStyles().robotoSize16SemiBold(color: ColorStyles().white!).copyWith(fontSize: 20)),
          ),
        ],
      ),
    );
  }
}
