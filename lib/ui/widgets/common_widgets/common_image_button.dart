import 'dart:io';
import 'package:digitifyze/utils/import_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class CommonImageButton extends StatelessWidget {
  final String title;
  final bool isProfile;
  final VoidCallback? onTap;
  final File? imgFile;
  final String imgUrl;
  final String? errorText;
  final TextStyle? errorStyle;

  const CommonImageButton({
    super.key,
    required this.title,
    this.isProfile = false,
    this.onTap,
    this.imgFile,
    this.imgUrl = "",
    this.errorText,
    this.errorStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: isProfile ? _buildProfileImage() : _buildRegularImage(),
        ),
        _buildErrorLabel(context),
      ],
    );
  }

  /// Builds the profile image UI
  Widget _buildProfileImage() {
    return Container(
      height: 112.h,
      width: 112.w,
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: ColorStyles().metalicSilver),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(56.r),
            child: imgUrl.isNotEmpty
                ? ImageLoader(
                    imageUrl: imgUrl,
                    height: 107.h,
                    width: 107.w,
                  )
                : imgFile != null
                    ? Image.file(imgFile!,
                        height: 107.h, width: 107.w, fit: BoxFit.cover)
                    : Center(
                        child: svgIcon(
                          height: 60.h,
                          width: 60.w,
                          name: AppImg.icEmptyProfile,
                        ),
                      ),
          ),
        ],
      ),
    );
  }

  /// Builds the regular image UI (non-profile)
  Widget _buildRegularImage() {
    if (imgUrl.isNotEmpty) {
      return _buildImageContainer(
        child: ImageLoader(
          imageUrl: imgUrl,
          height: 64.h,
        ),
      );
    }

    if (imgFile != null) {
      return _buildImageContainer(
        child: Image.file(imgFile!, height: 64.h,width: 1.sw, fit: BoxFit.cover),
      );
    }

    return _buildPlaceholder();
  }

  /// Builds a container with a border and shadow for images
  Widget _buildImageContainer({required Widget child}) {
    return Container(
      height: 64.h,
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 5.h),
      decoration: _boxDecoration(),
      alignment: Alignment.center,
      child: ClipRRect(borderRadius: BorderRadius.circular(5), child: child),
    );
  }

  /// Builds the placeholder UI when no image is available
  Widget _buildPlaceholder() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      decoration: _boxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppImg.icImg, height: 40.h, width: 40.w),
          SizedBox(width: 10.w),
          commonText(
            text: title,
            style: TextStyles()
                .robotoSize12Light(color: Colors.black)
                .copyWith(fontSize: 10),
          ),
        ],
      ),
    );
  }

  /// Returns the common BoxDecoration used in the component
  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      color: ColorStyles().white,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: ColorStyles().borderGray!),
      boxShadow: [
        BoxShadow(
          color: ColorStyles().softLavenderBlue!.withOpacity(0.4),
          blurRadius: 5,
        ),
      ],
    );
  }

  /// Displays error messages if applicable
  Widget _buildErrorLabel(BuildContext context) {
    if (errorText == null) return const SizedBox();

    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.03, vertical: height * 0.002),
      child: Text(
        errorText!,
        style: errorStyle ??
            TextStyle(
                fontSize: height * 0.018,
                fontWeight: FontWeight.w400,
                color: Colors.red),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
