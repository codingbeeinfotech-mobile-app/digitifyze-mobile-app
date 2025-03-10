import 'package:digitifyze/model/response/lead_res_model.dart';
import 'package:digitifyze/ui/screens/tab/home/lead_screen/lead_screen_controller.dart';
import 'package:digitifyze/ui/widgets/common_widgets/common_iconbutton.dart';
import 'package:digitifyze/ui/widgets/common_widgets/text_input_field.dart';
import 'package:digitifyze/utils/import_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class LeadDetailScreen extends ConsumerStatefulWidget {
  final GetLeadDatum getLeadModel;
  const LeadDetailScreen({super.key, required this.getLeadModel});

  @override
  ConsumerState<LeadDetailScreen> createState() => _LeadDetailScreenState();
}

class _LeadDetailScreenState extends ConsumerState<LeadDetailScreen> {



  @override
  Widget build(BuildContext context) {
    controller() => ref.watch(leadScreenControllerProvider.notifier);
    return Material(
      child: SafeArea(
        child: Container(
          color: ColorStyles().whiteLilac,
          child: Column(
          children: [
            Container(
              height: 94.h,
              decoration: BoxDecoration(
                  color: ColorStyles().white,
                boxShadow: [
                  BoxShadow(
                    color: ColorStyles().softLavenderBlue!.withAlpha((0.4 * 255).round()), // Shadow color with 7% opacity
                    offset: Offset(0, 26), // X and Y offset
                    blurRadius: 50, // Blur radius
                    spreadRadius: 0, // Spread radius
                  ),
                ],
              ),
              child: Row(
                children: [
                  CommonIconButton(
                    containerwidth: 50.h,
                    containerheight: 50.h,
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                    centericon: Icon(
                      Icons.arrow_back_outlined,
                      color: ColorStyles().orangePink!,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _keyValue(
                            key: "${S.of(context).leadID} ",
                            value: "${widget.getLeadModel.leadCode}",
                            keyStyle: TextStyles()
                                .robotoSize16SemiBold(color: ColorStyles().black!)
                                .copyWith(fontSize: 20.sp),
                            valueStyle: TextStyles()
                                .robotoSize16SemiBold(color: ColorStyles().orangePink!)
                                .copyWith(fontSize: 20.sp)),

                        _keyValue(
                            key: "${S.of(context).status}: ",
                            value: "${widget.getLeadModel.status}",
                            keyStyle: TextStyles()
                                .robotoSize14Regular(color: ColorStyles().grey!)
                                .copyWith(fontSize: 12.sp),
                            valueStyle: TextStyles()
                                .robotoSize14Regular(color: getStatusColor())
                                .copyWith(fontSize: 12.sp)),
                      ],
                    ),
                  ),
                  SizedBox(height: 50.h,width: 50.w,),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                decoration: BoxDecoration(
                    color: ColorStyles().white!, borderRadius: BorderRadius.circular(10.r)),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _verticalSizeBox(),
                      commonInputField(
                          labelText: S.of(context).leadRemark,
                          maxLine: 4,
                          controller: TextEditingController(text: "${widget.getLeadModel.lastName}")
                      ),
                      _verticalSizeBox(),
                      commonInputField(
                          labelText: S.of(context).leadSource,
                          controller: TextEditingController(text: "-")
                      ),
                      _verticalSizeBox(),
                      commonInputField(
                          labelText: S.of(context).referralInfluencerID,
                          controller: TextEditingController(text: "-")
                      ),
                      _verticalSizeBox(),
                      commonInputField(
                          labelText: S.of(context).generatedBy,
                          controller: TextEditingController(text: "-")
                      ),
                      _verticalSizeBox(),
                      commonInputField(
                          labelText: S.of(context).firstName,
                          controller: TextEditingController(text: "${widget.getLeadModel.firstName}")
                      ),
                      _verticalSizeBox(),
                      commonInputField(
                          labelText: S.of(context).lastName,
                          controller: TextEditingController(text: "${widget.getLeadModel.lastName}")
                      ),
                      _verticalSizeBox(),
                      commonInputField(
                          labelText: S.of(context).fatherName,
                          controller: TextEditingController(text: "-")
                      ),
                      _verticalSizeBox(),
                      commonInputField(
                          labelText: S.of(context).mobileNo,
                          controller: TextEditingController(text: "${widget.getLeadModel.mobileNo}")
                      ),
                      _verticalSizeBox(),
                      commonInputField(
                          labelText: S.of(context).gender,
                          controller: TextEditingController(text: "${widget.getLeadModel.gender}")
                      ),
                      _verticalSizeBox(),
                      commonInputField(
                          labelText: S.of(context).state,
                          controller: TextEditingController(text: "${widget.getLeadModel.stateName}")
                      ),
                      _verticalSizeBox(),
                      commonInputField(
                          labelText: S.of(context).city,
                          controller: TextEditingController(text: "${widget.getLeadModel.cityName}")
                      ),
                      _verticalSizeBox(),
                      commonInputField(
                          labelText: S.of(context).cluster,
                          controller: TextEditingController(text: "${widget.getLeadModel.cluster}")
                      ),
                      _verticalSizeBox(),
                      commonInputField(
                          labelText: S.of(context).dealer,
                          controller: TextEditingController(text: "${widget.getLeadModel.dealer}")
                      ),
                      _verticalSizeBox(),
                      commonInputField(
                          labelText: S.of(context).businessSegment,
                          controller: TextEditingController(text: "${widget.getLeadModel.businessSegment}")
                      ),
                      _verticalSizeBox(),
                      commonInputField(
                          labelText: S.of(context).serviceType,
                          controller: TextEditingController(text: "${widget.getLeadModel.serviceType}")
                      ),
                      _verticalSizeBox(),
                      commonInputField(
                          labelText: S.of(context).salesType,
                          controller: TextEditingController(text: "-")
                      ),
                      _verticalSizeBox(),
                      commonInputField(
                          labelText: S.of(context).vehicleFinanceStatus,
                          controller: TextEditingController(text: "${widget.getLeadModel.vehicleFinanceStatus}")
                      ),
                      _verticalSizeBox(),
                      _verticalSizeBox(),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 12.h,horizontal: 54.w),
                          decoration: BoxDecoration(
                              color: ColorStyles().orangePink!,
                              borderRadius: BorderRadius.circular(15.r),
                              border: Border.all(color: ColorStyles().orangePink!)
                          ),
                          child: Text(S.of(context).back,textAlign: TextAlign.center,style: TextStyles().robotoSize14Regular(color: ColorStyles().white!),),
                        ),
                      ),
                      _verticalSizeBox(),
                    ],
                  ),
                ),
              ),
            ),
          ],
              ),
        ),),
    );
  }
  Widget _keyValue({
    required String key,
    required String value,
    required TextStyle keyStyle,
    required TextStyle valueStyle,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        commonText(text: key, style: keyStyle),
        commonText(text: value, style: valueStyle),
      ],
    );
  }


  Widget commonInputField ({required String labelText,int? maxLine,TextEditingController? controller}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // Background color of the TextField
        boxShadow: [
          BoxShadow(
            color: ColorStyles().softLavenderBlue!.withAlpha((0.4 * 255).round()), // Shadow color with 7% opacity
            offset: Offset(12, 26), // X and Y offset
            blurRadius: 50, // Blur radius
            spreadRadius: 0, // Spread radius
          ),
        ],
        borderRadius: BorderRadius.circular(
            4.r), // Same as TextField's border radius
      ),
      child: Container(
        child: TextInputField(
          textFieldsBorder: true,
          textFieldBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.r),
            borderSide:
            BorderSide(color: ColorStyles().borderGray!),
          ),
          controller: controller,
          textstyle: TextStyles()
              .robotoSize16Regular(color: ColorStyles().black!).copyWith(fontSize: 10.sp),
          underline: false,maxLines:maxLine,
          lableText: labelText,isdescription: true,
          lableStyle: TextStyles()
              .robotoSize14Regular(color: ColorStyles().dustGrey!),
          contentPadding: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 10.h),
          borderColor: ColorStyles().borderGray!,
          borderRadius: BorderRadius.circular(4.0),
          hintText: "",hintStyle: TextStyles()
            .robotoSize16Regular(color: ColorStyles().black!).copyWith(fontSize: 10.sp),
          containercolor: ColorStyles().white,
          containerwidth: 313.w,
          keyboardType: TextInputType.text,
          textCapitalization: TextCapitalization.none,
        ),
      ),
    );
  }

  Widget _verticalSizeBox () {
    return SizedBox(height: 12.h,);
  }

  String getStatusText() {
    switch (widget.getLeadModel.activeStatus) {
      case "0":
        return "Re-Work";
      case "1":
        return "Accepted";
      case "2":
        return "Reject";
      default:
        return "Pending"; // Fallback case (shouldn't reach here)
    }
  }

  Color getStatusColor() {
    switch (widget.getLeadModel.status) {
      case "Pending":
        return ColorStyles().orangeyYellow!;
      case "Accepted":
        return ColorStyles().irishGreen!;
      case "Rejected":
        return Colors.red; // Example color for "Re-Work"
      case "":
        return ColorStyles().orangeyYellow!; // Example color for "Accepted"
      default:
        return Colors.grey; // Default color for "Pending"
    }
  }



}

