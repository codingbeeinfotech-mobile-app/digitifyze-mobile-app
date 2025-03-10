import 'package:flutter/material.dart';
import 'package:digitifyze/utils/import_utils.dart';


class CommonButton extends ConsumerWidget {
  CommonButton({
    super.key,
    required this.containerwidth,
    required this.containerheight,
    required this.backgroundColor,
    required this.shape,
    required this.text,
    required this.textStyle,
    this.suffixicon,
    this.isCenter = true,
    this.decoration,
    this.centericon,
    this.prefixicon,
    required this.onPressed,
  });
  double containerwidth;
  double containerheight;
  Color? backgroundColor;
  OutlinedBorder shape;
  bool? isCenter;
  BoxDecoration? decoration;
  Widget? suffixicon;
  Widget? prefixicon;
  Widget? centericon;
  String text;
  TextStyle textStyle;
  void Function() onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final w = MediaQuery.of(context).size.width;
    return Container(
      width: containerwidth,
      height: containerheight,
      decoration: decoration,
      child: TextButton(
        style: TextButton.styleFrom(
          elevation: 1,
          backgroundColor: backgroundColor,
          // shadowColor: ColorStyles().Bg_primary!,
          shape: shape,
        ),
        onPressed: onPressed,
        child: isCenter == true
            ? Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    prefixicon != null
                        ? Padding(
                            padding: EdgeInsetsDirectional.only(end: w * 0.01),
                            child: prefixicon!,
                          )
                        : const SizedBox.shrink(),
                    text == "" && centericon != null
                        ? centericon!
                        : prefixicon != null
                            ? commonText(
                                text: text,
                                textAlign:
                                    prefixicon == null && suffixicon == null
                                        ? TextAlign.center
                                        : TextAlign.center,
                                style: textStyle,
                              )
                            : Expanded(
                                child: commonText(
                                  text: text,
                                  textAlign:
                                      prefixicon == null && suffixicon == null
                                          ? TextAlign.center
                                          : TextAlign.center,
                                  style: textStyle,
                                ),
                              ),
                    suffixicon != null ? suffixicon! : const SizedBox.shrink(),
                  ],
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  prefixicon != null ? prefixicon! : const SizedBox.shrink(),
                  text == "" && centericon != null
                      ? centericon!
                      : prefixicon != null
                          ? commonText(
                              text: text,
                              textAlign:
                                  prefixicon == null && suffixicon == null
                                      ? TextAlign.center
                                      : TextAlign.start,
                              style: textStyle,
                            )
                          : Expanded(
                              child: commonText(
                                text: text,
                                textAlign:
                                    prefixicon == null && suffixicon == null
                                        ? TextAlign.center
                                        : TextAlign.start,
                                style: textStyle,
                              ),
                            ),
                  suffixicon != null ? suffixicon! : const SizedBox.shrink(),
                ],
              ),
      ),
    );
  }
}
