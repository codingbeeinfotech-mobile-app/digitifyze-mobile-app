 import 'package:digitifyze/ui/screens/tab/home/product_assign_screen/product_assign_controller.dart';
import 'package:digitifyze/ui/widgets/common_widgets/common_dropdown.dart';
import 'package:digitifyze/ui/widgets/common_widgets/common_iconbutton.dart';
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

class ProductAssignFormScreen extends ConsumerStatefulWidget{
  const ProductAssignFormScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProductAssignFormState();
}

class _ProductAssignFormState extends ConsumerState<ProductAssignFormScreen> {
  @override
  Widget build(BuildContext context) {

    final asyncState = ref.watch(productAssignControllerProvider);

    return Scaffold(
      backgroundColor: ColorStyles().whiteLilac!,
      body: asyncState.when(
        data: (data) {
        return SizedBox(
          height: 1.sh,
          child: Stack(
            children: [
              _buildTopBar(context),
              _buildInputFiledSection(context),
            ],
          ),
        );
      },
          error: (error, stackTrace) {
           return ErrorWidget(error);
          },
          loading: () {
            return CommonLoader();
          },
      ),
    );
  }

  Widget _buildTopBar (context) {
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
                borderRadius: BorderRadius.circular(50.r),
              ),
              centericon: Icon(Icons.arrow_back_outlined,color: ColorStyles().white!,),
              onPressed: () {
                Navigator.pop(context);
              },

            ),
            centerTitle: true,
            title: commonText(text : S.of(context).productAssign,style: TextStyles().robotoSize16SemiBold(color: ColorStyles().white!).copyWith(fontSize: 20.sp)),
          ),
        ],
      ),
    );
  }

  Widget _buildInputFiledSection (context) {
    controller() => ref.read(productAssignControllerProvider.notifier);
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CommonImageButton(
                  title: S.of(context).rickshawID,

                  onTap: () {
                    commonNavigator(child: CommonImagePicker(
                      pickedImage: (file) {
                        controller().pickFileData(type: PicType.rickshawId, file: file,);
                        validateImageFile(controller().rickshawIdFile);
                      },
                      picker: ImagePicker(),
                    ));
                  },
                  imgFile: controller().rickshawIdFile,
                  errorText: controller().isSave ? validateImageFile(controller().rickshawIdFile) : null,
                  errorStyle: TextStyles().robotoSize14Regular(color: ColorStyles().errorRed!).copyWith(fontSize: 12),
                ),
                _verticalSizeBox(),
                CommonImageButton(
                  title: S.of(context).batteryID,

                  onTap: () {
                    commonNavigator(child: CommonImagePicker(
                      pickedImage: (file) {
                        controller().pickFileData(type: PicType.batteryId, file: file,);
                        validateImageFile(controller().batteryIdFile);
                      },
                      picker: ImagePicker(),
                    ));
                  },
                  imgFile: controller().batteryIdFile,
                  errorText: controller().isSave ? validateImageFile(controller().batteryIdFile) : null,
                  errorStyle: TextStyles().robotoSize14Regular(color: ColorStyles().errorRed!).copyWith(fontSize: 12),
                ),
                _verticalSizeBox(),
                CommonImageButton(
                  title: S.of(context).chargerID,

                  onTap: () {
                    commonNavigator(child: CommonImagePicker(
                      pickedImage: (file) {
                        controller().pickFileData(type: PicType.chargerId, file: file,);
                        validateImageFile(controller().chargerIdFile);
                      },
                      picker: ImagePicker(),
                    ));
                  },
                  imgFile: controller().chargerIdFile,
                  errorText: controller().isSave ? validateImageFile(controller().chargerIdFile) : null,
                  errorStyle: TextStyles().robotoSize14Regular(color: ColorStyles().errorRed!).copyWith(fontSize: 12),
                ),
                _verticalSizeBox(),
                TextInputField(
                  hintText: '${S.of(context).assetsHandoverDate}',
                  hintStyle: TextStyles().robotoSize14Regular(color: ColorStyles().darkGrey!.withAlpha((0.3*255).round())),
                  controller: controller().assetsHandoverDateController,
                  focusNode: controller().assetsHandoverDateFocusNode,
                  onChanged: (value) {
                    validateDropDown(controller().assetsHandoverDateController.text);
                    // controller().checkValidateGeneralInfo();
                    setState(() {

                    });
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
                      firstDate: DateTime(1950),
                      lastDate: DateTime(2030),
                    );
                    if(pickDate != null){
                      controller().assetsHandoverDateController.text = DateFormat("dd/MMM/yy").format(pickDate);
                      debugPrint("PickDate => ${DateFormat("dd/MMM/yy").format(pickDate)}");
                      setState(() {

                      });
                    }
                  },
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
                    padding: EdgeInsets.symmetric(horizontal: 16.h,vertical: 16.h),
                    child: Image.asset(AppImg.icCalender),
                  ),
                  // errorText: controller().isSubmitOnGenInfo ? validateDropDown(controller().dobController.text) : null,
                  // errorStyle: TextStyles().robotoSize14Regular(color: ColorStyles().errorRed!).copyWith(fontSize: 12),
                ),
                _verticalSizeBox(),
                TextInputField(
                  hintText: '${S.of(context).emiStartDate} (DD/MMM/YY)',
                  hintStyle: TextStyles().robotoSize14Regular(color: ColorStyles().darkGrey!.withAlpha((0.3*255).round())),
                  controller: controller().emiStartDateController,
                  focusNode: controller().emiStartDateFocusNode,
                  onChanged: (value) {
                    validateDropDown(controller().emiStartDateController.text);
                    // controller().checkValidateGeneralInfo();
                    setState(() {

                    });
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
                      firstDate: DateTime(1950),
                      lastDate: DateTime(2030),
                    );
                    if(pickDate != null){
                      controller().emiStartDateController.text = DateFormat("dd/MMM/yy").format(pickDate);
                      debugPrint("PickDate => ${DateFormat("dd/MMM/yy").format(pickDate)}");
                      setState(() {

                      });
                    }
                  },
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
                    padding: EdgeInsets.symmetric(horizontal: 16.h,vertical: 16.h),
                    child: Image.asset(AppImg.icCalender),
                  ),
                  // errorText: controller().isSubmitOnGenInfo ? validateDropDown(controller().dobController.text) : null,
                  // errorStyle: TextStyles().robotoSize14Regular(color: ColorStyles().errorRed!).copyWith(fontSize: 12),
                ),
                _verticalSizeBox(),
                CommonDropdown(
                  onChangedsearch: (String? value) {
                    if(value != null){
                      controller().physicalWarrantyCardHandover = value;
                      validateDropDown(controller().physicalWarrantyCardHandover);
                      // controller().checkValidateGeneralInfo();
                      setState(() {

                      });
                    }
                  },
                  items: ['Yes','No',],
                  selectedItem: controller().physicalWarrantyCardHandover.isNotEmpty ? controller().physicalWarrantyCardHandover : null,
                  // isExpansion: true,
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
                  titleText: S.of(context).physicalWarrantyCardHandover,
                  textstyle: TextStyles().robotoSize14Regular(color: ColorStyles().darkGrey!.withAlpha((0.3*255).round())),
                  itemTextStyle: TextStyles().robotoSize14Regular(color: ColorStyles().cloudyGrey!),
                  selectItemTextStyle : TextStyles().robotoSize14Regular(color: ColorStyles().black!),
                  boxShadow: [
                    BoxShadow(
                      color: ColorStyles().softLavenderBlue!.withAlpha((0.4 * 255).round()),// Shadow color with 7% opacity
                      offset: Offset(0, 0), // X and Y offset
                      blurRadius: 5, // Blur radius
                      spreadRadius: 0, // Spread radius
                    ),
                  ],
                  border: Border(
                      bottom: BorderSide(color: ColorStyles().borderGray!,width: 0.5)
                  ),
                  errorText: controller().isSave ? validateDropDown(controller().physicalWarrantyCardHandover) : null,
                  errorStyle: TextStyles().robotoSize14Regular(color: ColorStyles().errorRed!).copyWith(fontSize: 12),
                ),
                _verticalSizeBox(),
                CommonDropdown(
                  onChangedsearch: (String? value) {
                    if(value != null){
                      controller().brandingMaterial = value;
                      validateDropDown(controller().brandingMaterial);
                      // controller().checkValidateGeneralInfo();
                      setState(() {

                      });
                    }
                  },
                  items: ['Yes','No',],
                  selectedItem: controller().brandingMaterial.isNotEmpty ? controller().brandingMaterial : null,
                  // isExpansion: true,
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
                  titleText: S.of(context).brandingMaterial,
                  textstyle: TextStyles().robotoSize14Regular(color: ColorStyles().darkGrey!.withAlpha((0.3*255).round())),
                  itemTextStyle: TextStyles().robotoSize14Regular(color: ColorStyles().cloudyGrey!),
                  selectItemTextStyle : TextStyles().robotoSize14Regular(color: ColorStyles().black!),
                  boxShadow: [
                    BoxShadow(
                      color: ColorStyles().softLavenderBlue!.withAlpha((0.4 * 255).round()),// Shadow color with 7% opacity
                      offset: Offset(0, 0), // X and Y offset
                      blurRadius: 5, // Blur radius
                      spreadRadius: 0, // Spread radius
                    ),
                  ],
                  border: Border(
                      bottom: BorderSide(color: ColorStyles().borderGray!,width: 0.5)
                  ),
                  errorText: controller().isSave ? validateDropDown(controller().brandingMaterial) : null,
                  errorStyle: TextStyles().robotoSize14Regular(color: ColorStyles().errorRed!).copyWith(fontSize: 12),
                ),
                _verticalSizeBox(),
                _verticalSizeBox(),
                _verticalSizeBox(),
                smallButton(
                    btnText: S.of(context).save,
                    padding: EdgeInsets.symmetric(horizontal: 50.w,vertical: 16.h),
                    borderRadius: BorderRadius.circular(50.r),
                    btnTextColor: ColorStyles().white!,
                    bgColor: ColorStyles().orangePink!,
                    onTap: () {
                      controller().changeSaveValue(true);
                    },
                ),

              ],
            ),
          ),
        ));
  }

  Widget smallButton ({required String btnText,required Color btnTextColor,required Color bgColor, Color? borderColor,EdgeInsetsGeometry? padding,BorderRadiusGeometry? borderRadius,void Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding ?? EdgeInsets.symmetric(vertical: 12.0),
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: borderRadius ??BorderRadius.circular(15.r),
            border: Border.all(color: borderColor ?? ColorStyles().orangePink!)
        ),
        child: Text(btnText,textAlign: TextAlign.center,style: TextStyles().robotoSize14Regular(color: btnTextColor),),
      ),
    );
  }

  Widget _verticalSizeBox () {
    return SizedBox(height: 12.h,);
  }

}