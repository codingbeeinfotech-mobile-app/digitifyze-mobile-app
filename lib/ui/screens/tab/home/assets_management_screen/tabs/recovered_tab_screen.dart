import 'package:digitifyze/ui/widgets/common_widgets/text_input_field.dart';
import 'package:digitifyze/utils/import_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecoveredTabScreen extends ConsumerWidget {
  const RecoveredTabScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
          color: ColorStyles().white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(8.r),topRight: Radius.circular(8.r))
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(height: 16.h,),
            Container(
              decoration: BoxDecoration(
                  color: ColorStyles().white!,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(8.r),topRight: Radius.circular(8.r))
              ),
              alignment: Alignment.topCenter,
              height: 61.h,
              child: TextInputField(
                hintText: S.of(context).search,
                hintStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Color(0xff070821)),
                controller: null,
                keyboardType: null,
                containerwidth: 335.w,
                containerheight: 40.h,
                containercolor:
                ColorStyles().metalicSilver!.withAlpha((0.2 * 255).round()),
                prefix: Padding(
                  padding: EdgeInsets.only(left: 12.w, right: 8.w),
                  child: Icon(Icons.search, color: Color(0xff070821)),
                ),
                prefixIconConstraints: BoxConstraints(minWidth: 0.w),
                borderRadius: BorderRadius.circular(10.0),
                underline: false,
                containerborder:
                Border.all(color: ColorStyles().mercury!, width: 1.0),
                textCapitalization: TextCapitalization.none,
                textInputAction: TextInputAction.go,
                textFieldsBorder: false,
              ),
            ),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(vertical: 16.0),
                itemCount: 1,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // commonNavigator(child: ProductAssignFormScreen());
                    },
                    child: Container(
                      width: 1.sw,
                      padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.w),
                      decoration: BoxDecoration(
                        color: ColorStyles().white!,
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: ColorStyles().borderGray!),
                        boxShadow: [
                          BoxShadow(
                            color: ColorStyles().softLavenderBlue!.withAlpha((0.4 * 255).round()), // Shadow color with 7% opacity
                            offset: Offset(0, 0), // X and Y offset
                            blurRadius: 5, // Blur radius
                            spreadRadius: 0, // Spread radius
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(child: commonText(text: "P00${index+1}",maxLines: 2,style: TextStyles().robotoSize16Bold(color: ColorStyles().black!))),
                              commonText(text: "19/01/2025", style: TextStyles().robotoSize16Medium(color: ColorStyles().black!)),
                            ],
                          ),
                          SizedBox(height: 2.h,),
                          commonText(text: "Test Name ${index+1}", style: TextStyles().robotoSize16Medium(color: ColorStyles().black!)),
                          SizedBox(height: 2.h,),
                          commonText(text: "Location", style: TextStyles().robotoSize16Medium(color: ColorStyles().black!)),
                        ],
                      ),
                    ),
                  );
                }, separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 16.h,);
              },),
            ),
          ],
        ),
      ),
    );
  }

}