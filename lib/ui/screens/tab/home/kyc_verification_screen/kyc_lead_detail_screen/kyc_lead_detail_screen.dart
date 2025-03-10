import 'package:digitifyze/ui/screens/tab/home/lead_screen/lead_screen_controller.dart';
import 'package:digitifyze/ui/widgets/common_widgets/common_iconbutton.dart';
import 'package:digitifyze/ui/widgets/common_widgets/text_input_field.dart';
import 'package:digitifyze/utils/import_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class KycLeadDetailScreen extends ConsumerWidget {
  final int status;
  const KycLeadDetailScreen({super.key,this.status=0});
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    controller() => ref.watch(leadScreenControllerProvider.notifier);

    return Material(
      child: SafeArea(child: Container(
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
                            value: "DFV21545",
                            keyStyle: TextStyles()
                                .robotoSize16SemiBold(color: ColorStyles().black!)
                                .copyWith(fontSize: 20.sp),
                            valueStyle: TextStyles()
                                .robotoSize16SemiBold(color: ColorStyles().orangePink!)
                                .copyWith(fontSize: 20.sp)),
                        _keyValue(
                            key: "${S.of(context).status}: ",
                            value: getStatusText(),
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
                          labelText: S.of(context).kycRemark,
                          maxLine: 4,
                          controller: TextEditingController(text: "at add lead, Lead is moved for KYC Verification.")
                      ),
                      _verticalSizeBox(),
                      _buildAadharViewField(label: S.of(context).driverPic),
                      _verticalSizeBox(),
                      commonInputField(
                          labelText: S.of(context).smartPhoneUser,
                          controller: TextEditingController(text: "Yes")
                      ),
                      _verticalSizeBox(),
                      commonInputField(
                          labelText: S.of(context).maritalStatus,
                          controller: TextEditingController(text: "Married")
                      ),
                      _verticalSizeBox(),
                      Row(
                        children: [
                          Expanded(child: _buildAadharViewField(label: S.of(context).aadharPicFront),),
                          SizedBox(width: 12.w,),
                          Expanded(child: _buildAadharViewField(label: S.of(context).aadharPicBack),),
                        ],
                      ),
                      _verticalSizeBox(),
                      commonInputField(
                          labelText: S.of(context).aadharNo,
                          controller: TextEditingController(text: "2525 1245 8974")
                      ),
                      _verticalSizeBox(),
                      commonInputField(
                          labelText: S.of(context).dob,
                          controller: TextEditingController(text: "29/01/2025")
                      ),
                      _verticalSizeBox(),
                      commonInputField(
                          labelText: S.of(context).currentAddress,
                          maxLine: 2,
                          controller: TextEditingController(text: "4809, 24, Ansari Rd, Daryaganj, New Delhi, Delhi 110002")
                      ),
                      _verticalSizeBox(),
                      commonInputField(
                          labelText: S.of(context).permanentAddress,
                          maxLine: 2,
                          controller: TextEditingController(text: "4809, 24, Ansari Rd, Daryaganj, New Delhi, Delhi 110002")
                      ),
                      _verticalSizeBox(),
                      Row(
                        children: [
                          Expanded(child: _buildAadharViewField(label: S.of(context).panCardPic),),
                          SizedBox(width: 12.w,),
                          Expanded(child: commonInputField(
                              labelText: S.of(context).panNo,
                              controller: TextEditingController(text: "BFMPL5547K")
                          ),),
                        ],
                      ),
                      _verticalSizeBox(),
                      commonInputField(
                          labelText: S.of(context).vehicleOwnership,
                          controller: TextEditingController(text: "Owned")
                      ),
                      _verticalSizeBox(),
                      commonInputField(
                          labelText: S.of(context).loanNo,
                          controller: TextEditingController(text: "RVD231233")
                      ),
                      _verticalSizeBox(),
                      Row(
                        children: [
                          Expanded(child: _buildAadharViewField(label: S.of(context).dlPic),),
                          SizedBox(width: 12.w,),
                          Expanded(child: commonInputField(
                              labelText: S.of(context).dlNo,
                              controller: TextEditingController(text: "DL125/21554DE12")
                          ),),
                        ],
                      ),
                      _verticalSizeBox(),
                      Row(
                        children: [
                          Expanded(child: _buildAadharViewField(label: S.of(context).rcPic),),
                          SizedBox(width: 12.w,),
                          Expanded(child: commonInputField(
                              labelText: S.of(context).rcNo,
                              controller: TextEditingController(text: "DL125/21554DE12")
                          ),),
                        ],
                      ),
                      _verticalSizeBox(),
                      Row(
                        children: [
                          Expanded(
                            child: commonInputField(
                                labelText: S.of(context).registrationDate,
                                controller: TextEditingController(text: "29/01/2020")
                            ),
                          ),
                          SizedBox(width: 12.w,),
                          Expanded(
                            child: commonInputField(
                                labelText: S.of(context).vehicleAge,
                                controller: TextEditingController(text: "5 yr")
                            ),
                          ),
                        ],
                      ),
                      _verticalSizeBox(),
                      commonInputField(
                          labelText: S.of(context).vehicleMake,
                          controller: TextEditingController(text: "Other")
                      ),
                      _verticalSizeBox(),
                      Row(
                        children: [
                          Expanded(
                            child: commonInputField(
                                labelText: S.of(context).longitude,
                                controller: TextEditingController(text: "0.000000")
                            ),
                          ),
                          SizedBox(width: 12.w,),
                          Expanded(
                            child: commonInputField(
                                labelText: S.of(context).latitude,
                                controller: TextEditingController(text: "0.000000")
                            ),
                          ),
                        ],
                      ),
                      _verticalSizeBox(),
                      commonInputField(
                          labelText: S.of(context).bankName,
                          controller: TextEditingController(text: "HDCF Bank Pvt.")
                      ),
                      _verticalSizeBox(),
                      commonInputField(
                          labelText: S.of(context).accountNo,
                          controller: TextEditingController(text: "HDFC3453400099565567")
                      ),
                      _verticalSizeBox(),
                      commonInputField(
                          labelText: S.of(context).ifscCode,
                          controller: TextEditingController(text: "HDFC00021")
                      ),
                      _verticalSizeBox(),
                      _buildAadharViewField(label: S.of(context).blankChequePic),
                      _verticalSizeBox(),
                      _buildAadharViewField(label: S.of(context).selfieWithDriver,list: ['view','view','view','view','view']),
                      _verticalSizeBox(),
                      commonInputField(
                          labelText: S.of(context).referenceGuarantor1Name,
                          controller: TextEditingController(text: "Vinay Mann")
                      ),
                      _verticalSizeBox(),
                      commonInputField(
                          labelText: S.of(context).referenceGuarantor1MobileNo,
                          controller: TextEditingController(text: "98447715454")
                      ),
                      _verticalSizeBox(),
                      commonInputField(
                          labelText: S.of(context).referenceGuarantor2Name,
                          controller: TextEditingController(text: "Rakesh Mittal")
                      ),
                      _verticalSizeBox(),
                      commonInputField(
                          labelText: S.of(context).referenceGuarantor2MobileNo,
                          controller: TextEditingController(text: "98112215454")
                      ),
                      _verticalSizeBox(),
                      commonInputField(
                          labelText: S.of(context).houseOwnership,
                          controller: TextEditingController(text: "Owned")
                      ),
                      _verticalSizeBox(),
                      _buildAadharViewField(label: S.of(context).electricityWaterBillPic),
                      _verticalSizeBox(),
                      commonInputField(
                          labelText: S.of(context).cibilScore,
                          controller: TextEditingController(text: "0000")
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
      )),
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


  Widget _buildAadharViewField({required String label,List? list}) {
    return Container(
      height: 40.h,
      width: 313.w,
      // color: Colors.red,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // Border Container
          Container(
            height: 36,
            width: 313.w,
            padding: EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              border: Border.all(color: ColorStyles().borderGray!,),
              borderRadius: BorderRadius.circular(4.r),
              color: Colors.white, // Background color of the TextField
              boxShadow: [
                BoxShadow(
                  color: ColorStyles().softLavenderBlue!.withAlpha((0.4 * 255).round()), // Shadow color with 7% opacity
                  offset: Offset(12, 26), // X and Y offset
                  blurRadius: 50, // Blur radius
                  spreadRadius: 0, // Spread radius
                ),
              ],
            ),
            alignment: Alignment.centerLeft,
            child: list != null ?
                Row(
                  children: List.generate(list.length, (index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 8.w),
                      child: GestureDetector(
                        onTap: (){},
                        child: Text(
                          "View",
                          style: TextStyles().robotoSize14Regular(color: ColorStyles().black!).copyWith(fontSize: 12).copyWith(decoration: TextDecoration.underline),
                        ),
                      ),
                    );
                  },),
                )
                :GestureDetector(
              onTap: (){},
              child: Text(
                "View",
                style: TextStyles().robotoSize14Regular(color: ColorStyles().black!).copyWith(fontSize: 12).copyWith(decoration: TextDecoration.underline),
              ),
            ),
          ),
          // Floating Label
          Positioned(
            top: -3,
            left: 12,
            child: Container(
              color: ColorStyles().white!,
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                label,
                style: TextStyles().robotoSize14Regular(color: ColorStyles().dustGrey!).copyWith(fontSize: 10.sp)
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget _verticalSizeBox () {
    return SizedBox(height: 12.h,);
  }

  String getStatusText() {
    switch (status) {
      case 0:
        return "Pending";
      case 1:
        return "Accepted";
      default:
        return ""; // Fallback case (shouldn't reach here)
    }
  }

  Color getStatusColor() {
    switch (status) {
      case 0:
        return ColorStyles().orangeyYellow!;
      case 1:
        return ColorStyles().irishGreen!;
      default:
        return Colors.grey; // Default color for "Pending"
    }
  }


}
