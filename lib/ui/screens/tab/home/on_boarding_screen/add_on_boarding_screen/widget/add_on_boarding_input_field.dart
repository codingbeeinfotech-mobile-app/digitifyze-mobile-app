import 'package:digitifyze/ui/screens/tab/home/on_boarding_screen/on_boarding_screen_controller.dart';
import 'package:digitifyze/ui/widgets/common_widgets/common_dropdown.dart';
import 'package:digitifyze/ui/widgets/common_widgets/text_input_field.dart';
import 'package:digitifyze/ui/widgets/validate.dart';
import 'package:digitifyze/utils/dropdown/src/properties/clear_button_props.dart';
import 'package:digitifyze/utils/dropdown/src/properties/dropdown_button_props.dart';
import 'package:digitifyze/utils/dropdown/src/properties/dropdown_decorator_props.dart';
import 'package:digitifyze/utils/import_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddOnBoardingInputField extends ConsumerWidget {
  const AddOnBoardingInputField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(onBoardingScreenControllerProvider);
    controller() => ref.read(onBoardingScreenControllerProvider.notifier);
    return Positioned(
        top: 90.h,
        left: 13.5.w,
        right: 13.5.w,
        bottom: 16.h,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.h,vertical: 16.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: ColorStyles().white!
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Payment Frequency
                CommonDropdown(
                  onChangedsearch: (String? selectedName) {
                    if (selectedName != null) {
                      controller().onSelectPaymentFrequency(selectedName);
                    }
                  },
                  items: controller().selectPaymentFrequencyList.map((lead) => lead ?? "").toList(),  // Show names in dropdown
                  // selectedItem: controller().selectLeadSourceList.firstWhere(
                  //       (lead) => lead.value == controller().selectLeadSource,
                  //   orElse: () => LeadFieldsModel(),
                  // ).name,
                  dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        border: InputBorder.none, // Removes border
                        enabledBorder: InputBorder.none, // Removes enabled border
                        focusedBorder: InputBorder.none, // Removes focused border
                      )
                  ),
                  clearButtonProps: ClearButtonProps(),
                  dropdownButtonProps: DropdownButtonProps(
                      icon: Icon(Icons.keyboard_arrow_down_outlined,size: 16.h,)
                  ),
                  enabled: true,
                  elevation: 0,
                  isExpanded: true,
                  containerwidth: 312.w,
                  containerheight: 48.h,
                  // containercolor: Color(0xffF9FAFB),
                  containercolor: ColorStyles().white!,
                  titleText: S.of(context).paymentFrequency,
                  textstyle: TextStyles().robotoSize14Regular(color: ColorStyles().darkGrey!.withAlpha((0.3*255).round())),
                  itemTextStyle: TextStyles().robotoSize14Regular(color: ColorStyles().cloudyGrey!),
                  selectItemTextStyle : TextStyles().robotoSize14Regular(color: ColorStyles().black!),
                  boxShadow: [
                    BoxShadow(
                      color: ColorStyles().softLavenderBlue!.withAlpha((0.4 * 255).round()), // Shadow color with 7% opacity
                      offset: Offset(0, 0), // X and Y offset
                      blurRadius: 5, // Blur radius
                      spreadRadius: 0, // Spread radius
                    ),
                  ],
                  border: Border(
                      bottom: BorderSide(color: ColorStyles().borderGray!,width: 0.5)
                  ),
                  errorText: controller().isSubmit ? validateDropDown(controller().selectPaymentFrequency) : null,
                  errorStyle: TextStyles().robotoSize14Regular(color: ColorStyles().errorRed!).copyWith(fontSize: 12.sp),
                ),
                _verticalSizeBox(),
                //Scheme Name
                TextInputField(
                  focusNode: controller().schemeNameFocus,
                  hintText: S.of(context).schemeName,
                  hintStyle: TextStyles().robotoSize14Regular(color: ColorStyles().darkGrey!.withAlpha((0.3*255).round())),
                  controller: controller().schemeNameController,
                  maxLength: 50,
                  inputFormatters: [
                    // Custom input formatter to remove leading spaces
                    FilteringTextInputFormatter.allow(RegExp(r'^[^\s].*|[^\s].*')),
                  ],
                  onChanged: (value) {
                    validateEmptyField(controller().schemeNameController.text);
                  },
                  keyboardType: TextInputType.text,
                  containerwidth: 312.w,
                  containerheight: 48.h,
                  containercolor: ColorStyles().white!,
                  borderRadius: BorderRadius.zero,
                  underline: false,
                  underlinecolor: ColorStyles().borderGray!,
                  contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
                  containerborder: Border(
                      bottom: BorderSide(color: ColorStyles().borderGray!,width: 1.0)
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: ColorStyles().softLavenderBlue!.withAlpha((0.4 * 255).round()), // Shadow color with 7% opacity
                      offset: Offset(12, 26), // X and Y offset
                      blurRadius: 50, // Blur radius
                      spreadRadius: 0, // Spread radius
                    ),
                  ],
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.done,
                  textFieldsBorder: false,
                  textstyle: TextStyles().robotoSize14Regular(color: ColorStyles().black!),
                  errorText: controller().isSubmit ? validateEmptyField(controller().schemeNameController.text) : null,
                  errorStyle: TextStyles().robotoSize14Regular(color: ColorStyles().errorRed!).copyWith(fontSize: 12.sp),
                ),
                _verticalSizeBox(),
                //Down Payment
                TextInputField(
                  hintText: S.of(context).downPayment,
                  hintStyle: TextStyles().robotoSize14Regular(color: ColorStyles().darkGrey!.withAlpha((0.3 * 255).round())),
                  controller: controller().downPaymentController,
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp(r'\s')), // Deny spaces
                  ],
                  onChanged: (value) {
                    validateEmptyField(controller().downPaymentController.text);
                  },
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  containerwidth: 312.w,
                  containerheight: 48.h,
                  containercolor: ColorStyles().white!,
                  borderRadius: BorderRadius.zero,
                  underline: false,
                  underlinecolor: ColorStyles().borderGray!,
                  contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
                  containerborder: Border(
                      bottom: BorderSide(color: ColorStyles().borderGray!,width: 1.0)
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: ColorStyles().softLavenderBlue!.withAlpha((0.4 * 255).round()), // Shadow color with 7% opacity
                      offset: Offset(12, 26), // X and Y offset
                      blurRadius: 50, // Blur radius
                      spreadRadius: 0, // Spread radius
                    ),
                  ],
                  textCapitalization: TextCapitalization.none,
                  textInputAction: TextInputAction.done,
                  textFieldsBorder: false,
                  textstyle: TextStyles().robotoSize14Regular(color: ColorStyles().black!),
                  errorText: controller().isSubmit ? validateEmptyField(controller().downPaymentController.text) : null,
                  errorStyle: TextStyles().robotoSize14Regular(color: ColorStyles().errorRed!).copyWith(fontSize: 12.sp),
                ),
                _verticalSizeBox(),
                //Loan Amount
                TextInputField(
                  hintText: S.of(context).loanAmount,
                  hintStyle: TextStyles().robotoSize14Regular(color: ColorStyles().darkGrey!.withAlpha((0.3 * 255).round())),
                  controller: controller().loanAmountController,
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp(r'\s')), // Deny spaces
                  ],
                  onChanged: (value) {
                    validateEmptyField(controller().loanAmountController.text);
                  },
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  containerwidth: 312.w,
                  containerheight: 48.h,
                  containercolor: ColorStyles().white!,
                  borderRadius: BorderRadius.zero,
                  underline: false,
                  underlinecolor: ColorStyles().borderGray!,
                  contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
                  containerborder: Border(
                      bottom: BorderSide(color: ColorStyles().borderGray!,width: 1.0)
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: ColorStyles().softLavenderBlue!.withAlpha((0.4 * 255).round()), // Shadow color with 7% opacity
                      offset: Offset(12, 26), // X and Y offset
                      blurRadius: 50, // Blur radius
                      spreadRadius: 0, // Spread radius
                    ),
                  ],
                  textCapitalization: TextCapitalization.none,
                  textInputAction: TextInputAction.done,
                  textFieldsBorder: false,
                  textstyle: TextStyles().robotoSize14Regular(color: ColorStyles().black!),
                  errorText: controller().isSubmit ? validateEmptyField(controller().loanAmountController.text) : null,
                  errorStyle: TextStyles().robotoSize14Regular(color: ColorStyles().errorRed!).copyWith(fontSize: 12.sp),
                ),
                _verticalSizeBox(),
                //EMI Amount
                TextInputField(
                  hintText: S.of(context).emiAmount,
                  hintStyle: TextStyles().robotoSize14Regular(color: ColorStyles().darkGrey!.withAlpha((0.3 * 255).round())),
                  controller: controller().emiAmountController,
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp(r'\s')), // Deny spaces
                  ],
                  onChanged: (value) {
                    validateEmptyField(controller().emiAmountController.text);
                  },
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  containerwidth: 312.w,
                  containerheight: 48.h,
                  containercolor: ColorStyles().white!,
                  borderRadius: BorderRadius.zero,
                  underline: false,
                  underlinecolor: ColorStyles().borderGray!,
                  contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
                  containerborder: Border(
                      bottom: BorderSide(color: ColorStyles().borderGray!,width: 1.0)
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: ColorStyles().softLavenderBlue!.withAlpha((0.4 * 255).round()), // Shadow color with 7% opacity
                      offset: Offset(12, 26), // X and Y offset
                      blurRadius: 50, // Blur radius
                      spreadRadius: 0, // Spread radius
                    ),
                  ],
                  textCapitalization: TextCapitalization.none,
                  textInputAction: TextInputAction.done,
                  textFieldsBorder: false,
                  textstyle: TextStyles().robotoSize14Regular(color: ColorStyles().black!),
                  errorText: controller().isSubmit ? validateEmptyField(controller().emiAmountController.text) : null,
                  errorStyle: TextStyles().robotoSize14Regular(color: ColorStyles().errorRed!).copyWith(fontSize: 12.sp),
                ),
                _verticalSizeBox(),
                //Tenure
                TextInputField(
                  hintText: S.of(context).tenure,
                  hintStyle: TextStyles().robotoSize14Regular(color: ColorStyles().darkGrey!.withAlpha((0.3 * 255).round())),
                  controller: controller().tenureController,
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp(r'\s')), // Deny spaces
                  ],
                  onChanged: (value) {
                    validateEmptyField(controller().tenureController.text);
                  },
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  containerwidth: 312.w,
                  containerheight: 48.h,
                  containercolor: ColorStyles().white!,
                  borderRadius: BorderRadius.zero,
                  underline: false,
                  underlinecolor: ColorStyles().borderGray!,
                  contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
                  containerborder: Border(
                      bottom: BorderSide(color: ColorStyles().borderGray!,width: 1.0)
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: ColorStyles().softLavenderBlue!.withAlpha((0.4 * 255).round()), // Shadow color with 7% opacity
                      offset: Offset(12, 26), // X and Y offset
                      blurRadius: 50, // Blur radius
                      spreadRadius: 0, // Spread radius
                    ),
                  ],
                  textCapitalization: TextCapitalization.none,
                  textInputAction: TextInputAction.done,
                  textFieldsBorder: false,
                  textstyle: TextStyles().robotoSize14Regular(color: ColorStyles().black!),
                  errorText: controller().isSubmit ? validateEmptyField(controller().tenureController.text) : null,
                  errorStyle: TextStyles().robotoSize14Regular(color: ColorStyles().errorRed!).copyWith(fontSize: 12.sp),
                ),
                _verticalSizeBox(),
                //Payment Mode
                CommonDropdown(
                  onChangedsearch: (String? selectedName) {
                    if (selectedName != null) {
                      controller().onSelectPaymentMode(selectedName);
                    }
                  },
                  items: controller().selectPaymentModeList.map((lead) => lead).toList(),  // Show names in dropdown
                  // selectedItem: controller().selectLeadSourceList.firstWhere(
                  //       (lead) => lead.value == controller().selectLeadSource,
                  //   orElse: () => LeadFieldsModel(),
                  // ).name,
                  dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        border: InputBorder.none, // Removes border
                        enabledBorder: InputBorder.none, // Removes enabled border
                        focusedBorder: InputBorder.none, // Removes focused border
                      )
                  ),
                  clearButtonProps: ClearButtonProps(),
                  dropdownButtonProps: DropdownButtonProps(
                      icon: Icon(Icons.keyboard_arrow_down_outlined,size: 16.h,)
                  ),
                  enabled: true,
                  elevation: 0,
                  isExpanded: true,
                  containerwidth: 312.w,
                  containerheight: 48.h,
                  // containercolor: Color(0xffF9FAFB),
                  containercolor: ColorStyles().white!,
                  titleText: S.of(context).paymentMode,
                  textstyle: TextStyles().robotoSize14Regular(color: ColorStyles().darkGrey!.withAlpha((0.3*255).round())),
                  itemTextStyle: TextStyles().robotoSize14Regular(color: ColorStyles().cloudyGrey!),
                  selectItemTextStyle : TextStyles().robotoSize14Regular(color: ColorStyles().black!),
                  boxShadow: [
                    BoxShadow(
                      color: ColorStyles().softLavenderBlue!.withAlpha((0.4 * 255).round()), // Shadow color with 7% opacity
                      offset: Offset(0, 0), // X and Y offset
                      blurRadius: 5, // Blur radius
                      spreadRadius: 0, // Spread radius
                    ),
                  ],
                  border: Border(
                      bottom: BorderSide(color: ColorStyles().borderGray!,width: 0.5)
                  ),
                  errorText: controller().isSubmit ? validateDropDown(controller().selectPaymentMode) : null,
                  errorStyle: TextStyles().robotoSize14Regular(color: ColorStyles().errorRed!).copyWith(fontSize: 12.sp),
                ),
                _verticalSizeBox(),
                //Coupon Applied
                CommonDropdown(
                  onChangedsearch: (String? selectedName) {
                    if (selectedName != null) {
                      controller().onSelectPaymentMode(selectedName);
                    }
                  },
                  items: controller().selectCouponCodeAppliedList.map((lead) => lead).toList(),  // Show names in dropdown
                  // selectedItem: controller().selectLeadSourceList.firstWhere(
                  //       (lead) => lead.value == controller().selectLeadSource,
                  //   orElse: () => LeadFieldsModel(),
                  // ).name,
                  dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        border: InputBorder.none, // Removes border
                        enabledBorder: InputBorder.none, // Removes enabled border
                        focusedBorder: InputBorder.none, // Removes focused border
                      )
                  ),
                  clearButtonProps: ClearButtonProps(),
                  dropdownButtonProps: DropdownButtonProps(
                      icon: Icon(Icons.keyboard_arrow_down_outlined,size: 16.h,)
                  ),
                  enabled: true,
                  elevation: 0,
                  isExpanded: true,
                  containerwidth: 312.w,
                  containerheight: 48.h,
                  // containercolor: Color(0xffF9FAFB),
                  containercolor: ColorStyles().white!,
                  titleText: S.of(context).couponApplied,
                  textstyle: TextStyles().robotoSize14Regular(color: ColorStyles().darkGrey!.withAlpha((0.3*255).round())),
                  itemTextStyle: TextStyles().robotoSize14Regular(color: ColorStyles().cloudyGrey!),
                  selectItemTextStyle : TextStyles().robotoSize14Regular(color: ColorStyles().black!),
                  boxShadow: [
                    BoxShadow(
                      color: ColorStyles().softLavenderBlue!.withAlpha((0.4 * 255).round()), // Shadow color with 7% opacity
                      offset: Offset(0, 0), // X and Y offset
                      blurRadius: 5, // Blur radius
                      spreadRadius: 0, // Spread radius
                    ),
                  ],
                  border: Border(
                      bottom: BorderSide(color: ColorStyles().borderGray!,width: 0.5)
                  ),
                  errorText: controller().isSubmit ? validateDropDown(controller().selectCouponApplied) : null,
                  errorStyle: TextStyles().robotoSize14Regular(color: ColorStyles().errorRed!).copyWith(fontSize: 12.sp),
                ),
                _verticalSizeBox(),
                //Coupon Code
                CommonDropdown(
                  onChangedsearch: (String? selectedName) {
                    if (selectedName != null) {
                      controller().onSelectCouponCode(selectedName);
                    }
                  },
                  items: controller().selectCouponCodeList.map((lead) => lead).toList(),  // Show names in dropdown
                  // selectedItem: controller().selectLeadSourceList.firstWhere(
                  //       (lead) => lead.value == controller().selectLeadSource,
                  //   orElse: () => LeadFieldsModel(),
                  // ).name,
                  dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        border: InputBorder.none, // Removes border
                        enabledBorder: InputBorder.none, // Removes enabled border
                        focusedBorder: InputBorder.none, // Removes focused border
                      )
                  ),
                  clearButtonProps: ClearButtonProps(),
                  dropdownButtonProps: DropdownButtonProps(
                      icon: Icon(Icons.keyboard_arrow_down_outlined,size: 16.h,)
                  ),
                  enabled: true,
                  elevation: 0,
                  isExpanded: true,
                  containerwidth: 312.w,
                  containerheight: 48.h,
                  // containercolor: Color(0xffF9FAFB),
                  containercolor: ColorStyles().white!,
                  titleText: S.of(context).couponCode,
                  textstyle: TextStyles().robotoSize14Regular(color: ColorStyles().darkGrey!.withAlpha((0.3*255).round())),
                  itemTextStyle: TextStyles().robotoSize14Regular(color: ColorStyles().cloudyGrey!),
                  selectItemTextStyle : TextStyles().robotoSize14Regular(color: ColorStyles().black!),
                  boxShadow: [
                    BoxShadow(
                      color: ColorStyles().softLavenderBlue!.withAlpha((0.4 * 255).round()), // Shadow color with 7% opacity
                      offset: Offset(0, 0), // X and Y offset
                      blurRadius: 5, // Blur radius
                      spreadRadius: 0, // Spread radius
                    ),
                  ],
                  border: Border(
                      bottom: BorderSide(color: ColorStyles().borderGray!,width: 0.5)
                  ),
                  errorText: controller().isSubmit ? validateDropDown(controller().selectCouponCode) : null,
                  errorStyle: TextStyles().robotoSize14Regular(color: ColorStyles().errorRed!).copyWith(fontSize: 12.sp),
                ),
                _verticalSizeBox(),
                //Coupon Value
                TextInputField(
                  hintText: S.of(context).couponValue,
                  hintStyle: TextStyles().robotoSize14Regular(color: ColorStyles().darkGrey!.withAlpha((0.3 * 255).round())),
                  controller: null,
                  onChanged: (value) {
                  },
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  containerwidth: 312.w,
                  containerheight: 48.h,
                  containercolor: ColorStyles().white!,
                  borderRadius: BorderRadius.zero,
                  underline: false,
                  underlinecolor: ColorStyles().borderGray!,
                  contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
                  containerborder: Border(
                      bottom: BorderSide(color: ColorStyles().borderGray!,width: 1.0)
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: ColorStyles().softLavenderBlue!.withAlpha((0.4 * 255).round()), // Shadow color with 7% opacity
                      offset: Offset(12, 26), // X and Y offset
                      blurRadius: 50, // Blur radius
                      spreadRadius: 0, // Spread radius
                    ),
                  ],
                  textCapitalization: TextCapitalization.none,
                  textInputAction: TextInputAction.done,
                  textFieldsBorder: false,
                  textstyle: TextStyles().robotoSize14Regular(color: ColorStyles().black!),
                  // errorText: controller().isSubmit ? validatePhone(controller().downPaymentController.text) : null,
                  // errorStyle: TextStyles().robotoSize14Regular(color: ColorStyles().errorRed!).copyWith(fontSize: 12.sp),
                ),
                _verticalSizeBox(),
                //Payable DP
                TextInputField(
                  hintText: "${S.of(context).payableDP}(${S.of(context).finalKey})",
                  hintStyle: TextStyles().robotoSize14Regular(color: ColorStyles().darkGrey!.withAlpha((0.3 * 255).round())),
                  controller: null,
                  onChanged: (value) {
                  },
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  containerwidth: 312.w,
                  containerheight: 48.h,
                  containercolor: ColorStyles().white!,
                  borderRadius: BorderRadius.zero,
                  underline: false,
                  underlinecolor: ColorStyles().borderGray!,
                  contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
                  containerborder: Border(
                      bottom: BorderSide(color: ColorStyles().borderGray!,width: 1.0)
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: ColorStyles().softLavenderBlue!.withAlpha((0.4 * 255).round()), // Shadow color with 7% opacity
                      offset: Offset(12, 26), // X and Y offset
                      blurRadius: 50, // Blur radius
                      spreadRadius: 0, // Spread radius
                    ),
                  ],
                  textCapitalization: TextCapitalization.none,
                  textInputAction: TextInputAction.done,
                  textFieldsBorder: false,
                  textstyle: TextStyles().robotoSize14Regular(color: ColorStyles().black!),
                  // errorText: controller().isSubmit ? validatePhone(controller().downPaymentController.text) : null,
                  // errorStyle: TextStyles().robotoSize14Regular(color: ColorStyles().errorRed!).copyWith(fontSize: 12.sp),
                ),
                _verticalSizeBox(),
                //Payable EMI
                TextInputField(
                  hintText: "${S.of(context).payableEmi}(${S.of(context).finalKey})",
                  hintStyle: TextStyles().robotoSize14Regular(color: ColorStyles().darkGrey!.withAlpha((0.3 * 255).round())),
                  controller: null,
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  containerwidth: 312.w,
                  containerheight: 48.h,
                  containercolor: ColorStyles().white!,
                  borderRadius: BorderRadius.zero,
                  underline: false,
                  underlinecolor: ColorStyles().borderGray!,
                  contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
                  containerborder: Border(
                      bottom: BorderSide(color: ColorStyles().borderGray!,width: 1.0)
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: ColorStyles().softLavenderBlue!.withAlpha((0.4 * 255).round()), // Shadow color with 7% opacity
                      offset: Offset(12, 26), // X and Y offset
                      blurRadius: 50, // Blur radius
                      spreadRadius: 0, // Spread radius
                    ),
                  ],
                  textCapitalization: TextCapitalization.none,
                  textInputAction: TextInputAction.done,
                  textFieldsBorder: false,
                  textstyle: TextStyles().robotoSize14Regular(color: ColorStyles().black!),
                  // errorText: controller().isSubmit ? validatePhone(controller().downPaymentController.text) : null,
                  // errorStyle: TextStyles().robotoSize14Regular(color: ColorStyles().errorRed!).copyWith(fontSize: 12.sp),
                ),
                _verticalSizeBox(),
                //Digital Receipt
                TextInputField(
                  hintText: S.of(context).digitalReceipt,
                  hintStyle: TextStyles().robotoSize14Regular(color: ColorStyles().darkGrey!.withAlpha((0.3 * 255).round())),
                  controller: null,
                  keyboardType: null,
                  containerwidth: 312.w,
                  containerheight: 48.h,
                  containercolor: ColorStyles().white!,
                  borderRadius: BorderRadius.zero,
                  underline: false,
                  underlinecolor: ColorStyles().borderGray!,
                  contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
                  containerborder: Border(
                      bottom: BorderSide(color: ColorStyles().borderGray!,width: 1.0)
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: ColorStyles().softLavenderBlue!.withAlpha((0.4 * 255).round()), // Shadow color with 7% opacity
                      offset: Offset(12, 26), // X and Y offset
                      blurRadius: 50, // Blur radius
                      spreadRadius: 0, // Spread radius
                    ),
                  ],
                  textCapitalization: TextCapitalization.none,
                  textInputAction: TextInputAction.done,
                  textFieldsBorder: false,
                  textstyle: TextStyles().robotoSize14Regular(color: ColorStyles().black!),
                  // errorText: controller().isSubmit ? validatePhone(controller().downPaymentController.text) : null,
                  // errorStyle: TextStyles().robotoSize14Regular(color: ColorStyles().errorRed!).copyWith(fontSize: 12.sp),
                ),
                _verticalSizeBox(),
                //Transaction ID
                TextInputField(
                  hintText: S.of(context).transactionID,
                  hintStyle: TextStyles().robotoSize14Regular(color: ColorStyles().darkGrey!.withAlpha((0.3 * 255).round())),
                  controller: null,
                  onChanged: (value) {
                  },
                  keyboardType: TextInputType.number,
                  maxLength: 20,
                  containerwidth: 312.w,
                  containerheight: 48.h,
                  containercolor: ColorStyles().white!,
                  borderRadius: BorderRadius.zero,
                  underline: false,
                  underlinecolor: ColorStyles().borderGray!,
                  contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
                  containerborder: Border(
                      bottom: BorderSide(color: ColorStyles().borderGray!,width: 1.0)
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: ColorStyles().softLavenderBlue!.withAlpha((0.4 * 255).round()), // Shadow color with 7% opacity
                      offset: Offset(12, 26), // X and Y offset
                      blurRadius: 50, // Blur radius
                      spreadRadius: 0, // Spread radius
                    ),
                  ],
                  textCapitalization: TextCapitalization.none,
                  textInputAction: TextInputAction.done,
                  textFieldsBorder: false,
                  textstyle: TextStyles().robotoSize14Regular(color: ColorStyles().black!),
                  // errorText: controller().isSubmit ? validatePhone(controller().downPaymentController.text) : null,
                  // errorStyle: TextStyles().robotoSize14Regular(color: ColorStyles().errorRed!).copyWith(fontSize: 12.sp),
                ),
                _verticalSizeBox(),
                _verticalSizeBox(),
                Row(
                  children: [
                    Expanded(
                      child: smallButton(
                          btnText: S.of(context).cancel,
                          bgColor: ColorStyles().white!,
                          borderRadius: BorderRadius.circular(55.r),
                          onTap: () {
                            Navigator.pop(context);
                          },
                          btnTextColor: ColorStyles().orangePink!
                      ),
                    ),
                    SizedBox(width: 36.w,),
                    Expanded(
                      child: smallButton(
                        btnText: S.of(context).save,
                        bgColor: ColorStyles().orangePink!,
                        btnTextColor: ColorStyles().white!,
                        onTap: () {
                          if(!controller().isSubmit){
                            controller().changeSubmitValue(true);
                          }
                          // FocusScope.of(context).unfocus();
                          controller().onSaveButtonTap();
                        },
                      ),
                    ),
                  ],
                ),
                _verticalSizeBox(),
              ],
            ),
          ),
        ));
  }

  Widget smallButton ({required String btnText,required Color btnTextColor,required Color bgColor, Color? borderColor,EdgeInsetsGeometry? padding,BorderRadiusGeometry? borderRadius,void Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.0),
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: borderRadius ??BorderRadius.circular(15.r),
            border: Border.all(color: ColorStyles().orangePink!)
        ),
        child: Text(btnText,textAlign: TextAlign.center,style: TextStyles().robotoSize14Regular(color: btnTextColor),),
      ),
    );
  }

  Widget _verticalSizeBox () {
    return SizedBox(height: 12.h,);
  }

}
