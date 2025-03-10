import 'package:digitifyze/model/response/lead_field_model.dart';
import 'package:digitifyze/ui/screens/tab/home/lead_screen/add_lead/add_lead_screen_controller.dart';
import 'package:digitifyze/ui/widgets/common_widgets/common_dropdown.dart';
import 'package:digitifyze/ui/widgets/common_widgets/text_input_field.dart';
import 'package:digitifyze/ui/widgets/validate.dart';
import 'package:digitifyze/utils/dropdown/src/properties/clear_button_props.dart';
import 'package:digitifyze/utils/dropdown/src/properties/dropdown_button_props.dart';
import 'package:digitifyze/utils/dropdown/src/properties/dropdown_decorator_props.dart';
import 'package:digitifyze/utils/import_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddLeadBodyScreen extends ConsumerWidget {
  const AddLeadBodyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final asyncState = ref.watch(addLeadScreenControllerProvider);
    controller() => ref.read(addLeadScreenControllerProvider.notifier);
    return Positioned(
        top: 90.h,
        left: 13.5.w,
        right: 13.5.w,
        bottom: 16.h,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 16.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: ColorStyles().white!),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonDropdown(
                  onChangedsearch: (String? selectedName) {
                    if (selectedName != null) {
                      controller().onSelectLeadSource(selectedName);
                    }
                  },
                  items: controller()
                      .selectLeadSourceList
                      .map((lead) => lead.name ?? "")
                      .toList(), // Show names in dropdown
                  selectedItem: controller()
                      .selectLeadSourceList
                      .firstWhere(
                        (lead) => lead.value == controller().selectLeadSource,
                        orElse: () => LeadFieldsModel(),
                      )
                      .name,
                  dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                    border: InputBorder.none, // Removes border
                    enabledBorder: InputBorder.none, // Removes enabled border
                    focusedBorder: InputBorder.none, // Removes focused border
                  )),
                  clearButtonProps: ClearButtonProps(),
                  dropdownButtonProps: DropdownButtonProps(
                      icon: Icon(
                    Icons.keyboard_arrow_down_outlined,
                    size: 16.h,
                  )),
                  enabled: true,
                  elevation: 0,
                  isExpanded: true,
                  containerwidth: 312.w,
                  containerheight: 48.h,
                  // containercolor: Color(0xffF9FAFB),
                  containercolor: ColorStyles().white!,
                  titleText: S.of(context).leadSource,
                  textstyle: TextStyles().robotoSize14Regular(
                      color: ColorStyles()
                          .darkGrey!
                          .withAlpha((0.3 * 255).round())),
                  itemTextStyle: TextStyles()
                      .robotoSize14Regular(color: ColorStyles().cloudyGrey!),
                  selectItemTextStyle: TextStyles()
                      .robotoSize14Regular(color: ColorStyles().black!),
                  boxShadow: [
                    BoxShadow(
                      color: ColorStyles().softLavenderBlue!.withAlpha(
                          (0.4 * 255).round()), // Shadow color with 7% opacity
                      offset: Offset(0, 0), // X and Y offset
                      blurRadius: 5, // Blur radius
                      spreadRadius: 0, // Spread radius
                    ),
                  ],
                  border: Border(
                      bottom: BorderSide(
                          color: ColorStyles().borderGray!, width: 0.5)),
                  errorText: controller().isSubmit
                      ? validateLeadSource(controller().selectLeadSource)
                      : null,
                  errorStyle: TextStyles()
                      .robotoSize14Regular(color: ColorStyles().errorRed!)
                      .copyWith(fontSize: 12.sp),
                ),
                _verticalSizeBox(),
                // TextInputField(
                //   hintText: S.of(context).referralInfluencerID,
                //   hintStyle: TextStyles().robotoSize14Regular(color: ColorStyles().darkGrey!.withAlpha((0.3*255).round())),
                //   controller: TextEditingController(text: "RVD02_ASHISH"),
                //   readonly: true,
                //   maxLength: 50,
                //   onChanged: (value) {
                //     // validateFirstName(controller().firstNameController.text);
                //      ;
                //   },
                //   keyboardType: TextInputType.text,
                //   containerwidth: 312.w,
                //   containerheight: 48.h,
                //   containercolor: ColorStyles().white!,
                //   borderRadius: BorderRadius.zero,
                //   underline: false,
                //   underlinecolor: ColorStyles().borderGray!,
                //   contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
                //   containerborder: Border(
                //       bottom: BorderSide(color: ColorStyles().borderGray!,width: 1.0)
                //   ),
                //   boxShadow: [
                //     BoxShadow(
                //       color: ColorStyles().softLavenderBlue!.withAlpha((0.4 * 255).round()), // Shadow color with 7% opacity
                //       offset: Offset(12, 26), // X and Y offset
                //       blurRadius: 50, // Blur radius
                //       spreadRadius: 0, // Spread radius
                //     ),
                //   ],
                //   textCapitalization: TextCapitalization.none,
                //   textInputAction: TextInputAction.done,
                //   textFieldsBorder: false,
                //   textstyle: TextStyles().robotoSize14Regular(color: ColorStyles().black!),
                //   // errorText: controller().isSubmit ? validateFirstName(controller().firstNameController.text) : null,
                //   // errorStyle: TextStyles().robotoSize14Regular(color: ColorStyles().errorRed!).copyWith(fontSize: 12.sp),
                // ),
                // _verticalSizeBox(),
                Visibility(
                    visible: controller().selectLeadSource == "3" || controller().selectLeadSource == "4" ? true : false,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextInputField(
                          hintText: controller().selectLeadSource == "3" ? S.of(context).influencerID :  S.of(context).referralID,
                          hintStyle: TextStyles().robotoSize14Regular(
                              color: ColorStyles()
                                  .darkGrey!
                                  .withAlpha((0.3 * 255).round())),
                          controller: controller().influencerReferralIdController,
                          maxLength: 50,
                          onChanged: (value) {
                           controller().onChangeInfluencerReferralId();
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
                              bottom: BorderSide(
                                  color: ColorStyles().borderGray!, width: 1.0)),
                          boxShadow: [
                            BoxShadow(
                              color: ColorStyles().softLavenderBlue!.withAlpha(
                                  (0.4 * 255).round()), // Shadow color with 7% opacity
                              offset: Offset(12, 26), // X and Y offset
                              blurRadius: 50, // Blur radius
                              spreadRadius: 0, // Spread radius
                            ),
                          ],
                          textCapitalization: TextCapitalization.characters,
                          textInputAction: TextInputAction.done,
                          textFieldsBorder: false,
                          textstyle: TextStyles()
                              .robotoSize14Regular(color: ColorStyles().black!),
                          errorText: controller().isSubmit ? validateInfluencerReferralId(controller().influencerReferralIdController.text,isInfluencer:controller().selectLeadSource == "3" ?true:false) : null,
                          errorStyle: TextStyles().robotoSize14Regular(color: ColorStyles().errorRed!).copyWith(fontSize: 12.sp),
                        ),
                        _verticalSizeBox(),
                      ],
                    )),
                TextInputField(
                  focusNode: controller().firstNameFocus,
                  hintText: S.of(context).firstName,
                  hintStyle: TextStyles().robotoSize14Regular(
                      color: ColorStyles()
                          .darkGrey!
                          .withAlpha((0.3 * 255).round())),
                  controller: controller().firstNameController,
                  maxLength: 50,
                  inputFormatters: [
                    // Custom input formatter to remove leading spaces
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^[^\s].*|[^\s].*')),
                  ],
                  onChanged: (value) {
                    controller().onChangeFirstName();
                    // validateFirstName(controller().firstNameController.text);
                    // setState(() {
                    //
                    // });
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
                      bottom: BorderSide(
                          color: ColorStyles().borderGray!, width: 1.0)),
                  boxShadow: [
                    BoxShadow(
                      color: ColorStyles().softLavenderBlue!.withAlpha(
                          (0.4 * 255).round()), // Shadow color with 7% opacity
                      offset: Offset(12, 26), // X and Y offset
                      blurRadius: 50, // Blur radius
                      spreadRadius: 0, // Spread radius
                    ),
                  ],
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.done,
                  textFieldsBorder: false,
                  textstyle: TextStyles()
                      .robotoSize14Regular(color: ColorStyles().black!),
                  errorText: controller().isSubmit
                      ? validateFirstName(controller().firstNameController.text)
                      : null,
                  errorStyle: TextStyles()
                      .robotoSize14Regular(color: ColorStyles().errorRed!)
                      .copyWith(fontSize: 12.sp),
                ),
                _verticalSizeBox(),
                TextInputField(
                  hintText: S.of(context).lastName,
                  hintStyle: TextStyles().robotoSize14Regular(
                      color: ColorStyles()
                          .darkGrey!
                          .withAlpha((0.3 * 255).round())),
                  controller: controller().lastNameController,
                  maxLength: 50,
                  inputFormatters: [
                    // Custom input formatter to remove leading spaces
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^[^\s].*|[^\s].*')),
                  ],
                  onChanged: (value) {
                    controller().onChangeLastName();
                    // validateLastName(controller().lastNameController.text);
                    // setState(() {
                    //
                    // });
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
                      bottom: BorderSide(
                          color: ColorStyles().borderGray!, width: 1.0)),
                  boxShadow: [
                    BoxShadow(
                      color: ColorStyles().softLavenderBlue!.withAlpha(
                          (0.4 * 255).round()), // Shadow color with 7% opacity
                      offset: Offset(12, 26), // X and Y offset
                      blurRadius: 50, // Blur radius
                      spreadRadius: 0, // Spread radius
                    ),
                  ],
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.done,
                  textFieldsBorder: false,
                  textstyle: TextStyles()
                      .robotoSize14Regular(color: ColorStyles().black!),
                  errorText: controller().isSubmit
                      ? validateLastName(
                          controller().lastNameController.text.trim())
                      : null,
                  errorStyle: TextStyles()
                      .robotoSize14Regular(color: ColorStyles().errorRed!)
                      .copyWith(fontSize: 12.sp),
                ),
                _verticalSizeBox(),
                // TextInputField(
                //   hintText: S.of(context).fatherName,
                //   hintStyle: TextStyles().robotoSize14Regular(color: ColorStyles().darkGrey!.withAlpha((0.3*255).round())),
                //   controller: controller().fatherNameController,
                //   maxLength: 50,
                //   inputFormatters: [
                //     // Custom input formatter to remove leading spaces
                //     FilteringTextInputFormatter.allow(RegExp(r'^[^\s].*|[^\s].*')),
                //   ],
                //   onChanged: (value) {
                //     validateFatherName(controller().fatherNameController.text);
                //     setState(() {
                //
                //     });
                //   },
                //   keyboardType: TextInputType.text,
                //   containerwidth: 312.w,
                //   containerheight: 48.h,
                //   containercolor: ColorStyles().white!,
                //   borderRadius: BorderRadius.zero,
                //   underline: false,
                //   underlinecolor: ColorStyles().borderGray!,
                //   contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
                //   containerborder: Border(
                //       bottom: BorderSide(color: ColorStyles().borderGray!,width: 1.0)
                //   ),
                //   boxShadow: [
                //     BoxShadow(
                //       color: ColorStyles().softLavenderBlue!.withAlpha((0.4 * 255).round()),// Shadow color with 7% opacity
                //       offset: Offset(12, 26), // X and Y offset
                //       blurRadius: 50, // Blur radius
                //       spreadRadius: 0, // Spread radius
                //     ),
                //   ],
                //   textCapitalization: TextCapitalization.words,
                //   textInputAction: TextInputAction.done,
                //   textFieldsBorder: false,
                //   textstyle: TextStyles().robotoSize14Regular(color: ColorStyles().black!),
                //   errorText: controller().isSubmit ? validateFatherName(controller().fatherNameController.text.trim()) : null,
                //   errorStyle: TextStyles().robotoSize14Regular(color: ColorStyles().errorRed!).copyWith(fontSize: 12.sp),
                // ),
                // _verticalSizeBox(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: TextInputField(
                      hintText: S.of(context).mobileNo,
                      hintStyle: TextStyles().robotoSize14Regular(
                          color: ColorStyles()
                              .darkGrey!
                              .withAlpha((0.3 * 255).round())),
                      controller: controller().mobileNoController,
                      focusNode: controller().mobileNoFocus,
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(
                            RegExp(r'\s')), // Deny spaces
                      ],
                      onChanged: (value) {
                        controller().onChangeMobileNo();
                        // setState(() {
                        //
                        // });
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
                          bottom: BorderSide(
                              color: ColorStyles().borderGray!, width: 1.0)),
                      boxShadow: [
                        BoxShadow(
                          color: ColorStyles().softLavenderBlue!.withAlpha(
                              (0.4 * 255)
                                  .round()), // Shadow color with 7% opacity
                          offset: Offset(12, 26), // X and Y offset
                          blurRadius: 50, // Blur radius
                          spreadRadius: 0, // Spread radius
                        ),
                      ],
                      textCapitalization: TextCapitalization.none,
                      textInputAction: TextInputAction.done,
                      textFieldsBorder: false,
                      textstyle: TextStyles()
                          .robotoSize14Regular(color: ColorStyles().black!),
                      errorText: controller().isSubmit
                          ? validatePhone(controller().mobileNoController.text)
                          : null,
                      errorStyle: TextStyles()
                          .robotoSize14Regular(color: ColorStyles().errorRed!)
                          .copyWith(fontSize: 12.sp),
                    )),
                    _horizontalSizeBox(),
                    Expanded(
                        child: TextInputField(
                      hintText: S.of(context).alternateNo,
                      hintStyle: TextStyles().robotoSize14Regular(
                          color: ColorStyles()
                              .darkGrey!
                              .withAlpha((0.3 * 255).round())),
                      controller: controller().alternateNoController,
                      focusNode: controller().alternateNoFocus,
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(
                            RegExp(r'\s')), // Deny spaces
                      ],
                      onChanged: (value) {
                        if(controller().alternateNoController.text.length==10){
                          controller().alternateNoFocus.unfocus();
                        }
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
                          bottom: BorderSide(
                              color: ColorStyles().borderGray!, width: 1.0)),
                      boxShadow: [
                        BoxShadow(
                          color: ColorStyles().softLavenderBlue!.withAlpha(
                              (0.4 * 255)
                                  .round()), // Shadow color with 7% opacity
                          offset: Offset(12, 26), // X and Y offset
                          blurRadius: 50, // Blur radius
                          spreadRadius: 0, // Spread radius
                        ),
                      ],
                      textCapitalization: TextCapitalization.none,
                      textInputAction: TextInputAction.done,
                      textFieldsBorder: false,
                      textstyle: TextStyles()
                          .robotoSize14Regular(color: ColorStyles().black!),
                      // errorText: controller().isSubmit ? validatePhone(controller().alternateNoController.text) : null,
                      // errorStyle: TextStyles().robotoSize14Regular(color: ColorStyles().errorRed!).copyWith(fontSize: 12.sp),
                    )),
                  ],
                ),
                _verticalSizeBox(),
                CommonDropdown(
                  onChangedsearch: (String? selectedName) {
                    if (selectedName != null) {
                      controller().onSelectGender(selectedName);
                    }
                  },
                  items: controller()
                      .selectGenderList
                      .map((lead) => lead.name ?? "")
                      .toList(), // Show names in dropdown
                  selectedItem: controller()
                      .selectGenderList
                      .firstWhere(
                        (lead) => lead.value == controller().selectGender,
                        orElse: () => LeadFieldsModel(),
                      )
                      .name,

                  dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                    border: InputBorder.none, // Removes border
                    enabledBorder: InputBorder.none, // Removes enabled border
                    focusedBorder: InputBorder.none, // Removes focused border
                  )),
                  clearButtonProps: ClearButtonProps(),
                  dropdownButtonProps: DropdownButtonProps(
                      icon: Icon(
                    Icons.keyboard_arrow_down_outlined,
                    size: 16.h,
                  )),
                  enabled: true,
                  elevation: 0,
                  isExpanded: true,
                  containerwidth: 312.w,
                  containerheight: 48.h,
                  // containercolor: Color(0xffF9FAFB),
                  containercolor: ColorStyles().white!,
                  titleText: S.of(context).gender,
                  textstyle: TextStyles().robotoSize14Regular(
                      color: ColorStyles()
                          .darkGrey!
                          .withAlpha((0.3 * 255).round())),
                  itemTextStyle: TextStyles()
                      .robotoSize14Regular(color: ColorStyles().cloudyGrey!),
                  selectItemTextStyle: TextStyles()
                      .robotoSize14Regular(color: ColorStyles().black!),
                  boxShadow: [
                    BoxShadow(
                      color: ColorStyles().softLavenderBlue!.withAlpha(
                          (0.4 * 255).round()), // Shadow color with 7% opacity
                      offset: Offset(0, 0), // X and Y offset
                      blurRadius: 5, // Blur radius
                      spreadRadius: 0, // Spread radius
                    ),
                  ],
                  border: Border(
                      bottom: BorderSide(
                          color: ColorStyles().borderGray!, width: 0.5)),
                  errorText: controller().isSubmit
                      ? validateLeadSource(controller().selectGender)
                      : null,
                  errorStyle: TextStyles()
                      .robotoSize14Regular(color: ColorStyles().errorRed!)
                      .copyWith(fontSize: 12.sp),
                ),
                _verticalSizeBox(),
                TextInputField(
                  hintText: S.of(context).address,
                  hintStyle: TextStyles().robotoSize14Regular(
                      color: ColorStyles()
                          .darkGrey!
                          .withAlpha((0.3 * 255).round())),
                  controller: controller().addressController,
                  onChanged: (value) {
                    controller().onChangeAddress();
                    // setState(() {
                    //
                    // });
                  },
                  maxLines: 5,
                  keyboardType: TextInputType.text,
                  containerwidth: 312.w,
                  containerheight: 86.h,
                  containercolor: ColorStyles().white!,
                  borderRadius: BorderRadius.zero,
                  underline: false,
                  underlinecolor: ColorStyles().borderGray!,
                  contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
                  containerborder: Border(
                      bottom: BorderSide(
                          color: ColorStyles().borderGray!, width: 1.0)),
                  boxShadow: [
                    BoxShadow(
                      color: ColorStyles().softLavenderBlue!.withAlpha(
                          (0.4 * 255).round()), // Shadow color with 7% opacity
                      offset: Offset(12, 26), // X and Y offset
                      blurRadius: 50, // Blur radius
                      spreadRadius: 0, // Spread radius
                    ),
                  ],
                  textCapitalization: TextCapitalization.none,
                  textInputAction: TextInputAction.next,
                  textFieldsBorder: false,
                  errorText: controller().isSubmit
                      ? validateAddress(controller().addressController.text)
                      : null,
                  errorStyle: TextStyles()
                      .robotoSize14Regular(color: ColorStyles().errorRed!)
                      .copyWith(fontSize: 12.sp),
                ),
                _verticalSizeBox(),
                TextInputField(
                  hintText: S.of(context).landMark,
                  hintStyle: TextStyles().robotoSize14Regular(
                    color:
                        ColorStyles().darkGrey!.withAlpha((0.3 * 255).round()),
                  ),
                  controller: controller().landMarkController,
                  // onChanged: (value) {
                  //   validateFirstName(controller().firstNameController.text);
                  //   setState(() {
                  //
                  //   });
                  // },
                  keyboardType: TextInputType.text,
                  containerwidth: 312.w,
                  containerheight: 48.h,
                  containercolor: ColorStyles().white!,
                  borderRadius: BorderRadius.zero,
                  underline: false,
                  underlinecolor: ColorStyles().borderGray!,
                  contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
                  containerborder: Border(
                      bottom: BorderSide(
                          color: ColorStyles().borderGray!, width: 1.0)),
                  boxShadow: [
                    BoxShadow(
                      color: ColorStyles().softLavenderBlue!.withAlpha(
                          (0.4 * 255).round()), // Shadow color with 7% opacity
                      offset: Offset(12, 26), // X and Y offset
                      blurRadius: 50, // Blur radius
                      spreadRadius: 0, // Spread radius
                    ),
                  ],
                  textCapitalization: TextCapitalization.none,
                  textInputAction: TextInputAction.next,
                  textFieldsBorder: false,
                ),
                _verticalSizeBox(),
                // TextInputField(
                //   hintText: S.of(context).pinCode,
                //   hintStyle: TextStyles().robotoSize14Regular(color: ColorStyles().darkGrey!.withAlpha((0.3 * 255).round())),
                //   controller: controller().pinCodeController,
                //   onChanged: (value) {
                //     validatePinCode(controller().pinCodeController.text);
                //     setState(() {
                //
                //     });
                //   },
                //   keyboardType: TextInputType.number,
                //   containerwidth: 312.w,
                //   containerheight: 48.h,
                //   containercolor: ColorStyles().white!,
                //   borderRadius: BorderRadius.zero,
                //   underline: false,
                //   underlinecolor: ColorStyles().borderGray!,
                //   contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
                //   containerborder: Border(
                //       bottom: BorderSide(color: ColorStyles().borderGray!,width: 1.0)
                //   ),
                //   boxShadow: [
                //     BoxShadow(
                //       color: ColorStyles().softLavenderBlue!.withAlpha((0.4 * 255).round()), // Shadow color with 7% opacity
                //       offset: Offset(12, 26), // X and Y offset
                //       blurRadius: 50, // Blur radius
                //       spreadRadius: 0, // Spread radius
                //     ),
                //   ],
                //   textCapitalization: TextCapitalization.none,
                //   textInputAction: TextInputAction.next, textFieldsBorder: false,
                //   errorText: controller().isSubmit ? validatePinCode(controller().pinCodeController.text) : null,
                //   errorStyle: TextStyles().robotoSize14Regular(color: ColorStyles().errorRed!).copyWith(fontSize: 12.sp),
                // ),
                TextInputField(
                  hintText: S.of(context).pinCode,
                  hintStyle: TextStyles().robotoSize14Regular(
                      color: ColorStyles()
                          .darkGrey!
                          .withAlpha((0.3 * 255).round())),
                  controller: controller().pinCodeController,
                  focusNode: controller().pinCodeFocus,
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(
                        RegExp(r'\s')), // Deny spaces
                  ],
                  onChanged: (value) {
                    controller().onChangePinCode();
                    // setState(() {
                    //
                    // });
                  },
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  containerwidth: 312.w,
                  containerheight: 48.h,
                  containercolor: ColorStyles().white!,
                  borderRadius: BorderRadius.zero,
                  underline: false,
                  underlinecolor: ColorStyles().borderGray!,
                  contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
                  containerborder: Border(
                      bottom: BorderSide(
                          color: ColorStyles().borderGray!, width: 1.0)),
                  boxShadow: [
                    BoxShadow(
                      color: ColorStyles().softLavenderBlue!.withAlpha(
                          (0.4 * 255)
                              .round()), // Shadow color with 7% opacity
                      offset: Offset(12, 26), // X and Y offset
                      blurRadius: 50, // Blur radius
                      spreadRadius: 0, // Spread radius
                    ),
                  ],
                  textCapitalization: TextCapitalization.none,
                  textInputAction: TextInputAction.done,
                  textFieldsBorder: false,
                  textstyle: TextStyles()
                      .robotoSize14Regular(color: ColorStyles().black!),
                  errorText: controller().isSubmit
                      ? validatePinCode(controller().pinCodeController.text)
                      : null,
                  errorStyle: TextStyles()
                      .robotoSize14Regular(color: ColorStyles().errorRed!)
                      .copyWith(fontSize: 12.sp),
                ),
                _verticalSizeBox(),
                CommonDropdown(
                  onChangedsearch: (String? selectedName) {
                    if (selectedName != null) {
                      controller().onSelectState(selectedName);
                    }
                  },
                  items: controller()
                      .selectStateList
                      .map((lead) => lead.name ?? "")
                      .toList(), // Show names in dropdown
                  selectedItem: controller()
                      .selectStateList
                      .firstWhere(
                        (lead) => lead.value == controller().selectState,
                        orElse: () => LeadFieldsModel(),
                      )
                      .name,

                  dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                    border: InputBorder.none, // Removes border
                    enabledBorder: InputBorder.none, // Removes enabled border
                    focusedBorder: InputBorder.none, // Removes focused border
                  )),
                  clearButtonProps: ClearButtonProps(),
                  dropdownButtonProps: DropdownButtonProps(
                      icon: Icon(
                    Icons.keyboard_arrow_down_outlined,
                    size: 16.h,
                  )),
                  enabled: true,
                  elevation: 0,
                  isExpanded: true,
                  containerwidth: 312.w,
                  containerheight: 48.h,
                  // containercolor: Color(0xffF9FAFB),
                  containercolor: ColorStyles().white!,
                  titleText: S.of(context).state,
                  textstyle: TextStyles().robotoSize14Regular(
                      color: ColorStyles()
                          .darkGrey!
                          .withAlpha((0.3 * 255).round())),
                  itemTextStyle: TextStyles()
                      .robotoSize14Regular(color: ColorStyles().cloudyGrey!),
                  selectItemTextStyle: TextStyles()
                      .robotoSize14Regular(color: ColorStyles().black!),
                  boxShadow: [
                    BoxShadow(
                      color: ColorStyles().softLavenderBlue!.withAlpha(
                          (0.4 * 255).round()), // Shadow color with 7% opacity
                      offset: Offset(0, 0), // X and Y offset
                      blurRadius: 5, // Blur radius
                      spreadRadius: 0, // Spread radius
                    ),
                  ],
                  border: Border(
                      bottom: BorderSide(
                          color: ColorStyles().borderGray!, width: 0.5)),
                  errorText: controller().isSubmit
                      ? validateLeadSource(controller().selectState)
                      : null,
                  errorStyle: TextStyles()
                      .robotoSize14Regular(color: ColorStyles().errorRed!)
                      .copyWith(fontSize: 12.sp),
                ),
                _verticalSizeBox(),
                CommonDropdown(
                  onChangedsearch: (String? selectedName) {
                    if (selectedName != null) {
                      controller().onSelectCity(selectedName);
                    }
                  },
                  items: controller()
                      .selectCityList
                      .map((lead) => lead.name ?? "")
                      .toList(), // Show names in dropdown
                  selectedItem: controller()
                      .selectCityList
                      .firstWhere(
                        (lead) => lead.value == controller().selectCity,
                        orElse: () => LeadFieldsModel(),
                      )
                      .name,

                  dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                    border: InputBorder.none, // Removes border
                    enabledBorder: InputBorder.none, // Removes enabled border
                    focusedBorder: InputBorder.none, // Removes focused border
                  )),
                  clearButtonProps: ClearButtonProps(),
                  dropdownButtonProps: DropdownButtonProps(
                      icon: Icon(
                    Icons.keyboard_arrow_down_outlined,
                    size: 16.h,
                  )),
                  enabled: true,
                  elevation: 0,
                  isExpanded: true,
                  containerwidth: 312.w,
                  containerheight: 48.h,
                  // containercolor: Color(0xffF9FAFB),
                  containercolor: ColorStyles().white!,
                  titleText: S.of(context).city,
                  textstyle: TextStyles().robotoSize14Regular(
                      color: ColorStyles()
                          .darkGrey!
                          .withAlpha((0.3 * 255).round())),
                  itemTextStyle: TextStyles()
                      .robotoSize14Regular(color: ColorStyles().cloudyGrey!),
                  selectItemTextStyle: TextStyles()
                      .robotoSize14Regular(color: ColorStyles().black!),
                  boxShadow: [
                    BoxShadow(
                      color: ColorStyles().softLavenderBlue!.withAlpha(
                          (0.4 * 255).round()), // Shadow color with 7% opacity
                      offset: Offset(0, 0), // X and Y offset
                      blurRadius: 5, // Blur radius
                      spreadRadius: 0, // Spread radius
                    ),
                  ],
                  border: Border(
                      bottom: BorderSide(
                          color: ColorStyles().borderGray!, width: 0.5)),
                  errorText: controller().isSubmit
                      ? validateLeadSource(controller().selectCity)
                      : null,
                  errorStyle: TextStyles()
                      .robotoSize14Regular(color: ColorStyles().errorRed!)
                      .copyWith(fontSize: 12.sp),
                ),
                _verticalSizeBox(),
                CommonDropdown(
                  onChangedsearch: (String? selectedName) {
                    if (selectedName != null) {
                      controller().onSelectCluster(selectedName);
                    }
                  },
                  items: controller()
                      .selectClusterList
                      .map((lead) => lead.name ?? "")
                      .toList(), // Show names in dropdown
                  selectedItem: controller()
                      .selectClusterList
                      .firstWhere(
                        (lead) => lead.value == controller().selectCluster,
                        orElse: () => LeadFieldsModel(),
                      )
                      .name,

                  dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                    border: InputBorder.none, // Removes border
                    enabledBorder: InputBorder.none, // Removes enabled border
                    focusedBorder: InputBorder.none, // Removes focused border
                  )),
                  clearButtonProps: ClearButtonProps(),
                  dropdownButtonProps: DropdownButtonProps(
                      icon:
                          Icon(Icons.keyboard_arrow_down_outlined, size: 16.h)),
                  enabled: true,
                  elevation: 0,
                  isExpanded: true,
                  containerwidth: 312.w,
                  containerheight: 48.h,
                  // containercolor: Color(0xffF9FAFB),
                  containercolor: ColorStyles().white!,
                  titleText: S.of(context).cluster,
                  textstyle: TextStyles().robotoSize14Regular(
                      color: ColorStyles()
                          .darkGrey!
                          .withAlpha((0.3 * 255).round())),
                  itemTextStyle: TextStyles()
                      .robotoSize14Regular(color: ColorStyles().cloudyGrey!),
                  selectItemTextStyle: TextStyles()
                      .robotoSize14Regular(color: ColorStyles().black!),
                  boxShadow: [
                    BoxShadow(
                      color: ColorStyles().softLavenderBlue!.withAlpha(
                          (0.4 * 255).round()), // Shadow color with 7% opacity
                      offset: Offset(0, 0), // X and Y offset
                      blurRadius: 5, // Blur radius
                      spreadRadius: 0, // Spread radius
                    ),
                  ],
                  border: Border(
                      bottom: BorderSide(
                          color: ColorStyles().borderGray!, width: 0.5)),
                  errorText: controller().isSubmit
                      ? validateLeadSource(controller().selectCluster)
                      : null,
                  errorStyle: TextStyles()
                      .robotoSize14Regular(color: ColorStyles().errorRed!)
                      .copyWith(fontSize: 12.sp),
                ),
                _verticalSizeBox(),
                CommonDropdown(
                  onChangedsearch: (String? selectedName) {
                    if (selectedName != null) {
                      controller().onSelectDealer(selectedName);
                    }
                  },
                  items: controller()
                      .selectDealerList
                      .map((lead) => lead.name ?? "")
                      .toList(), // Show names in dropdown
                  selectedItem: controller()
                      .selectDealerList
                      .firstWhere(
                        (lead) => lead.value == controller().selectDealer,
                        orElse: () => LeadFieldsModel(),
                      )
                      .name,

                  dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                    border: InputBorder.none, // Removes border
                    enabledBorder: InputBorder.none, // Removes enabled border
                    focusedBorder: InputBorder.none, // Removes focused border
                  )),
                  clearButtonProps: ClearButtonProps(),
                  dropdownButtonProps: DropdownButtonProps(
                      icon: Icon(
                    Icons.keyboard_arrow_down_outlined,
                    size: 16.h,
                  )),
                  enabled: true,
                  elevation: 0,
                  isExpanded: true,
                  containerwidth: 312.w,
                  containerheight: 48.h,
                  // containercolor: Color(0xffF9FAFB),
                  containercolor: ColorStyles().white!,
                  titleText: S.of(context).dealer,
                  textstyle: TextStyles().robotoSize14Regular(
                      color: ColorStyles()
                          .darkGrey!
                          .withAlpha((0.3 * 255).round())),
                  itemTextStyle: TextStyles()
                      .robotoSize14Regular(color: ColorStyles().cloudyGrey!),
                  selectItemTextStyle: TextStyles()
                      .robotoSize14Regular(color: ColorStyles().black!),
                  boxShadow: [
                    BoxShadow(
                      color: ColorStyles().softLavenderBlue!.withAlpha(
                          (0.4 * 255).round()), // Shadow color with 7% opacity
                      offset: Offset(0, 0), // X and Y offset
                      blurRadius: 5, // Blur radius
                      spreadRadius: 0, // Spread radius
                    ),
                  ],
                  border: Border(
                      bottom: BorderSide(
                          color: ColorStyles().borderGray!, width: 0.5)),
                  errorText: controller().isSubmit
                      ? validateLeadSource(controller().selectDealer)
                      : null,
                  errorStyle: TextStyles()
                      .robotoSize14Regular(color: ColorStyles().errorRed!)
                      .copyWith(fontSize: 12.sp),
                ),
                _verticalSizeBox(),
                CommonDropdown(
                  onChangedsearch: (String? selectedName) {
                    if (selectedName != null) {}
                    controller().onSelectBusinessSegment(selectedName);
                  },
                  items: controller()
                      .selectBusinessSegmentList
                      .map((lead) => lead.name ?? "")
                      .toList(), // Show names in dropdown
                  selectedItem: controller()
                      .selectBusinessSegmentList
                      .firstWhere(
                        (lead) =>
                            lead.value == controller().selectBusinessSegment,
                        orElse: () => LeadFieldsModel(),
                      )
                      .name,

                  dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                    border: InputBorder.none, // Removes border
                    enabledBorder: InputBorder.none, // Removes enabled border
                    focusedBorder: InputBorder.none, // Removes focused border
                  )),
                  clearButtonProps: ClearButtonProps(),
                  dropdownButtonProps: DropdownButtonProps(
                      icon: Icon(
                    Icons.keyboard_arrow_down_outlined,
                    size: 16.h,
                  )),
                  enabled: true,
                  elevation: 0,
                  isExpanded: true,
                  containerwidth: 312.w,
                  containerheight: 48.h,
                  // containercolor: Color(0xffF9FAFB),
                  containercolor: ColorStyles().white!,
                  titleText: S.of(context).businessSegment,
                  textstyle: TextStyles().robotoSize14Regular(
                      color: ColorStyles()
                          .darkGrey!
                          .withAlpha((0.3 * 255).round())),
                  itemTextStyle: TextStyles()
                      .robotoSize14Regular(color: ColorStyles().cloudyGrey!),
                  selectItemTextStyle: TextStyles()
                      .robotoSize14Regular(color: ColorStyles().black!),
                  boxShadow: [
                    BoxShadow(
                      color: ColorStyles().softLavenderBlue!.withAlpha(
                          (0.4 * 255).round()), // Shadow color with 7% opacity
                      offset: Offset(0, 0), // X and Y offset
                      blurRadius: 5, // Blur radius
                      spreadRadius: 0, // Spread radius
                    ),
                  ],
                  border: Border(
                      bottom: BorderSide(
                          color: ColorStyles().borderGray!, width: 0.5)),
                  errorText: controller().isSubmit
                      ? validateLeadSource(controller().selectBusinessSegment)
                      : null,
                  errorStyle: TextStyles()
                      .robotoSize14Regular(color: ColorStyles().errorRed!)
                      .copyWith(fontSize: 12.sp),
                ),
                _verticalSizeBox(),
                CommonDropdown(
                  onChangedsearch: (String? selectedName) {
                    if (selectedName != null) {
                      controller().onSelectVehicleType(selectedName);
                    }
                  },
                  items: controller()
                      .selectVehicleTypeList
                      .map((lead) => lead.name ?? "")
                      .toList(), // Show names in dropdown
                  selectedItem: controller()
                      .selectVehicleTypeList
                      .firstWhere(
                        (lead) => lead.value == controller().selectVehicleType,
                        orElse: () => LeadFieldsModel(),
                      )
                      .name,

                  dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                    border: InputBorder.none, // Removes border
                    enabledBorder: InputBorder.none, // Removes enabled border
                    focusedBorder: InputBorder.none, // Removes focused border
                  )),
                  clearButtonProps: ClearButtonProps(),
                  dropdownButtonProps: DropdownButtonProps(
                      icon: Icon(
                    Icons.keyboard_arrow_down_outlined,
                    size: 16.h,
                  )),
                  enabled: true,
                  elevation: 0,
                  isExpanded: true,
                  containerwidth: 312.w,
                  containerheight: 48.h,
                  // containercolor: Color(0xffF9FAFB),
                  containercolor: ColorStyles().white!,
                  titleText: S.of(context).vehicleType,
                  textstyle: TextStyles().robotoSize14Regular(
                      color: ColorStyles()
                          .darkGrey!
                          .withAlpha((0.3 * 255).round())),
                  itemTextStyle: TextStyles()
                      .robotoSize14Regular(color: ColorStyles().cloudyGrey!),
                  selectItemTextStyle: TextStyles()
                      .robotoSize14Regular(color: ColorStyles().black!),
                  boxShadow: [
                    BoxShadow(
                      color: ColorStyles().softLavenderBlue!.withAlpha(
                          (0.4 * 255).round()), // Shadow color with 7% opacity
                      offset: Offset(0, 0), // X and Y offset
                      blurRadius: 5, // Blur radius
                      spreadRadius: 0, // Spread radius
                    ),
                  ],
                  border: Border(
                      bottom: BorderSide(
                          color: ColorStyles().borderGray!, width: 0.5)),
                  errorText: controller().isSubmit
                      ? validateLeadSource(controller().selectVehicleType)
                      : null,
                  errorStyle: TextStyles()
                      .robotoSize14Regular(color: ColorStyles().errorRed!)
                      .copyWith(fontSize: 12.sp),
                ),
                _verticalSizeBox(),
                CommonDropdown(
                  onChangedsearch: (String? selectedName) {
                    if (selectedName != null) {
                      controller().onSelectSalesType(selectedName);
                    }
                  },
                  items: controller()
                      .selectSalesTypeList
                      .map((lead) => lead.name ?? "")
                      .toList(), // Show names in dropdown
                  selectedItem: controller()
                      .selectSalesTypeList
                      .firstWhere(
                        (lead) => lead.value == controller().selectSalesType,
                    orElse: () => LeadFieldsModel(),
                  )
                      .name,
                  dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        border: InputBorder.none, // Removes border
                        enabledBorder: InputBorder.none, // Removes enabled border
                        focusedBorder: InputBorder.none, // Removes focused border
                      )),
                  clearButtonProps: ClearButtonProps(),
                  dropdownButtonProps: DropdownButtonProps(
                      icon: Icon(
                        Icons.keyboard_arrow_down_outlined,
                        size: 16.h,
                      )),
                  enabled: true,
                  elevation: 0,
                  isExpanded: true,
                  containerwidth: 312.w,
                  containerheight: 48.h,
                  // containercolor: Color(0xffF9FAFB),
                  containercolor: ColorStyles().white!,
                  titleText: S.of(context).salesType,
                  textstyle: TextStyles().robotoSize14Regular(
                      color: ColorStyles()
                          .darkGrey!
                          .withAlpha((0.3 * 255).round())),
                  itemTextStyle: TextStyles()
                      .robotoSize14Regular(color: ColorStyles().cloudyGrey!),
                  selectItemTextStyle: TextStyles()
                      .robotoSize14Regular(color: ColorStyles().black!),
                  boxShadow: [
                    BoxShadow(
                      color: ColorStyles().softLavenderBlue!.withAlpha(
                          (0.4 * 255).round()), // Shadow color with 7% opacity
                      offset: Offset(0, 0), // X and Y offset
                      blurRadius: 5, // Blur radius
                      spreadRadius: 0, // Spread radius
                    ),
                  ],
                  border: Border(
                      bottom: BorderSide(
                          color: ColorStyles().borderGray!, width: 0.5)),
                  errorText: controller().isSubmit
                      ? validateLeadSource(controller().selectSalesType)
                      : null,
                  errorStyle: TextStyles()
                      .robotoSize14Regular(color: ColorStyles().errorRed!)
                      .copyWith(fontSize: 12.sp),
                ),
                _verticalSizeBox(),
                CommonDropdown(
                  onChangedsearch: (String? selectedName) {
                    if (selectedName != null) {
                      controller().onSelectServiceType(selectedName);
                    }
                  },
                  items: controller()
                      .selectServiceTypeList
                      .map((lead) => lead.name ?? "")
                      .toList(), // Show names in dropdown
                  selectedItem: controller()
                      .selectServiceTypeList
                      .firstWhere(
                        (lead) => lead.value == controller().selectServiceType,
                        orElse: () => LeadFieldsModel(),
                      )
                      .name,

                  dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                    border: InputBorder.none, // Removes border
                    enabledBorder: InputBorder.none, // Removes enabled border
                    focusedBorder: InputBorder.none, // Removes focused border
                  )),
                  clearButtonProps: ClearButtonProps(),
                  dropdownButtonProps: DropdownButtonProps(
                      icon: Icon(
                    Icons.keyboard_arrow_down_outlined,
                    size: 16.h,
                  )),
                  enabled: true,
                  elevation: 0,
                  isExpanded: true,
                  containerwidth: 312.w,
                  containerheight: 48.h,
                  // containercolor: Color(0xffF9FAFB),
                  containercolor: ColorStyles().white!,
                  titleText: S.of(context).serviceType,
                  textstyle: TextStyles().robotoSize14Regular(
                      color: ColorStyles()
                          .darkGrey!
                          .withAlpha((0.3 * 255).round())),
                  itemTextStyle: TextStyles()
                      .robotoSize14Regular(color: ColorStyles().cloudyGrey!),
                  selectItemTextStyle: TextStyles()
                      .robotoSize14Regular(color: ColorStyles().black!),
                  boxShadow: [
                    BoxShadow(
                      color: ColorStyles().softLavenderBlue!.withAlpha(
                          (0.4 * 255).round()), // Shadow color with 7% opacity
                      offset: Offset(0, 0), // X and Y offset
                      blurRadius: 5, // Blur radius
                      spreadRadius: 0, // Spread radius
                    ),
                  ],
                  border: Border(
                      bottom: BorderSide(
                          color: ColorStyles().borderGray!, width: 0.5)),
                  errorText: controller().isSubmit
                      ? validateLeadSource(controller().selectServiceType)
                      : null,
                  errorStyle: TextStyles()
                      .robotoSize14Regular(color: ColorStyles().errorRed!)
                      .copyWith(fontSize: 12.sp),
                ),
                _verticalSizeBox(),
                // CommonDropdown(
                //   onChangedsearch: (String? selectedName) {
                //     if (selectedName != null) {
                //       controller().onSelectSalesType(selectedName);
                //
                //     }
                //   },
                //   items: controller().selectSalesTypeList.map((lead) => lead.name ?? "").toList(),  // Show names in dropdown
                //   selectedItem: controller().selectSalesTypeList.firstWhere(
                //         (lead) => lead.value == controller().selectSalesType,
                //     orElse: () => LeadFieldsModel(),
                //   ).name,
                //
                //
                //   dropdownDecoratorProps: DropDownDecoratorProps(
                //       dropdownSearchDecoration: InputDecoration(
                //         border: InputBorder.none, // Removes border
                //         enabledBorder: InputBorder.none, // Removes enabled border
                //         focusedBorder: InputBorder.none, // Removes focused border
                //       )
                //   ),
                //   clearButtonProps: ClearButtonProps(),
                //   dropdownButtonProps: DropdownButtonProps(
                //       icon: Icon(Icons.keyboard_arrow_down_outlined,size: 16.h,)
                //   ),
                //   enabled: true,
                //   elevation: 0,
                //   isExpanded: true,
                //   containerwidth: 312.w,
                //   containerheight: 48.h,
                //   // containercolor: Color(0xffF9FAFB),
                //   containercolor: ColorStyles().white!,
                //   titleText: S.of(context).salesType,
                //   textstyle: TextStyles().robotoSize14Regular(color: ColorStyles().darkGrey!.withAlpha((0.3*255).round())),
                //   itemTextStyle: TextStyles().robotoSize14Regular(color: ColorStyles().cloudyGrey!),
                //   selectItemTextStyle : TextStyles().robotoSize14Regular(color: ColorStyles().black!),
                //   boxShadow: [
                //     BoxShadow(
                //       color: ColorStyles().softLavenderBlue!.withAlpha((0.4 * 255).round()), // Shadow color with 7% opacity
                //       offset: Offset(0, 0), // X and Y offset
                //       blurRadius: 5, // Blur radius
                //       spreadRadius: 0, // Spread radius
                //     ),
                //   ],
                //   border: Border(
                //       bottom: BorderSide(color: ColorStyles().borderGray!,width: 0.5)
                //   ),
                //   errorText: controller().isSubmit ? validateDropDown(controller().selectSalesType) : null,
                //   errorStyle: TextStyles().robotoSize14Regular(color: ColorStyles().errorRed!).copyWith(fontSize: 12.sp),
                // ),
                // _verticalSizeBox(),
                CommonDropdown(
                  onChangedsearch: (String? selectedName) {
                    if (selectedName != null) {
                      controller().onSelectVehicleFinanceStatus(selectedName);
                    }
                  },
                  items: controller()
                      .selectVehicleFinanceStatusList
                      .map((lead) => lead.name ?? "")
                      .toList(), // Show names in dropdown
                  selectedItem: controller()
                      .selectVehicleFinanceStatusList
                      .firstWhere(
                        (lead) =>
                            lead.value ==
                            controller().selectVehicleFinanceStatus,
                        orElse: () => LeadFieldsModel(),
                      )
                      .name,

                  dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                    border: InputBorder.none, // Removes border
                    enabledBorder: InputBorder.none, // Removes enabled border
                    focusedBorder: InputBorder.none, // Removes focused border
                  )),
                  clearButtonProps: ClearButtonProps(),
                  dropdownButtonProps: DropdownButtonProps(
                      icon: Icon(
                    Icons.keyboard_arrow_down_outlined,
                    size: 16.h,
                  )),
                  enabled: true,
                  elevation: 0,
                  isExpanded: true,
                  containerwidth: 312.w,
                  containerheight: 48.h,
                  // containercolor: Color(0xffF9FAFB),
                  containercolor: ColorStyles().white!,
                  titleText: S.of(context).vehicleFinanceStatus,
                  textstyle: TextStyles().robotoSize14Regular(
                      color: ColorStyles()
                          .darkGrey!
                          .withAlpha((0.3 * 255).round())),
                  itemTextStyle: TextStyles()
                      .robotoSize14Regular(color: ColorStyles().cloudyGrey!),
                  selectItemTextStyle: TextStyles()
                      .robotoSize14Regular(color: ColorStyles().black!),
                  boxShadow: [
                    BoxShadow(
                      color: ColorStyles().softLavenderBlue!.withAlpha(
                          (0.4 * 255).round()), // Shadow color with 7% opacity
                      offset: Offset(0, 0), // X and Y offset
                      blurRadius: 5, // Blur radius
                      spreadRadius: 0, // Spread radius
                    ),
                  ],
                  border: Border(
                      bottom: BorderSide(
                          color: ColorStyles().borderGray!, width: 0.5)),
                  errorText: controller().isSubmit
                      ? validateLeadSource(
                          controller().selectVehicleFinanceStatus)
                      : null,
                  errorStyle: TextStyles()
                      .robotoSize14Regular(color: ColorStyles().errorRed!)
                      .copyWith(fontSize: 12.sp),
                ),
                // _verticalSizeBox(),
                // CommonDropdown(
                //   onChangedsearch: (String? value) {
                //     if (value != null) {
                //       controller().onSelectMoveToKyc(value);
                //     }
                //   },
                //   items: ['Yes', 'No'],
                //   selectedItem : controller().selectMoveToKyc != "" ? controller().selectMoveToKyc : null,
                //   dropdownDecoratorProps: DropDownDecoratorProps(
                //       dropdownSearchDecoration: InputDecoration(
                //     border: InputBorder.none, // Removes border
                //     enabledBorder: InputBorder.none, // Removes enabled border
                //     focusedBorder: InputBorder.none, // Removes focused border
                //   )),
                //   clearButtonProps: ClearButtonProps(),
                //   dropdownButtonProps: DropdownButtonProps(
                //       icon: Icon(
                //     Icons.keyboard_arrow_down_outlined,
                //     size: 16.h,
                //   )),
                //   enabled: true,
                //   elevation: 0,
                //   isExpanded: true,
                //   containerwidth: 312.w,
                //   containerheight: 48.h,
                //   // containercolor: Color(0xffF9FAFB),
                //   containercolor: ColorStyles().white!,
                //   titleText: S.of(context).moveToKycVerification,
                //   textstyle: TextStyles().robotoSize14Regular(
                //       color: ColorStyles()
                //           .darkGrey!
                //           .withAlpha((0.3 * 255).round())),
                //   itemTextStyle: TextStyles()
                //       .robotoSize14Regular(color: ColorStyles().cloudyGrey!),
                //   selectItemTextStyle: TextStyles()
                //       .robotoSize14Regular(color: ColorStyles().black!),
                //   boxShadow: [
                //     BoxShadow(
                //       color: ColorStyles().softLavenderBlue!.withAlpha(
                //           (0.4 * 255).round()), // Shadow color with 7% opacity
                //       offset: Offset(0, 0), // X and Y offset
                //       blurRadius: 5, // Blur radius
                //       spreadRadius: 0, // Spread radius
                //     ),
                //   ],
                //   border: Border(
                //       bottom: BorderSide(
                //           color: ColorStyles().borderGray!, width: 0.5)),
                //   errorText: controller().isSubmit
                //       ? validateDropDown(controller().selectMoveToKyc)
                //       : null,
                //   errorStyle: TextStyles()
                //       .robotoSize14Regular(color: ColorStyles().errorRed!)
                //       .copyWith(fontSize: 12.sp),
                // ),
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
                          btnTextColor: ColorStyles().orangePink!),
                    ),
                    SizedBox(
                      width: 36.w,
                    ),
                    Expanded(
                      child: smallButton(
                        btnText: S.of(context).save,
                        bgColor: ColorStyles().orangePink!,
                        btnTextColor: ColorStyles().white!,
                        onTap: () {
                          if (!controller().isSubmit) {
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

  Widget smallButton(
      {required String btnText,
      required Color btnTextColor,
      required Color bgColor,
      Color? borderColor,
      EdgeInsetsGeometry? padding,
      BorderRadiusGeometry? borderRadius,
      void Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.0),
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: borderRadius ?? BorderRadius.circular(15.r),
            border: Border.all(color: ColorStyles().orangePink!)),
        child: Text(
          btnText,
          textAlign: TextAlign.center,
          style: TextStyles().robotoSize14Regular(color: btnTextColor),
        ),
      ),
    );
  }

  Widget _verticalSizeBox() {
    return SizedBox(
      height: 12.h,
    );
  }

  Widget _horizontalSizeBox() {
    return SizedBox(
      width: 12.h,
    );
  }
}
