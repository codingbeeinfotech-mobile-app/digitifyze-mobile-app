import 'dart:io';
import 'package:digitifyze/utils/import_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'common_button.dart';

class CommonImagePicker extends ConsumerWidget {
  ImagePicker picker;
  void Function(File file) pickedImage;
  CommonImagePicker(
      {super.key, required this.picker, required this.pickedImage});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return AlertDialog(shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
            Radius.circular(30.r)
        )),
      contentPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
      insetPadding: const EdgeInsets.all(20),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: w * 0.04,horizontal: w * 0.04),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    ColorStyles().celestialBlue!,
                    ColorStyles().orangePink!,
                  ],
                ),
              borderRadius: BorderRadius.only(topRight: Radius.circular(16.r),topLeft: Radius.circular(16.r))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                commonText(
                  text: "Select Image",
                  style: TextStyles().robotoSize16Bold(color: ColorStyles().white!),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.close,
                    color: ColorStyles().white!,
                    size: h * 0.024,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      content: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: ColorStyles().white!,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: w * 0.05, vertical: h * 0.02),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: h * 0.02),
              CommonButton(
                containerwidth: w,
                containerheight: h * 0.06,
                decoration: BoxDecoration(
                  border: Border.all(color: ColorStyles().orangePink!),
                  borderRadius: BorderRadius.circular(45),
                  // gradient: LinearGradient(
                  //   begin: Alignment.centerLeft,
                  //   end: Alignment.centerRight,
                  //   colors: [
                  //     ColorStyles().celestialBlue!,
                  //     ColorStyles().orangePink!,
                  //   ],
                  // ),
                ),
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(45),
                ),
                text: "Take Photo",
                prefixicon: Icon(
                  Icons.camera_alt,
                  color: ColorStyles().orangePink!,
                  size: h * 0.03,
                ),
                textStyle: TextStyles().robotoSize16Bold(color: ColorStyles().orangePink!),
                onPressed: () async {
                  final pickedImg =
                  await picker.pickImage(source: ImageSource.camera);
                  if (pickedImg != null) {
                    pickedImage(File(pickedImg.path));
                    Navigator.pop(context);
                  }
                },
              ),
              SizedBox(height: h * 0.02),
              CommonButton(
                containerwidth: w,
                containerheight: h * 0.06,
                decoration: BoxDecoration(
                  border: Border.all(color: ColorStyles().orangePink!),
                  borderRadius: BorderRadius.circular(45),
                  // gradient: LinearGradient(
                  //   begin: Alignment.centerLeft,
                  //   end: Alignment.centerRight,
                  //   colors: [
                  //     ColorStyles().celestialBlue!,
                  //     ColorStyles().orangePink!,
                  //   ],
                  // ),
                ),
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(45),
                ),
                text: "Choose From Gallery",
                prefixicon: Icon(
                  Icons.photo_library_rounded,
                  color:ColorStyles().orangePink!,
                  size: h * 0.03,
                ),
                textStyle:TextStyles().robotoSize16Bold(color: ColorStyles().orangePink!),
                onPressed: () async {
                  final pickedImg =
                  await picker.pickImage(source: ImageSource.gallery);
                  if (pickedImg != null) {
                    pickedImage(File(pickedImg.path));
                    Navigator.pop(context);
                  }
                },
              ),
              SizedBox(height: h * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}
