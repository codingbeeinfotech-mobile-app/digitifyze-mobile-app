import 'dart:io';
import 'package:digitifyze/model/response/lead_field_model.dart';
import 'package:digitifyze/ui/screens/tab/home/kyc_verification_screen/add_kyc/widget/add_kyc_verification_body.dart';
import 'package:digitifyze/ui/screens/tab/home/kyc_verification_screen/edit_kyc/edit_kyc_verification_screen_controller.dart';
import 'package:digitifyze/ui/screens/tab/home/kyc_verification_screen/kyc_lead_list_screen_controller.dart';
import 'package:digitifyze/ui/widgets/common_widgets/common_dropdown.dart';
import 'package:digitifyze/ui/widgets/common_widgets/common_image_button.dart';
import 'package:digitifyze/ui/widgets/common_widgets/common_image_picker.dart';
import 'package:digitifyze/ui/widgets/common_widgets/text_input_field.dart';
import 'package:digitifyze/ui/widgets/validate.dart';
import 'package:digitifyze/utils/dropdown/src/properties/clear_button_props.dart';
import 'package:digitifyze/utils/dropdown/src/properties/dropdown_button_props.dart';
import 'package:digitifyze/utils/dropdown/src/properties/dropdown_decorator_props.dart';
import 'package:digitifyze/utils/enums.dart';
import 'package:digitifyze/utils/import_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class EditKycVerificationBodyScreen extends ConsumerStatefulWidget {
   final int existLeadId;
  const EditKycVerificationBodyScreen({super.key, required this.existLeadId});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditKycVerificationBodyScreenState();
}

class _EditKycVerificationBodyScreenState extends ConsumerState<EditKycVerificationBodyScreen> {
  @override
  Widget build(BuildContext context) {
    ref.watch(editKycVerificationScreenControllerProvider(existLeadId:widget.existLeadId));
    controller() => ref.read(editKycVerificationScreenControllerProvider(existLeadId: widget.existLeadId).notifier);

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
          child: PageView(
            controller: controller().pageController,
            physics: NeverScrollableScrollPhysics(),
            children: [
              generalInformationSection(context: context,controller: controller()),
              vehicleInformationSection(context: context,controller: controller()),
              bankRefInformationSection(context: context,controller: controller()),
            ],
          ),
        ));
  }

  Widget generalInformationSection({required BuildContext context, required EditKycVerificationScreenController controller}) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              commonText(
                  text: S.of(context).generalInformation,
                  style: TextStyles()
                      .robotoSize16Regular(color: ColorStyles().black!)),
              commonText(
                  text: "1/4",
                  style: TextStyles()
                      .robotoSize16Regular(color: ColorStyles().orangePink!)),
            ],
          ),
          Divider(
            color: ColorStyles().customBlue!,
          ),
          _verticalSizeBox(),
          CommonImageButton(
            title: "",

            imgFile: controller.userPicFile,
            imgUrl: controller.userUrl,
            isProfile: true,
            onTap: () {
              commonNavigator(
                  child: CommonImagePicker(
                pickedImage: (file) {
                  controller.pickFileData(
                    type: PicType.profile,
                    file: file,
                  );
                  if(controller.globalKycDetailModel.isDriverPicMandatory!){
                    validateImageFile(controller.userPicFile);
                    controller.checkValidateGeneralInfo();
                  }
                  setState(() {});
                },
                picker: ImagePicker(),
              ));
            },
            errorText: controller.globalKycDetailModel.isDriverPicMandatory! ? controller.isSubmitOnGenInfo
                ? controller.userUrl == ""
                    ? validateImageFile(controller.userPicFile)
                    : null
                : null : null,
            errorStyle: TextStyles()
                .robotoSize14Regular(color: ColorStyles().errorRed!)
                .copyWith(fontSize: 12),
          ),
          // GestureDetector(
          //     onTap: () {
          //       commonNavigator(child: CommonImagePicker(
          //         pickedImage: (file) {
          //           controller().pickFileData(type: PicType.profile, file: file,);
          //         },
          //         picker: ImagePicker(),
          //       ));
          //     },
          //     child: controller().profilePicFile == null ? Image.asset(AppImg.icEmptyProfile,height: 112.h,) : Container(
          //         height: 112.h,
          //         width: 112.w,
          //         decoration: BoxDecoration(
          //           shape: BoxShape.circle,
          //         ),
          //         child: ClipRRect(
          //             borderRadius: BorderRadius.circular(60.r),
          //             child: Image.file(controller().profilePicFile!,fit: BoxFit.cover,)))),
          _verticalSizeBox(),
          CommonDropdown(
            onChangedsearch: (String? value) {
              if (value != null) {
                controller.onSelectSmartPhoneUser(value);
              }
            },
            items: controller
                .smartPhoneUserList
                .map((lead) => lead.name ?? "")
                .toList(), // Show names in dropdown
            selectedItem: controller
                .smartPhoneUserList
                .firstWhere(
                  (lead) => lead.value == controller.selectedSmartPhoneUsersId,
              orElse: () => LeadFieldsModel(),
            )
                .name,
            // isExpansion: true,
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
            titleText: S.of(context).smartPhoneUser,
            textstyle: TextStyles().robotoSize14Regular(
                color: ColorStyles().darkGrey!.withAlpha((0.3 * 255).round())),
            itemTextStyle: TextStyles()
                .robotoSize14Regular(color: ColorStyles().cloudyGrey!),
            selectItemTextStyle:
            TextStyles().robotoSize14Regular(color: ColorStyles().black!),
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
                bottom:
                BorderSide(color: ColorStyles().borderGray!, width: 0.5)),
            errorText: controller.globalKycDetailModel.isSmartphoneUserMandatory! ? controller.isSubmitOnGenInfo
                ? validateLeadSource(controller.selectedSmartPhoneUsersId)
                : null : null,
            errorStyle: TextStyles()
                .robotoSize14Regular(color: ColorStyles().errorRed!)
                .copyWith(fontSize: 12),
          ),
          _verticalSizeBox(),
          CommonDropdown(
            onChangedsearch: (String? value) {
              if (value != null) {
                controller.onSelectMaritalStatus(value);
              }
            },
            items: controller
                .maritalStatusList
                .map((lead) => lead.name ?? "")
                .toList(), // Show names in dropdown
            selectedItem: controller
                .maritalStatusList
                .firstWhere(
                  (lead) => lead.value == controller.selectedMaritalStatusId,
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
            containerwidth: 332.w,
            containerheight: 48.h,
            // containercolor: Color(0xffF9FAFB),
            containercolor: ColorStyles().white!,
            titleText: S.of(context).maritalStatus,
            textstyle: TextStyles().robotoSize14Regular(
                color: ColorStyles().darkGrey!.withAlpha((0.3 * 255).round())),
            itemTextStyle: TextStyles()
                .robotoSize14Regular(color: ColorStyles().cloudyGrey!),
            selectItemTextStyle:
                TextStyles().robotoSize14Regular(color: ColorStyles().black!),
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
                bottom:
                    BorderSide(color: ColorStyles().borderGray!, width: 0.5)),
            errorText: controller.globalKycDetailModel.isMaritalStatusMandatory! ? controller.isSubmitOnGenInfo
                ? validateLeadSource(controller.selectedMaritalStatusId)
                : null : null,
            errorStyle: TextStyles()
                .robotoSize14Regular(color: ColorStyles().errorRed!)
                .copyWith(fontSize: 12),
          ),
          _verticalSizeBox(),
          TextInputField(
            hintText: S.of(context).aadharNo,
            hintStyle: TextStyles().robotoSize14Regular(
                color: ColorStyles().darkGrey!.withValues(alpha: (0.3 * 255))),
            controller: controller.aadharNoController,
            focusNode: controller.aadharNoFocusNode,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly, // Allow only numbers
              AadhaarNumberFormatter(), // Custom formatter to add space after 4 digits
            ],
            onChanged: (value) {
              if (value.trim().length == 14) {
                controller.aadharNoFocusNode.unfocus();
                if(controller.globalKycDetailModel.isAadharNoMandatory!){
                  validateAadhaar(controller.aadharNoController.text);
                }
              }
              controller.checkValidateGeneralInfo();
              setState(() {});
            },
            keyboardType: TextInputType.number,
            maxLength: 14,
            containerwidth: 332.w,
            containerheight: 48.h,
            containercolor: ColorStyles().white!,
            borderRadius: BorderRadius.zero,
            underline: false,
            underlinecolor: ColorStyles().borderGray!,
            contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
            containerborder: Border(
                bottom:
                BorderSide(color: ColorStyles().borderGray!, width: 1.0)),
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
            textInputAction: TextInputAction.done,
            textFieldsBorder: false,
            textstyle:
            TextStyles().robotoSize14Regular(color: ColorStyles().black!),
            errorText: controller.globalKycDetailModel.isAadharNoMandatory! ? controller.isSubmitOnGenInfo
                ? validateAadhaar(controller.aadharNoController.text)
                : null : null,
            errorStyle: TextStyles()
                .robotoSize14Regular(color: ColorStyles().errorRed!)
                .copyWith(fontSize: 12),
          ),
          _verticalSizeBox(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: CommonImageButton(
                title: S.of(context).aadharPicFront,
                imgUrl: controller.frontAadharUrl,

                onTap: () {
                  commonNavigator(
                      child: CommonImagePicker(
                    pickedImage: (file) {
                      controller.pickFileData(
                        type: PicType.adharFront,
                        file: file,
                      );
                      if(controller.globalKycDetailModel.isAadharPicMandatory!){
                        validateImageFile(controller.frontAadharPicFile);
                      }

                      controller.checkValidateGeneralInfo();
                    },
                    picker: ImagePicker(),
                  ));
                },
                imgFile: controller.frontAadharPicFile,
                errorText: controller.globalKycDetailModel.isAadharPicMandatory! ? controller.isSubmitOnGenInfo
                    ? controller.frontAadharUrl == ""
                        ? validateImageFile(controller.frontAadharPicFile)
                        : null
                    : null : null,
                errorStyle: TextStyles()
                    .robotoSize14Regular(color: ColorStyles().errorRed!)
                    .copyWith(fontSize: 12),
              )),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                  child: CommonImageButton(
                title: S.of(context).aadharPicBack,
                imgUrl: controller.backAadharUrl,

                onTap: () {
                  commonNavigator(
                      child: CommonImagePicker(
                    pickedImage: (file) {
                      controller.pickFileData(
                        type: PicType.adharBack,
                        file: file,
                      );
                        if(controller.globalKycDetailModel.isAadharPicMandatory!){
                          validateImageFile(controller.backAadharPicFile);
                        }

                      controller.checkValidateGeneralInfo();
                    },
                    picker: ImagePicker(),
                  ));
                },
                imgFile: controller.backAadharPicFile,
                errorText: controller.globalKycDetailModel.isAadharPicMandatory! ? controller.isSubmitOnGenInfo
                    ? controller.backAadharUrl == ""
                        ? validateImageFile(controller.backAadharPicFile)
                        : null
                    : null : null,
                errorStyle: TextStyles()
                    .robotoSize14Regular(color: ColorStyles().errorRed!)
                    .copyWith(fontSize: 12),
              )),
            ],
          ),
          _verticalSizeBox(),
          TextInputField(
            hintText: '${S.of(context).dob} (dd/MM/yyyy)',
            hintStyle: TextStyles().robotoSize14Regular(
                color: ColorStyles().darkGrey!.withAlpha((0.3 * 255).round())),
            controller: controller.dobController,
            focusNode: controller.dobFocusNode,
            onChanged: (value) {
              if(controller.globalKycDetailModel.isDateOfBirthMandatory!){
                validateDropDown(controller.dobController.text);
              }

              controller.checkValidateGeneralInfo();
              setState(() {});
            },
            keyboardType: TextInputType.number,
            containerwidth: 332.w,
            containerheight: 48.h,
            containercolor: ColorStyles().white!,
            borderRadius: BorderRadius.zero,
            underline: false,
            // enabled: false,
            readonly: true,
            onTap: () async {
              var pickDate = await showDatePicker(
                context: context,
                initialEntryMode: DatePickerEntryMode.calendarOnly,
                locale: const Locale('en', 'GB'),
                initialDate:DateTime.now(),
                firstDate: DateTime(1950),
                lastDate: DateTime.now(),
                builder: (context, child) {
                  return Theme(
                    data: Theme.of(context).copyWith(
                      datePickerTheme: DatePickerThemeData(
                        headerBackgroundColor: ColorStyles().orangePink!, // Header background color
                        headerForegroundColor: Colors.white, // Header text color
                        headerHeadlineStyle: TextStyles().robotoSize16SemiBold(color: ColorStyles().white!).copyWith(fontSize: 22.sp),
                      ),
                      dialogTheme:  DialogTheme(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero, // Removes rounded corners
                        ),
                      ),

                      colorScheme:
                      ColorScheme.light(
                        primary: ColorStyles().orangePink!,
                        onPrimary: Colors.white,
                        onSurface: Colors.black,
                      ),
                      textButtonTheme:
                      TextButtonThemeData(
                        style: TextButton.styleFrom(
                            foregroundColor:
                            Colors.black45,
                            textStyle: TextStyles().robotoSize16Bold(color: ColorStyles().grey!)
                        ),
                      ),
                    ),
                    child: child!,
                  );
                },
              );
              if (pickDate != null) {
                controller.dobApiController.text = pickDate.toString();
                controller.dobController.text =
                    DateFormat("dd/MM/yyyy").format(pickDate);
                debugPrint(
                    "PickDate => ${DateFormat("dd/MM/yyyy").format(pickDate)}");
                setState(() {});
              }
            },
            underlinecolor: ColorStyles().borderGray!,
            contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
            containerborder: Border(
                bottom:
                    BorderSide(color: ColorStyles().borderGray!, width: 1.0)),
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
            textInputAction: TextInputAction.done,
            textFieldsBorder: false,
            textstyle:
                TextStyles().robotoSize14Regular(color: ColorStyles().black!),
            suffixicon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 16.h),
              child: Image.asset(AppImg.icCalender),
            ),
            errorText: controller.globalKycDetailModel.isDateOfBirthMandatory! ? controller.isSubmitOnGenInfo
                ? validateDropDown(controller.dobController.text)
                : null : null,
            errorStyle: TextStyles()
                .robotoSize14Regular(color: ColorStyles().errorRed!)
                .copyWith(fontSize: 12),
          ),
          _verticalSizeBox(),
          TextInputField(
            hintText: S.of(context).currentAddress,
            hintStyle: TextStyles().robotoSize14Regular(
                color: ColorStyles().darkGrey!.withAlpha((0.3 * 255).round())),
            controller: controller.currentAddressController,
            focusNode: controller.currentAddressFocusNode,
            onChanged: (value) {
              if(controller.globalKycDetailModel.isCurrentAddressMandatory!){
                validateAddress(controller.currentAddressController.text);
              }
              controller.checkValidateGeneralInfo();
              setState(() {});
            },
            keyboardType: TextInputType.text,
            containerwidth: 332.w,
            containerheight: 64.h,
            containercolor: ColorStyles().white!,
            borderRadius: BorderRadius.zero,
            underline: false,
            maxLines: 3,
            underlinecolor: ColorStyles().borderGray!,
            contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
            containerborder: Border(
                bottom:
                    BorderSide(color: ColorStyles().borderGray!, width: 1.0)),
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
            textInputAction: TextInputAction.done,
            textFieldsBorder: false,
            textstyle:
                TextStyles().robotoSize14Regular(color: ColorStyles().black!),
            errorText: controller.globalKycDetailModel.isCurrentAddressMandatory! ? controller.isSubmitOnGenInfo
                ? validateAddress(controller.currentAddressController.text)
                : null : null,
            errorStyle: TextStyles()
                .robotoSize14Regular(color: ColorStyles().errorRed!)
                .copyWith(fontSize: 12),
          ),
          _verticalSizeBox(),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  controller.sameAsCurrentAddress();
                },
                child: Container(
                  height: 32.h,
                  width: 32.w,
                  decoration: BoxDecoration(
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
                      border: Border(
                          bottom:
                              BorderSide(color: ColorStyles().borderGray!))),
                  child: Icon(
                    Icons.check,
                    color: controller.isSameAddress
                        ? Colors.black
                        : Colors.transparent,
                  ),
                ),
              ),
              SizedBox(
                width: 8.w,
              ),
              commonText(
                  text: S.of(context).sameAsCurrentAddress,
                  style: TextStyles().robotoSize14Regular(color: Colors.black))
            ],
          ),
          _verticalSizeBox(),
          TextInputField(
            hintText: S.of(context).permanentAddress,
            hintStyle: TextStyles().robotoSize14Regular(
                color: ColorStyles().darkGrey!.withAlpha((0.3 * 255).round())),
            controller: controller.permanentAddressController,
            focusNode: controller.permanentAddressFocusNode,
            onChanged: (value) {
              if(controller.globalKycDetailModel.isPermanentMandatory!){
                validateAddress(controller.permanentAddressController.text);
              }
              controller.checkValidateGeneralInfo();
              setState(() {});
            },
            keyboardType: TextInputType.text,
            containerwidth: 332.w,
            containerheight: 64.h,
            containercolor: ColorStyles().white!,
            borderRadius: BorderRadius.zero,
            underline: false,
            maxLines: 3,
            underlinecolor: ColorStyles().borderGray!,
            contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
            containerborder: Border(
                bottom:
                    BorderSide(color: ColorStyles().borderGray!, width: 1.0)),
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
            textInputAction: TextInputAction.done,
            textFieldsBorder: false,
            textstyle:
                TextStyles().robotoSize14Regular(color: ColorStyles().black!),
            errorText: controller.globalKycDetailModel.isPermanentMandatory! ? controller.isSubmitOnGenInfo
                ? validateAddress(controller.permanentAddressController.text)
                : null : null,
            errorStyle: TextStyles()
                .robotoSize14Regular(color: ColorStyles().errorRed!)
                .copyWith(fontSize: 12),
          ),
          _verticalSizeBox(),
          TextInputField(
            hintText: S.of(context).panNo,
            hintStyle: TextStyles().robotoSize14Regular(
                color: ColorStyles().darkGrey!.withAlpha((0.3 * 255).round())),
            controller: controller.panNoController,
            focusNode: controller.panNoFocusNode,
            maxLength: 10,
            inputFormatters: [
              FilteringTextInputFormatter.deny(RegExp(r'\s')), // Deny spaces
            ],
            onChanged: (value) {
              if (value.trim().length == 10) {
                controller.panNoFocusNode.unfocus();
                if(controller.globalKycDetailModel.isPancardNoMandatory!){
                  validatePanNo(controller.panNoController.text);
                }
              }
              controller.checkValidateGeneralInfo();
              setState(() {});
            },
            keyboardType: TextInputType.text,
            containerwidth: 332.w,
            containerheight: 48.h,
            containercolor: ColorStyles().white!,
            borderRadius: BorderRadius.zero,
            underline: false,
            underlinecolor: ColorStyles().borderGray!,
            contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
            containerborder: Border(
                bottom:
                    BorderSide(color: ColorStyles().borderGray!, width: 1.0)),
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
            textstyle:
                TextStyles().robotoSize14Regular(color: ColorStyles().black!),
            errorText: controller.globalKycDetailModel.isPancardNoMandatory! ? controller.isSubmitOnGenInfo
                ? validatePanNo(controller.panNoController.text)
                : null : null,
            errorStyle: TextStyles()
                .robotoSize14Regular(color: ColorStyles().errorRed!)
                .copyWith(fontSize: 12),
          ),
          _verticalSizeBox(),
          CommonImageButton(
            title: S.of(context).panCardPic,
            imgUrl: controller.panCardUrl,

            onTap: () {
              commonNavigator(
                  child: CommonImagePicker(
                pickedImage: (file) {
                  controller.pickFileData(
                    type: PicType.pan,
                    file: file,
                  );
                  if(controller.globalKycDetailModel.isPancardPicMandatory!){
                    validateImageFile(controller.panCardPicFile);
                  }
                  controller.checkValidateGeneralInfo();
                },
                picker: ImagePicker(),
              ));
            },
            imgFile: controller.panCardPicFile,
            errorText: controller.globalKycDetailModel.isPancardPicMandatory! ? controller.isSubmitOnGenInfo
                ? controller.panCardUrl == ""
                    ? validateImageFile(controller.panCardPicFile)
                    : null
                : null : null,
            errorStyle: TextStyles()
                .robotoSize14Regular(color: ColorStyles().errorRed!)
                .copyWith(fontSize: 12),
          ),
          _verticalSizeBox(),
          _verticalSizeBox(),
          smallButton(
            btnText: S.of(context).next,
            btnTextColor: ColorStyles().white!,
            bgColor: controller.isValidateGeneralInfo
                ? ColorStyles().orangePink!
                : ColorStyles().lavenderGrey!,
            borderColor: ColorStyles().lavenderGrey!,
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 55.w),
            onTap: () {
              if (!controller.isValidateGeneralInfo) {
                controller.changeSubmitValue(true, 1);
              } else {
                controller.changeKYCSection(1);
              }
            },
          ),
          _verticalSizeBox(),
          _verticalSizeBox(),
        ],
      ),
    );
  }

  Widget vehicleInformationSection({required BuildContext context, required EditKycVerificationScreenController controller}) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              commonText(
                  text: S.of(context).vehicleInformation,
                  style: TextStyles().robotoSize16Regular(color: Colors.black)),
              commonText(
                  text: "2/4",
                  style: TextStyles()
                      .robotoSize16Regular(color: ColorStyles().orangePink!)),
            ],
          ),
          Divider(
            color: ColorStyles().customBlue!,
          ),
          _verticalSizeBox(),
          CommonDropdown(
            onChangedsearch: (String? value) {
              if (value != null) {
                controller.onSelectVehicleOwnership(value);
              }
            },
            items: controller
                .vehicleOwnershipList
                .map((lead) => lead.name ?? "")
                .toList(), // Show names in dropdown
            selectedItem: controller
                .vehicleOwnershipList
                .firstWhere(
                  (lead) =>
                      lead.value == controller.selectedVehicleOwnershipId,
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
            containerwidth: 332.w,
            containerheight: 48.h,
            // containercolor: Color(0xffF9FAFB),
            containercolor: ColorStyles().white!,
            titleText: S.of(context).vehicleOwnership,
            textstyle: TextStyles().robotoSize14Regular(
                color: ColorStyles().darkGrey!.withAlpha((0.3 * 255).round())),
            itemTextStyle: TextStyles()
                .robotoSize14Regular(color: ColorStyles().cloudyGrey!),
            selectItemTextStyle:
                TextStyles().robotoSize14Regular(color: ColorStyles().black!),
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
                bottom:
                    BorderSide(color: ColorStyles().borderGray!, width: 0.5)),
            errorText: controller.globalKycDetailModel.isVehicleOwnershipMandatory! ? controller.isSubmitOnVehicleInfo
                ? validateLeadSource(controller.selectedVehicleOwnershipId)
                : null : null,
            errorStyle: TextStyles()
                .robotoSize14Regular(color: ColorStyles().errorRed!)
                .copyWith(fontSize: 12),
          ),
          _verticalSizeBox(),
          CommonImageButton(
            title: S.of(context).nocDocumention,
            imgUrl: controller.nocUrl,

            onTap: () {
              commonNavigator(
                  child: CommonImagePicker(
                pickedImage: (file) {
                  controller.pickFileData(
                    type: PicType.noc,
                    file: file,
                  );
                  if(controller.globalKycDetailModel.isNocDocumentationMandatory!){
                  validateImageFile(controller.nocPicFile);
                  }
                  controller.checkValidateVehicleInfo();
                },
                picker: ImagePicker(),
              ));
            },
            imgFile: controller.nocPicFile,
            errorText: controller.globalKycDetailModel.isNocDocumentationMandatory! ? controller.isSubmitOnVehicleInfo
                ? controller.nocUrl == ""
                    ? validateImageFile(controller.nocPicFile)
                    : null
                : null : null,
            errorStyle: TextStyles()
                .robotoSize14Regular(color: ColorStyles().errorRed!)
                .copyWith(fontSize: 12),
          ),
          /*TextInputField(
            hintText: S.of(context).nocDocumention,
            hintStyle: TextStyles().robotoSize14Regular(color: ColorStyles().darkGrey!.withAlpha((0.3*255).round())),
            controller: controller().nocController,
            focusNode: controller().nocFocusNode,
            onChanged: (value) {
              validateDropDown(controller().nocController.text);
              controller().checkValidateVehicleInfo();
              setState(() {

              });
            },
            keyboardType: TextInputType.number,
            containerwidth: 332.w,
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
            suffixicon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.h,vertical: 10.h),
              child: Image.asset(AppImg.icPdf),
            ),
            errorText: controller().isSubmitOnVehicleInfo ? validateDropDown(controller().nocController.text) : null,
            errorStyle: TextStyles().robotoSize14Regular(color: ColorStyles().errorRed!).copyWith(fontSize: 12),
          ),*/
          _verticalSizeBox(),
          TextInputField(
            hintText: S.of(context).loanNo,
            hintStyle: TextStyles().robotoSize14Regular(
                color: ColorStyles().darkGrey!.withAlpha((0.3 * 255).round())),
            controller: controller.loanNoController,
            focusNode: controller.loanNoFocusNode,
            inputFormatters: [
              // Custom input formatter to remove leading spaces
              // FilteringTextInputFormatter.allow(RegExp(r'^[^\s].*|[^\s].*')),
              FilteringTextInputFormatter.deny(RegExp(r'\s')), // Deny spaces
            ],
            onChanged: (value) {
              // validateDropDown(controller().loanNoController.text);
              // controller().checkValidateVehicleInfo();
              // setState(() {
              //
              // });
            },
            keyboardType: TextInputType.number,
            containerwidth: 332.w,
            containerheight: 48.h,
            containercolor: ColorStyles().white!,
            borderRadius: BorderRadius.zero,
            underline: false,
            underlinecolor: ColorStyles().borderGray!,
            contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
            containerborder: Border(
                bottom:
                    BorderSide(color: ColorStyles().borderGray!, width: 1.0)),
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
            textInputAction: TextInputAction.done,
            textFieldsBorder: false,
            textstyle:
                TextStyles().robotoSize14Regular(color: ColorStyles().black!),
            // errorText: controller().isSubmitOnVehicleInfo ? validateDropDown(controller().loanNoController.text) : null,
            // errorStyle: TextStyles().robotoSize14Regular(color: ColorStyles().errorRed!).copyWith(fontSize: 12),
          ),
          _verticalSizeBox(),
          TextInputField(
            hintText: S.of(context).dlNo,
            hintStyle: TextStyles().robotoSize14Regular(
                color: ColorStyles().darkGrey!.withAlpha((0.3 * 255).round())),
            controller: controller.dlNoController,
            focusNode: controller.dlNoFocusNode,
            inputFormatters: [
              // Custom input formatter to remove leading spaces
              // FilteringTextInputFormatter.deny(RegExp(r'\s')), // Deny spaces
              FilteringTextInputFormatter.allow(RegExp(r'^[^\s].*|[^\s].*')),
            ],
            maxLength: 16,
            onChanged: (value) {
              if (value.length == 16) {
                controller.dlNoFocusNode.unfocus();
                if(controller.globalKycDetailModel.isDlNoMandatory!){
                  controller.validateDLNumber2(value);
                }

              }
              controller.checkValidateVehicleInfo();
              setState(() {});
            },
            keyboardType: TextInputType.text,
            containerwidth: 332.w,
            containerheight: 48.h,
            containercolor: ColorStyles().white!,
            borderRadius: BorderRadius.zero,
            underline: false,
            underlinecolor: ColorStyles().borderGray!,
            contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
            containerborder: Border(
                bottom:
                    BorderSide(color: ColorStyles().borderGray!, width: 1.0)),
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
            textstyle:
                TextStyles().robotoSize14Regular(color: ColorStyles().black!),
            errorText: controller.globalKycDetailModel.isDlNoMandatory! ?  controller.isSubmitOnVehicleInfo
                ? validateDlNo(controller.dlNoController.text)
                : null : null,
            errorStyle: TextStyles()
                .robotoSize14Regular(color: ColorStyles().errorRed!)
                .copyWith(fontSize: 12),
          ),
          _verticalSizeBox(),
          CommonImageButton(
            title: S.of(context).dlPic,
            imgUrl: controller.dlUrl,

            onTap: () {
              commonNavigator(
                  child: CommonImagePicker(
                pickedImage: (file) {
                  controller.pickFileData(
                    type: PicType.dl,
                    file: file,
                  );
                  if(controller.globalKycDetailModel.isDlPicMandatory!){
                    validateImageFile(controller.dlPicFile);
                  }

                  controller.checkValidateVehicleInfo();
                },
                picker: ImagePicker(),
              ));
            },
            imgFile: controller.dlPicFile,
            errorText: controller.globalKycDetailModel.isDlPicMandatory! ?  controller.isSubmitOnVehicleInfo
                ? controller.dlUrl == ""
                    ? validateImageFile(controller.dlPicFile)
                    : null
                : null : null,
            errorStyle: TextStyles()
                .robotoSize14Regular(color: ColorStyles().errorRed!)
                .copyWith(fontSize: 12),
          ),
          _verticalSizeBox(),
          TextInputField(
            hintText: S.of(context).rcNo,
            hintStyle: TextStyles().robotoSize14Regular(
                color: ColorStyles().darkGrey!.withAlpha((0.3 * 255).round())),
            controller: controller.rcNoController,
            focusNode: controller.rcNoFocusNode,
            inputFormatters: [
              // Custom input formatter to remove leading spaces
              // FilteringTextInputFormatter.deny(RegExp(r'\s')), // Deny spaces
              FilteringTextInputFormatter.allow(RegExp(r'^[^\s].*|[^\s].*')),
            ],
            maxLength: 10,
            onChanged: (value) {
              if (value.length == 10) {
                controller.rcNoFocusNode.unfocus();
              }
              if(controller.globalKycDetailModel.isRcNoMandatory!){
                validateRcNo(controller.rcNoController.text);
              }

              controller.checkValidateVehicleInfo();
              setState(() {});
            },
            keyboardType: TextInputType.text,
            containerwidth: 332.w,
            containerheight: 48.h,
            containercolor: ColorStyles().white!,
            borderRadius: BorderRadius.zero,
            underline: false,
            underlinecolor: ColorStyles().borderGray!,
            contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
            containerborder: Border(
                bottom:
                    BorderSide(color: ColorStyles().borderGray!, width: 1.0)),
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
            textstyle:
                TextStyles().robotoSize14Regular(color: ColorStyles().black!),
            errorText: controller.globalKycDetailModel.isRcNoMandatory! ? controller.isSubmitOnVehicleInfo
                ? validateRcNo(controller.rcNoController.text)
                : null : null ,
            errorStyle: TextStyles()
                .robotoSize14Regular(color: ColorStyles().errorRed!)
                .copyWith(fontSize: 12),
          ),
          _verticalSizeBox(),
          CommonImageButton(
            title: S.of(context).rcPic,
            imgUrl: controller.rcUrl,

            onTap: () {
              commonNavigator(
                  child: CommonImagePicker(
                pickedImage: (file) {
                  controller.pickFileData(
                    type: PicType.rc,
                    file: file,
                  );
                  if(controller.globalKycDetailModel.isRcPicMandatory!){
                    validateImageFile(controller.rcPicFile);
                  }

                  controller.checkValidateVehicleInfo();
                },
                picker: ImagePicker(),
              ));
            },
            imgFile: controller.rcPicFile,
            errorText: controller.globalKycDetailModel.isRcPicMandatory! ? controller.isSubmitOnVehicleInfo
                ? controller.rcUrl == ""
                    ? validateImageFile(controller.rcPicFile)
                    : null
                : null : null,
            errorStyle: TextStyles()
                .robotoSize14Regular(color: ColorStyles().errorRed!)
                .copyWith(fontSize: 12),
          ),
          _verticalSizeBox(),
          TextInputField(
            hintText: S.of(context).registrationDate,
            hintStyle: TextStyles().robotoSize14Regular(
                color: ColorStyles().darkGrey!.withAlpha((0.3 * 255).round())),
            controller: controller.registrationDateController,
            onChanged: (value) {
              if(controller.globalKycDetailModel.isRegistrationDateMandatory!){
                validateDropDown(controller.registrationDateController.text);
              }

              controller.checkValidateVehicleInfo();
              setState(() {});
            },
            keyboardType: TextInputType.number,
            containerwidth: 332.w,
            containerheight: 48.h,
            containercolor: ColorStyles().white!,
            borderRadius: BorderRadius.zero,
            underline: false,
            readonly: true,
            onTap: () async {
              var pickDate = await showDatePicker(
                context: context,
                initialEntryMode: DatePickerEntryMode.calendarOnly,
                locale: const Locale('en', 'GB'),
                initialDate:DateTime.now(),
                firstDate: DateTime(1950),
                lastDate: DateTime.now(),
                builder: (context, child) {
                  return Theme(
                    data: Theme.of(context).copyWith(
                      datePickerTheme: DatePickerThemeData(
                        headerBackgroundColor: ColorStyles().orangePink!, // Header background color
                        headerForegroundColor: Colors.white, // Header text color
                        headerHeadlineStyle: TextStyles().robotoSize16SemiBold(color: ColorStyles().white!).copyWith(fontSize: 22.sp),
                      ),
                      dialogTheme:  DialogTheme(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero, // Removes rounded corners
                        ),
                      ),

                      colorScheme:
                      ColorScheme.light(
                        primary: ColorStyles().orangePink!,
                        onPrimary: Colors.white,
                        onSurface: Colors.black,
                      ),
                      textButtonTheme:
                      TextButtonThemeData(
                        style: TextButton.styleFrom(
                            foregroundColor:
                            Colors.black45,
                            textStyle: TextStyles().robotoSize16Bold(color: ColorStyles().grey!)
                        ),
                      ),
                    ),
                    child: child!,
                  );
                },
              );
              if (pickDate != null) {
                controller.registrationApiDateController.text = pickDate.toString();
                controller.registrationDateController.text =
                    DateFormat("dd/MM/yyyy").format(pickDate);
                debugPrint(
                    "PickDate => ${DateFormat("dd/MM/yyyy").format(pickDate)}");
                setState(() {});
              }
            },
            underlinecolor: ColorStyles().borderGray!,
            contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
            containerborder: Border(
                bottom:
                    BorderSide(color: ColorStyles().borderGray!, width: 1.0)),
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
            textInputAction: TextInputAction.done,
            textFieldsBorder: false,
            textstyle:
                TextStyles().robotoSize14Regular(color: ColorStyles().black!),
            suffixicon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 16.h),
              child: Image.asset(AppImg.icCalender),
            ),
            errorText: controller.globalKycDetailModel.isRegistrationDateMandatory! ? controller.isSubmitOnVehicleInfo
                ? validateDropDown(controller.registrationDateController.text)
                : null : null,
            errorStyle: TextStyles()
                .robotoSize14Regular(color: ColorStyles().errorRed!)
                .copyWith(fontSize: 12),
          ),
          _verticalSizeBox(),
          TextInputField(
            hintText: S.of(context).vehicleAge,
            hintStyle: TextStyles().robotoSize14Regular(
                color: ColorStyles().darkGrey!.withAlpha((0.3 * 255).round())),
            controller: controller.vehicleAgeController,
            onChanged: (value) {
              if(controller.globalKycDetailModel.isVehicleAgeMandatory!){
                validateDropDown(controller.vehicleAgeController.text);
              }
              controller.checkValidateVehicleInfo();
              setState(() {});
            },
            keyboardType: null,
            containerwidth: 332.w,
            containerheight: 48.h,
            containercolor: ColorStyles().white!,
            borderRadius: BorderRadius.zero,
            underline: false,
            readonly: true,
            onTap: () async {
              var pickDate = await showDatePicker(
                context: context,
                initialEntryMode: DatePickerEntryMode.calendarOnly,
                locale: const Locale('en', 'GB'),
                initialDate:DateTime.now(),
                firstDate: DateTime(1950),
                lastDate: DateTime.now(),
                builder: (context, child) {
                  return Theme(
                    data: Theme.of(context).copyWith(
                      datePickerTheme: DatePickerThemeData(
                        headerBackgroundColor: ColorStyles().orangePink!, // Header background color
                        headerForegroundColor: Colors.white, // Header text color
                        headerHeadlineStyle: TextStyles().robotoSize16SemiBold(color: ColorStyles().white!).copyWith(fontSize: 22.sp),
                      ),
                      dialogTheme:  DialogTheme(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero, // Removes rounded corners
                        ),
                      ),

                      colorScheme:
                      ColorScheme.light(
                        primary: ColorStyles().orangePink!,
                        onPrimary: Colors.white,
                        onSurface: Colors.black,
                      ),
                      textButtonTheme:
                      TextButtonThemeData(
                        style: TextButton.styleFrom(
                            foregroundColor:
                            Colors.black45,
                            textStyle: TextStyles().robotoSize16Bold(color: ColorStyles().grey!)
                        ),
                      ),
                    ),
                    child: child!,
                  );
                },
              );
              if (pickDate != null) {
                controller.vehicleDateController.text = pickDate.toString();

                DateTime today = DateTime.now();
                int age = today.year - pickDate.year;

                // Check if the birthday has occurred this year
                if (today.month < pickDate.month ||
                    (today.month == pickDate.month &&
                        today.day < pickDate.day)) {
                  age--;
                }
                controller.vehicleAgeController.text = age.toString();
                validateDropDown(controller.vehicleAgeController.text);
                controller.checkValidateVehicleInfo();
                setState(() {});

                // controller().vehicleAgeController.text = DateFormat("dd/MM/yyyy").format(pickDate);
                // debugPrint("PickDate => ${DateFormat("dd/MM/yyyy").format(pickDate)}");
                // setState(() {
                //
                // });
              }
            },
            underlinecolor: ColorStyles().borderGray!,
            contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
            containerborder: Border(
                bottom:
                    BorderSide(color: ColorStyles().borderGray!, width: 1.0)),
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
            textInputAction: TextInputAction.done,
            textFieldsBorder: false,
            textstyle:
                TextStyles().robotoSize14Regular(color: ColorStyles().black!),
            suffixicon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 16.h),
              child: Image.asset(AppImg.icCalender),
            ),
            errorText: controller.globalKycDetailModel.isVehicleAgeMandatory! ? controller.isSubmitOnVehicleInfo
                ? validateDropDown(controller.vehicleAgeController.text)
                : null : null,
            errorStyle: TextStyles()
                .robotoSize14Regular(color: ColorStyles().errorRed!)
                .copyWith(fontSize: 12),
          ),
          _verticalSizeBox(),
          CommonDropdown(
            onChangedsearch: (String? value) {
              if (value != null) {
                controller.onSelectVehicleMake(value);
              }
            },
            items: controller
                .vehicleMakeList
                .map((lead) => lead.name ?? "")
                .toList(), // Show names in dropdown
            selectedItem: controller
                .vehicleMakeList
                .firstWhere(
                  (lead) => lead.value == controller.selectedVehicleMakeId,
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
            containerwidth: 332.w,
            containerheight: 48.h,
            // containercolor: Color(0xffF9FAFB),
            containercolor: ColorStyles().white!,
            titleText: S.of(context).vehicleMake,
            textstyle: TextStyles().robotoSize14Regular(
                color: ColorStyles().darkGrey!.withAlpha((0.3 * 255).round())),
            itemTextStyle: TextStyles()
                .robotoSize14Regular(color: ColorStyles().cloudyGrey!),
            selectItemTextStyle:
                TextStyles().robotoSize14Regular(color: ColorStyles().black!),
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
                bottom:
                    BorderSide(color: ColorStyles().borderGray!, width: 0.5)),
            errorText: controller.globalKycDetailModel.isVehicleMakeMandatory! ?  controller.isSubmitOnVehicleInfo
                ? validateLeadSource(controller.selectedVehicleMakeId)
                : null : null,
            errorStyle: TextStyles()
                .robotoSize14Regular(color: ColorStyles().errorRed!)
                .copyWith(fontSize: 12),
          ),
          _verticalSizeBox(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: TextInputField(
                  hintText: S.of(context).latitude,
                  hintStyle: TextStyles().robotoSize14Regular(
                      color: ColorStyles()
                          .darkGrey!
                          .withAlpha((0.3 * 255).round())),
                  controller: controller.latitudeNoController,
                  focusNode: controller.latitudeNoFocusNode,
                  onChanged: (value) {
                    if(controller.globalKycDetailModel.isLatitudeMandatory!){
                      validateDropDown(controller.latitudeNoController.text);
                    }
                    controller.checkValidateVehicleInfo();
                    setState(() {});
                  },
                  keyboardType: TextInputType.number,
                  containerwidth: 332.w,
                  containerheight: 48.h,
                  containercolor: ColorStyles().white!,
                  borderRadius: BorderRadius.zero,
                  underline: false,
                  underlinecolor: ColorStyles().borderGray!,
                  contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
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
                  textInputAction: TextInputAction.done,
                  textFieldsBorder: false,
                  textstyle: TextStyles()
                      .robotoSize14Regular(color: ColorStyles().black!),
                  errorText: controller.globalKycDetailModel.isLatitudeMandatory! ? controller.isSubmitOnVehicleInfo
                      ? validateDropDown(controller.latitudeNoController.text)
                      : null : null,
                  errorStyle: TextStyles()
                      .robotoSize14Regular(color: ColorStyles().errorRed!)
                      .copyWith(fontSize: 12),
                ),
              ),
              SizedBox(
                width: 12.w,
              ),
              Expanded(
                child: TextInputField(
                  hintText: S.of(context).longitude,
                  hintStyle: TextStyles().robotoSize14Regular(
                      color: ColorStyles()
                          .darkGrey!
                          .withAlpha((0.3 * 255).round())),
                  controller: controller.longitudeNoController,
                  focusNode: controller.longitudeNoFocusNode,
                  onChanged: (value) {
                    if(controller.globalKycDetailModel.isLongitudeMandatory!){
                      validateDropDown(controller.longitudeNoController.text);
                    }
                    controller.checkValidateVehicleInfo();
                    setState(() {});
                  },
                  keyboardType: TextInputType.number,
                  containerwidth: 332.w,
                  containerheight: 48.h,
                  containercolor: ColorStyles().white!,
                  borderRadius: BorderRadius.zero,
                  underline: false,
                  underlinecolor: ColorStyles().borderGray!,
                  contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
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
                  textInputAction: TextInputAction.done,
                  textFieldsBorder: false,
                  textstyle: TextStyles()
                      .robotoSize14Regular(color: ColorStyles().black!),
                  errorText: controller.globalKycDetailModel.isLongitudeMandatory! ? controller.isSubmitOnVehicleInfo
                      ? validateDropDown(
                          controller.longitudeNoController.text)
                      : null : null,
                  errorStyle: TextStyles()
                      .robotoSize14Regular(color: ColorStyles().errorRed!)
                      .copyWith(fontSize: 12),
                ),
              ),
            ],
          ),
          _verticalSizeBox(),
          _verticalSizeBox(),
          Row(
            children: [
              Expanded(
                child: smallButton(
                  btnText: S.of(context).back,
                  btnTextColor: ColorStyles().orangePink!,
                  bgColor: ColorStyles().white!,
                  borderRadius: BorderRadius.circular(50.r),
                  borderColor: ColorStyles().orangePink!,
                  onTap: () {
                    controller.changeKYCSection(0);
                  },
                ),
              ),
              SizedBox(
                width: 12.w,
              ),
              Expanded(
                child: smallButton(
                  btnText: S.of(context).next,
                  btnTextColor: ColorStyles().white!,
                  bgColor: controller.isValidateVehicleInfo
                      ? ColorStyles().orangePink!
                      : ColorStyles().lavenderGrey!,
                  borderColor: ColorStyles().lavenderGrey!,
                  onTap: () {
                    if (!controller.isValidateVehicleInfo) {
                      controller.changeSubmitValue(true, 2);
                    } else {
                      controller.changeKYCSection(2);
                    }
                  },
                ),
              ),
            ],
          ),
          _verticalSizeBox(),
        ],
      ),
    );
  }

  Widget bankRefInformationSection({required BuildContext context, required EditKycVerificationScreenController controller}) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              commonText(
                  text: S.of(context).bankInformation,
                  style: TextStyles()
                      .robotoSize16Regular(color: ColorStyles().black!)),
              commonText(
                  text: "3/4",
                  style: TextStyles()
                      .robotoSize16Regular(color: ColorStyles().orangePink!)),
            ],
          ),
          Divider(
            color: ColorStyles().customBlue!,
          ),
          _verticalSizeBox(),
          CommonDropdown(
            onChangedsearch: (String? value) {
              if (value != null) {
                controller.onSelectBank(value);
              }
              controller.checkValidateBankInfo();
            },
            items: controller
                .bankList
                .map((lead) => lead.name ?? "")
                .toList(), // Show names in dropdown
            selectedItem: controller
                .bankList
                .firstWhere(
                  (lead) => lead.value == controller.selectedBankId,
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
            containerwidth: 332.w,
            containerheight: 48.h,
            // containercolor: Color(0xffF9FAFB),
            containercolor: ColorStyles().white!,
            titleText: S.of(context).bankName,
            textstyle: TextStyles().robotoSize14Regular(
                color: ColorStyles().darkGrey!.withAlpha((0.3 * 255).round())),
            itemTextStyle: TextStyles()
                .robotoSize14Regular(color: ColorStyles().cloudyGrey!),
            selectItemTextStyle:
                TextStyles().robotoSize14Regular(color: ColorStyles().black!),
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
                bottom:
                    BorderSide(color: ColorStyles().borderGray!, width: 0.5)),
            errorText: controller.globalKycDetailModel.isBankNameMandatory! ? controller.isSubmitOnGenInfo
                ? validateLeadSource(controller.selectedBankId)
                : null : null ,
            errorStyle: TextStyles()
                .robotoSize14Regular(color: ColorStyles().errorRed!)
                .copyWith(fontSize: 12),
          ),
          _verticalSizeBox(),
          TextInputField(
            hintText: S.of(context).accountNo,
            hintStyle: TextStyles().robotoSize14Regular(
                color: ColorStyles().darkGrey!.withAlpha((0.3 * 255).round())),
            controller: controller.accountNoController,
            focusNode: controller.accountNoFocusNode,
            inputFormatters: [
              // Custom input formatter to remove leading spaces
              FilteringTextInputFormatter.deny(RegExp(r'\s')), // Deny spaces
              // FilteringTextInputFormatter.allow(RegExp(r'^[^\s].*|[^\s].*')),
            ],
            onChanged: (value) {
              if(controller.globalKycDetailModel.isAccountNoMandatory!){
                validateDropDown(controller.accountNoController.text);
              }

              controller.checkValidateBankInfo();
              setState(() {});
            },
            keyboardType: TextInputType.number,
            containerwidth: 332.w,
            containerheight: 48.h,
            containercolor: ColorStyles().white!,
            borderRadius: BorderRadius.zero,
            underline: false,
            underlinecolor: ColorStyles().borderGray!,
            contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
            containerborder: Border(
                bottom:
                    BorderSide(color: ColorStyles().borderGray!, width: 1.0)),
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
            textInputAction: TextInputAction.done,
            textFieldsBorder: false,
            textstyle:
                TextStyles().robotoSize14Regular(color: ColorStyles().black!),
            errorText: controller.globalKycDetailModel.isAccountNoMandatory! ? controller.isSubmitOnBankInfo
                ? validateDropDown(controller.accountNoController.text)
                : null : null,
            errorStyle: TextStyles()
                .robotoSize14Regular(color: ColorStyles().errorRed!)
                .copyWith(fontSize: 12),
          ),
          _verticalSizeBox(),
          TextInputField(
            hintText: S.of(context).ifscCode,
            hintStyle: TextStyles().robotoSize14Regular(
                color: ColorStyles().darkGrey!.withAlpha((0.3 * 255).round())),
            controller: controller.ifscCodeController,
            focusNode: controller.ifscCodeFocusNode,
            inputFormatters: [
              // Custom input formatter to remove leading spaces
              FilteringTextInputFormatter.deny(RegExp(r'\s')), // Deny spaces
              // FilteringTextInputFormatter.allow(RegExp(r'^[^\s].*|[^\s].*')),
            ],
            onChanged: (value) {
              if(controller.globalKycDetailModel.isIfscCodeMandatory!){
                validateIFSCCode(controller.ifscCodeController.text);
              }

              controller.checkValidateBankInfo();
              setState(() {});
            },
            keyboardType: TextInputType.text,
            containerwidth: 332.w,
            containerheight: 48.h,
            containercolor: ColorStyles().white!,
            borderRadius: BorderRadius.zero,
            underline: false,
            underlinecolor: ColorStyles().borderGray!,
            contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
            containerborder: Border(
                bottom:
                    BorderSide(color: ColorStyles().borderGray!, width: 1.0)),
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
            textInputAction: TextInputAction.done,
            textFieldsBorder: false,
            textstyle:
                TextStyles().robotoSize14Regular(color: ColorStyles().black!),
            errorText: controller.globalKycDetailModel.isIfscCodeMandatory! ?  controller.isSubmitOnBankInfo
                ? validateIFSCCode(controller.ifscCodeController.text)
                : null : null,
            errorStyle: TextStyles()
                .robotoSize14Regular(color: ColorStyles().errorRed!)
                .copyWith(fontSize: 12),
          ),
          _verticalSizeBox(),
          CommonImageButton(
            title: S.of(context).blankChequePic,
            imgUrl: controller.bankChequeUrl,

            onTap: () {
              commonNavigator(
                  child: CommonImagePicker(
                pickedImage: (file) {
                  controller.pickFileData(
                    type: PicType.bankCheque,
                    file: file,
                  );
                  if(controller.globalKycDetailModel.isBankChequePicMandatory!){
                    validateImageFile(controller.bankChequePicFile);
                  }

                  controller.checkValidateBankInfo();
                },
                picker: ImagePicker(),
              ));
            },
            imgFile: controller.bankChequePicFile,
            errorText: controller.globalKycDetailModel.isBankChequePicMandatory! ? controller.isSubmitOnBankInfo
                ? controller.bankChequeUrl == ""
                    ? validateImageFile(controller.bankChequePicFile)
                    : null
                : null : null,
            errorStyle: TextStyles()
                .robotoSize14Regular(color: ColorStyles().errorRed!)
                .copyWith(fontSize: 12),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              commonText(
                  text: S.of(context).refInformation,
                  style: TextStyles().robotoSize16Regular(color: Colors.black)),
              commonText(
                  text: "4/4",
                  style: TextStyles()
                      .robotoSize16Regular(color: ColorStyles().orangePink!)),
            ],
          ),
          Divider(
            color: ColorStyles().customBlue!,
          ),
          if (controller.selfieList.isNotEmpty) buildPhotoGrid(controller: controller),
          _verticalSizeBox(),
          if (controller.selfieList.length <= 5)
            CommonImageButton(
              title: S.of(context).selfieWithDriver,

              onTap: () {
                commonNavigator(
                    child: CommonImagePicker(
                  pickedImage: (file) {
                    controller.pickFileData(
                      type: PicType.selfie,
                      file: file,
                    );
                    if(controller.globalKycDetailModel.isSelfieWithDriverPicMandatory!){

                    }
                    // validateMultipleImages(
                    //   controller().selfieList,
                    // );
                    controller.checkValidateBankInfo();
                  },
                  picker: ImagePicker(),
                ));
              },
              errorText: controller.globalKycDetailModel.isSelfieWithDriverPicMandatory! ? controller.selfieList.isEmpty ? "Please select at least 1 image."
                  : null : null,
              errorStyle: TextStyles()
                  .robotoSize14Regular(color: ColorStyles().errorRed!)
                  .copyWith(fontSize: 12),
            ),
          _verticalSizeBox(),
          TextInputField(
            hintText: S.of(context).referenceGuarantor1Name,
            hintStyle: TextStyles().robotoSize14Regular(
                color: ColorStyles().darkGrey!.withAlpha((0.3 * 255).round())),
            controller: controller.firstReferenceNameController,
            focusNode: controller.firstReferenceNameFocusNode,
            inputFormatters: [
              // Custom input formatter to remove leading spaces
              FilteringTextInputFormatter.allow(RegExp(r'^[^\s].*|[^\s].*')),
            ],
            onChanged: (value) {
              if(controller.globalKycDetailModel.isReference1NameMandatory!){
                validateDropDown(controller.firstReferenceNameController.text);
              }

              controller.checkValidateBankInfo();
              setState(() {});
            },
            keyboardType: TextInputType.text,
            containerwidth: 332.w,
            containerheight: 48.h,
            containercolor: ColorStyles().white!,
            borderRadius: BorderRadius.zero,
            underline: false,
            underlinecolor: ColorStyles().borderGray!,
            contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
            containerborder: Border(
                bottom:
                    BorderSide(color: ColorStyles().borderGray!, width: 1.0)),
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
            textstyle:
                TextStyles().robotoSize14Regular(color: ColorStyles().black!),
            errorText: controller.globalKycDetailModel.isReference1NameMandatory! ?  controller.isSubmitOnBankInfo
                ? validateDropDown(
                    controller.firstReferenceNameController.text)
                : null : null,
            errorStyle: TextStyles()
                .robotoSize14Regular(color: ColorStyles().errorRed!)
                .copyWith(fontSize: 12),
          ),
          _verticalSizeBox(),
          TextInputField(
            hintText: S.of(context).referenceGuarantor1MobileNo,
            hintStyle: TextStyles().robotoSize14Regular(
                color: ColorStyles().darkGrey!.withAlpha((0.3 * 255).round())),
            controller: controller.firstReferenceMobileNoController,
            focusNode: controller.firstReferenceMobileNoFocusNode,
            maxLength: 10,
            inputFormatters: [
              FilteringTextInputFormatter.deny(RegExp(r'\s')), // Deny spaces
            ],
            onChanged: (value) {
              if(value.length == 10){
                controller.firstReferenceMobileNoFocusNode.unfocus();
                if(controller.globalKycDetailModel.isReference1MobileMandatory!){
                  validatePhone(
                      controller.firstReferenceMobileNoController.text.trim());
                }

              }
              controller.checkValidateBankInfo();
              setState(() {});
            },
            keyboardType: TextInputType.number,
            containerwidth: 332.w,
            containerheight: 48.h,
            containercolor: ColorStyles().white!,
            borderRadius: BorderRadius.zero,
            underline: false,
            underlinecolor: ColorStyles().borderGray!,
            contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
            containerborder: Border(
                bottom:
                    BorderSide(color: ColorStyles().borderGray!, width: 1.0)),
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
            textInputAction: TextInputAction.done,
            textFieldsBorder: false,
            textstyle:
                TextStyles().robotoSize14Regular(color: ColorStyles().black!),
            errorText:  controller.globalKycDetailModel.isReference1MobileMandatory! ? controller.isSubmitOnBankInfo
                ? validatePhone(
                    controller.firstReferenceMobileNoController.text)
                : null : null,
            errorStyle: TextStyles()
                .robotoSize14Regular(color: ColorStyles().errorRed!)
                .copyWith(fontSize: 12),
          ),
          _verticalSizeBox(),
          TextInputField(
            hintText: S.of(context).referenceGuarantor2Name,
            hintStyle: TextStyles().robotoSize14Regular(
                color: ColorStyles().darkGrey!.withAlpha((0.3 * 255).round())),
            controller: controller.secondReferenceNameController,
            focusNode: controller.secondReferenceNameFocusNode,
            inputFormatters: [
              // Custom input formatter to remove leading spaces
              FilteringTextInputFormatter.allow(RegExp(r'^[^\s].*|[^\s].*')),
            ],
            onChanged: (value) {
              if(controller.globalKycDetailModel.isReference2NameMandatory!){
                validateDropDown(controller.secondReferenceNameController.text);
              }

              controller.checkValidateBankInfo();
              setState(() {});
            },
            keyboardType: TextInputType.text,
            containerwidth: 332.w,
            containerheight: 48.h,
            containercolor: ColorStyles().white!,
            borderRadius: BorderRadius.zero,
            underline: false,
            underlinecolor: ColorStyles().borderGray!,
            contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
            containerborder: Border(
                bottom:
                    BorderSide(color: ColorStyles().borderGray!, width: 1.0)),
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
            textstyle:
                TextStyles().robotoSize14Regular(color: ColorStyles().black!),
            errorText: controller.globalKycDetailModel.isReference2NameMandatory! ? controller.isSubmitOnBankInfo
                ? validateDropDown(
                    controller.secondReferenceNameController.text)
                : null :null,
            errorStyle: TextStyles()
                .robotoSize14Regular(color: ColorStyles().errorRed!)
                .copyWith(fontSize: 12),
          ),
          _verticalSizeBox(),
          TextInputField(
            hintText: S.of(context).referenceGuarantor2MobileNo,
            hintStyle: TextStyles().robotoSize14Regular(
                color: ColorStyles().darkGrey!.withAlpha((0.3 * 255).round())),
            controller: controller.secondReferenceMobileNoController,
            focusNode: controller.secondReferenceMobileNoFocusNode,
            maxLength: 10,
            inputFormatters: [
              FilteringTextInputFormatter.deny(RegExp(r'\s')), // Deny spaces
            ],
            onChanged: (value) {
              if(value.length == 10){
                controller.secondReferenceMobileNoFocusNode.unfocus();
                if(controller.globalKycDetailModel.isReference2MobileMandatory!){
                  validatePhone(
                      controller.secondReferenceMobileNoController.text.trim());
                }

              }
              controller.checkValidateBankInfo();
              setState(() {});
            },
            keyboardType: TextInputType.number,
            containerwidth: 332.w,
            containerheight: 48.h,
            containercolor: ColorStyles().white!,
            borderRadius: BorderRadius.zero,
            underline: false,
            underlinecolor: ColorStyles().borderGray!,
            contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
            containerborder: Border(
                bottom:
                    BorderSide(color: ColorStyles().borderGray!, width: 1.0)),
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
            textInputAction: TextInputAction.done,
            textFieldsBorder: false,
            textstyle:
                TextStyles().robotoSize14Regular(color: ColorStyles().black!),
            errorText: controller.globalKycDetailModel.isReference2MobileMandatory! ? controller.isSubmitOnBankInfo
                ? validatePhone(
                    controller.secondReferenceMobileNoController.text)
                : null : null,
            errorStyle: TextStyles()
                .robotoSize14Regular(color: ColorStyles().errorRed!)
                .copyWith(fontSize: 12),
          ),
          _verticalSizeBox(),
          CommonDropdown(
            onChangedsearch: (String? value) {
              if (value != null) {
                controller.onSelectHouseOwnership(value);
              }
            },
            items: controller
                .houseOwnershipList
                .map((lead) => lead.name ?? "")
                .toList(), // Show names in dropdown
            selectedItem: controller
                .houseOwnershipList
                .firstWhere(
                  (lead) => lead.value == controller.selectedHouseOwnershipId,
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
            containerwidth: 332.w,
            containerheight: 48.h,
            // containercolor: Color(0xffF9FAFB),
            containercolor: ColorStyles().white!,
            titleText: S.of(context).houseOwnership,
            textstyle: TextStyles().robotoSize14Regular(
                color: ColorStyles().darkGrey!.withAlpha((0.3 * 255).round())),
            itemTextStyle: TextStyles()
                .robotoSize14Regular(color: ColorStyles().cloudyGrey!),
            selectItemTextStyle:
                TextStyles().robotoSize14Regular(color: ColorStyles().black!),
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
                bottom:
                    BorderSide(color: ColorStyles().borderGray!, width: 0.5)),
            errorText: controller.globalKycDetailModel.isHouseOwnershipMandatory! ?  controller.isSubmitOnBankInfo
                ? validateLeadSource(controller.selectedHouseOwnershipId)
                : null : null,
            errorStyle: TextStyles()
                .robotoSize14Regular(color: ColorStyles().errorRed!)
                .copyWith(fontSize: 12),
          ),
          _verticalSizeBox(),
          CommonImageButton(
            title:
                "${S.of(context).electricityBill} / ${S.of(context).waterBill} (${S.of(context).jpg},${S.of(context).png})",

            onTap: () {
              commonNavigator(
                  child: CommonImagePicker(
                pickedImage: (file) {
                  controller.pickFileData(
                    type: PicType.bill,
                    file: file,
                  );
                  if(controller.globalKycDetailModel.isElectricityBillMandatory!){
                    validateImageFile(controller.billPicFile);
                  }

                  controller.checkValidateBankInfo();
                },
                picker: ImagePicker(),
              ));
            },
            imgFile: controller.billPicFile,
            imgUrl: controller.billUrl,
            errorText: controller.globalKycDetailModel.isElectricityBillMandatory! ?controller.isSubmitOnBankInfo
                ? controller.billUrl == ""
                    ? validateImageFile(controller.billPicFile)
                    : null
                : null : null,
            errorStyle: TextStyles()
                .robotoSize14Regular(color: ColorStyles().errorRed!)
                .copyWith(fontSize: 12),
          ),
          _verticalSizeBox(),
          TextInputField(
            hintText: S.of(context).cibilScore,
            hintStyle: TextStyles().robotoSize14Regular(
                color: ColorStyles().darkGrey!.withAlpha((0.3 * 255).round())),
            controller: controller.cibilScoreController,
            focusNode: controller.cibilFocusNode,
            onChanged: (value) {
              if(controller.globalKycDetailModel.isCibilScoreMandatory!){
                validateDropDown(controller.cibilScoreController.text);
              }

              controller.checkValidateBankInfo();
              setState(() {});
            },
            keyboardType: TextInputType.number,
            containerwidth: 332.w,
            containerheight: 48.h,
            containercolor: ColorStyles().white!,
            borderRadius: BorderRadius.zero,
            underline: false,
            underlinecolor: ColorStyles().borderGray!,
            contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
            containerborder: Border(
                bottom:
                    BorderSide(color: ColorStyles().borderGray!, width: 1.0)),
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
            textInputAction: TextInputAction.done,
            textFieldsBorder: false,
            textstyle:
                TextStyles().robotoSize14Regular(color: ColorStyles().black!),
            errorText: controller.globalKycDetailModel.isCibilScoreMandatory! ? controller.isSubmitOnBankInfo
                ? validateDropDown(controller.cibilScoreController.text)
                : null : null,
            errorStyle: TextStyles()
                .robotoSize14Regular(color: ColorStyles().errorRed!)
                .copyWith(fontSize: 12),
          ),
          _verticalSizeBox(),
          _verticalSizeBox(),
          Row(
            children: [
              Expanded(
                child: smallButton(
                  btnText: S.of(context).back,
                  btnTextColor: ColorStyles().orangePink!,
                  bgColor: ColorStyles().white!,
                  borderRadius: BorderRadius.circular(50.0),
                  borderColor: ColorStyles().orangePink!,
                  onTap: () {
                    controller.changeKYCSection(1);
                  },
                ),
              ),
              SizedBox(
                width: 12.w,
              ),
              Expanded(
                child: smallButton(
                  btnText: S.of(context).save,
                  btnTextColor: ColorStyles().white!,
                  bgColor: controller.isValidateBankInfo
                      ? ColorStyles().orangePink!
                      : ColorStyles().lavenderGrey!,
                  borderColor: ColorStyles().lavenderGrey!,
                  onTap: () async {
                    if (!controller.isValidateBankInfo) {
                      controller.changeSubmitValue(true, 3);
                    } else {
                      controller.insertLeadKyc();
                      // commonNavigator(child: KycSuccessfullyScreen());
                    }
                  },
                ),
              ),
            ],
          ),
          _verticalSizeBox(),
        ],
      ),
    );
  }

  Widget commonPickImageButton(
      {required String title, void Function()? onTap, File? pickFile}) {
    return GestureDetector(
      onTap: onTap,
      child: pickFile == null
          ? Container(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              decoration: BoxDecoration(
                color: ColorStyles().white!,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: ColorStyles().borderGray!),
                boxShadow: [
                  BoxShadow(
                    color: ColorStyles().softLavenderBlue!.withAlpha(
                        (0.4 * 255).round()), // Shadow color with 7% opacity
                    offset: Offset(0, 0), // X and Y offset
                    blurRadius: 5, // Blur radius
                    spreadRadius: 0, // Spread radius
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppImg.icImg,
                    height: 40.h,
                    width: 40.w,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  commonText(
                      text: title,
                      style: TextStyles()
                          .robotoSize12Light(color: Colors.black)
                          .copyWith(fontSize: 10))
                ],
              ),
            )
          : Container(
              height: 64.h,
              padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 12.w),
              decoration: BoxDecoration(
                color: ColorStyles().white!,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: ColorStyles().borderGray!),
                boxShadow: [
                  BoxShadow(
                    color: ColorStyles().softLavenderBlue!.withAlpha(
                        (0.4 * 255).round()), // Shadow color with 7% opacity
                    offset: Offset(0, 0), // X and Y offset
                    blurRadius: 5, // Blur radius
                    spreadRadius: 0, // Spread radius
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 64.h,
                      width: 120.w,
                      child: Image.file(
                        pickFile,
                        fit: BoxFit.fill,
                      )),
                ],
              ),
            ),
    );
  }

  Widget commonShowPicImage({required File imgFile}) {
    return Container(
      height: 64.h,
      padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 12.w),
      decoration: BoxDecoration(
        color: ColorStyles().white!,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: ColorStyles().borderGray!),
        boxShadow: [
          BoxShadow(
            color: ColorStyles()
                .softLavenderBlue!
                .withAlpha((0.4 * 255).round()), // Shadow color with 7% opacity
            offset: Offset(0, 0), // X and Y offset
            blurRadius: 5, // Blur radius
            spreadRadius: 0, // Spread radius
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              height: 64.h,
              width: 120.w,
              child: Image.file(
                imgFile,
                fit: BoxFit.fill,
              )),
        ],
      ),
    );
  }

  // Helper Method: Photo Grid

  Widget buildPhotoGrid({required EditKycVerificationScreenController controller}) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: controller.selfieList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.953,
        crossAxisSpacing: 1.sw * 0.03,
        mainAxisSpacing: 1.sh * 0.02,
      ),
      itemBuilder: (context, index) {
        return Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: BoxDecoration(
                color: ColorStyles().white!,
                borderRadius: BorderRadius.circular(4.0),
                border: Border.all(color: ColorStyles().grey!, width: 1.0),
                boxShadow: [
                  BoxShadow(
                    color: ColorStyles()
                        .softLavenderBlue!
                        .withAlpha((0.2 * 255).round()), // Softer shadow
                    offset: Offset(0, 2), // Slightly offset shadow
                    blurRadius: 8, // Increased blur radius
                    spreadRadius: 0, // Spread radius
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4.0),
                child: controller.selfieList[index]['url'] != ""
                    ? Image.network(
                        controller.selfieList[index]['url'],
                        // height: 100.h,
                        fit: BoxFit.fill,
                      )
                    : Image.file(
                        controller.selfieList[index]['file'],
                        // height: 100.h,
                        fit: BoxFit.fill,
                      ),
              ),
            ),
            Positioned(
              top: 4.0,
              right: 4.0,
              child: GestureDetector(
                onTap: () {
                  controller.selfieList.removeAt(index);
                  controller.checkValidateBankInfo();
                  setState(() {});
                },
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white54),
                  child: Icon(
                    Icons.close,
                    color: Colors.black.withOpacity(0.8),
                    size: 16.h,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

/*  Widget buildPhotoGrid() {
    controller()=> ref.read(kycVerificationScreenControllerProvider.notifier);
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: controller().selfieList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        childAspectRatio: 0.953,
        crossAxisSpacing: 1.sw * 0.02,
        mainAxisSpacing: 1.sh * 0.02,
      ),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: ColorStyles().white!,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: ColorStyles().orangePink!, width: 2.0),
            boxShadow: [
              BoxShadow(
                color: ColorStyles().softLavenderBlue!.withAlpha((0.2 * 255).round()), // Softer shadow
                offset: Offset(0, 2), // Slightly offset shadow
                blurRadius: 8, // Increased blur radius
                spreadRadius: 0, // Spread radius
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            clipBehavior: Clip.hardEdge,
            child: Image.file(controller().selfieList[index],
              fit: BoxFit.fill,
            ),
          ),
        );
      },
    );
  }*/

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
        padding: padding ?? EdgeInsets.symmetric(vertical: 12.0),
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: borderRadius ?? BorderRadius.circular(15.r),
            border:
                Border.all(color: borderColor ?? ColorStyles().orangePink!)),
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
}
