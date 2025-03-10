import '../../../utils/import_utils.dart';

class TextInputField extends StatelessWidget {
  final String? hintText;
  final String? lableText;
  final TextEditingController? controller;
  final FocusNode? focusNode;

  bool? isCounter = false;

  // final VoidCallback? onTapIcon;
  final GestureTapCallback? onTap;
  final GestureTapCallback? suffixonTap;
  final TextCapitalization textCapitalization;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  Color? underlinecolor;
  Color? enableunderlinecolor;
  Color? disableunderlinecolor;
  Color? focusunderlinecolor;

  // final Icon? icon;
  final bool? obscureText;
  final bool? isdescription;
  bool? center = false;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? errorText;
  final String? titleText;
  Color? cursorColor;
  final int? maxLines;
  final int? maxLength;
  final ScrollPhysics? scrollPhysics;
  final bool? enabled;
  final BoxBorder? containerborder;
  BorderRadiusGeometry? borderRadius;
  final bool? readonly;
  final bool? underline;
  final bool textFieldsBorder;
  InputBorder? textFieldBorder;
  final TextAlign? textAlign;
  final Widget? suffixicon;
  String? counterText;

  // double? iconSize;
  final Color? color;
  final String? appimge;
  final double containerwidth;
  final double? containerheight;
  final Color? containercolor;
  final Color? borderColor;
  List<BoxShadow>? boxShadow;
  // Color? iconcolor;
  double? cursorHeight;
  final TextStyle? textstyle;
  final TextStyle? titletextstyle;
  final TextStyle? hintStyle;
  final TextStyle? lableStyle;
  final TextStyle? errorStyle;
  final TextStyle? counterStyle;
  final Widget? prefix;
  final String? titlesuffix;
  EdgeInsetsGeometry? padding;
  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsetsGeometry? contentPadding;
  final BoxConstraints? prefixIconConstraints;

  TextInputField({
    super.key,
    required this.hintText,
    required this.controller,
    this.lableText,
    this.boxShadow,
    this.underline,
    this.cursorColor,
    this.isCounter = false,
    this.center,
    this.textFieldBorder,
    required this.textFieldsBorder,
    this.inputFormatters,
    this.disableunderlinecolor,
    this.focusunderlinecolor,
    this.enableunderlinecolor,
    this.focusNode,
    this.titlesuffix,
    this.isdescription,
    this.cursorHeight,
    this.counterStyle,
    this.counterText,
    this.borderRadius,
    this.textAlign,

    // this.onTapIcon,
    this.onTap,
    this.underlinecolor,
    this.onChanged,
    this.readonly = false,
    this.onSubmitted,
    // this.icon,
    this.obscureText = false,
    required this.keyboardType,
    this.textInputAction,
    this.errorText,
    this.color,
    this.appimge,
    this.suffixicon,
    required this.containerwidth,
    this.containerheight,
    // this.iconcolor,
    required this.containercolor,
    this.borderColor,
    this.titleText,
    this.suffixonTap,
    this.textstyle,
    this.titletextstyle,
    required this.textCapitalization,
    this.hintStyle,
    this.lableStyle,
    // this.iconSize,
    this.errorStyle,
    this.maxLines,
    this.prefix,
    this.maxLength,
    this.enabled,
    this.padding,
    this.scrollPhysics,
    this.containerborder,
    this.contentPadding,
    this.prefixIconConstraints,
  });

  Widget _buildErrorLabel(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    if (errorText == null) {
      return Container();
    }

    return Container(
      width: containerwidth,
      padding: EdgeInsetsDirectional.symmetric(
          horizontal: width * 0.03, vertical: height * 0.002),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          errorText == null
              ? const SizedBox()
              : Expanded(
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
          ),
          isCounter == false
              ? const SizedBox()
              : Text(
            "${controller!.text.length}/$maxLength",
            style: counterStyle ??
                TextStyle(
                    fontSize: height * 0.018,
                    fontWeight: FontWeight.w400,
                    color: Colors.red),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        if (titleText != null || titlesuffix != null)
          Padding(
            padding: containerborder != null
                ? EdgeInsetsDirectional.only(
                top: height * 0.005, bottom: height * 0.015)
                : EdgeInsetsDirectional.only(bottom: height * 0.01),
            child: SizedBox(
              width: containerwidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  titleText == '' || titleText == null
                      ? const SizedBox.shrink()
                      : commonText(
                      text: titleText!,
                      style: titletextstyle ??
                          TextStyle(
                              fontSize: height * 0.018,
                              fontWeight: FontWeight.w700,
                              color: ColorStyles().black!)),
                ],
              ),
            ),
          ),
        Container(
          width: containerwidth,
          height:
          isdescription == true ? null : containerheight ?? height * 0.06,
          decoration: BoxDecoration(
            boxShadow: boxShadow,
            color: containercolor,
            border: containerborder,
            borderRadius: borderRadius ?? BorderRadiusDirectional.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  width: width * 0.54,
                  height: isdescription == true
                      ? null
                      : containerheight ?? height * 0.06,
                  child: center == false
                      ? TextFormField(
                    autofocus: false,
                    readOnly: readonly!,
                    enabled: enabled,
                    style: textstyle ??
                        TextStyle(
                            fontSize: height * 0.019,
                            fontWeight: FontWeight.w500,
                            color: ColorStyles().black!),
                    onTap: onTap,
                    textCapitalization: textCapitalization,
                    textAlignVertical: TextAlignVertical.center,
                    controller: controller,
                    focusNode: focusNode,
                    onChanged: onChanged,
                    scrollPhysics: scrollPhysics ??
                        const NeverScrollableScrollPhysics(),
                    obscureText: obscureText!,
                    keyboardType: keyboardType,
                    textInputAction: textInputAction,
                    maxLines: maxLines,
                    cursorColor:
                    cursorColor ?? ColorStyles().black!,
                    maxLength: maxLength,
                    cursorHeight: cursorHeight ?? height * 0.025,
                    decoration: textFieldsBorder == true?
                    InputDecoration(
                      border: textFieldBorder,
                      // alignLabelWithHint: true,
                      labelText: lableText,
                      labelStyle: lableStyle,
                      enabledBorder: textFieldBorder,
                      focusedBorder: textFieldBorder,
                      errorBorder: textFieldBorder,
                      focusedErrorBorder: textFieldBorder,
                      disabledBorder: textFieldBorder,
                      hintText: hintText,
                      prefixIcon: prefix,
                      prefixIconConstraints:prefixIconConstraints,
                      contentPadding: contentPadding ??
                          EdgeInsetsDirectional.symmetric(
                              horizontal: width * 0.05,
                              vertical: height * 0.01),
                      hintStyle: hintStyle ??
                          TextStyle(
                              fontSize: height * 0.018,
                              fontWeight: FontWeight.w400,
                              color: ColorStyles()
                                  .black!),
                      suffixIcon: suffixicon != null
                          ? GestureDetector(
                          onTap: suffixonTap, child: suffixicon)
                          : suffixicon,
                      counterText: counterText ?? "",
                      isDense: true,
                    )
                        :
                    (underline == false
                        ? InputDecoration(
                      border: InputBorder.none,
                      labelText: lableText,
                      labelStyle: lableStyle,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      hintText: hintText,
                      prefixIcon: prefix,
                      prefixIconConstraints:prefixIconConstraints,
                      contentPadding: contentPadding ??
                          EdgeInsetsDirectional.symmetric(
                              horizontal: width * 0.05,
                              vertical: height * 0.01),
                      hintStyle: hintStyle ??
                          TextStyle(
                              fontSize: height * 0.018,
                              fontWeight: FontWeight.w400,
                              color: ColorStyles()
                                  .black!),
                      suffixIcon: suffixicon != null
                          ? GestureDetector(
                          onTap: suffixonTap, child: suffixicon)
                          : suffixicon,
                      counterText: counterText ?? "",
                      isDense: true,
                    )
                        : InputDecoration(
                      labelText: lableText,
                      labelStyle: lableStyle,
                      hintText: hintText,
                      prefixIcon: prefix,
                      prefixIconConstraints:prefixIconConstraints,
                      contentPadding: contentPadding ??
                          EdgeInsetsDirectional.symmetric(
                              horizontal: width * 0.05,
                              vertical: height * 0.01),
                      hintStyle: hintStyle ??
                          TextStyle(
                              fontSize: height * 0.018,
                              fontWeight: FontWeight.w400,
                              color: ColorStyles()
                                  .black!),
                      suffixIcon: suffixicon != null
                          ? GestureDetector(
                          onTap: suffixonTap, child: suffixicon)
                          : suffixicon,
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: enableunderlinecolor ??
                                  ColorStyles().black!,
                              width: 1)),
                      disabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: disableunderlinecolor ??
                                  ColorStyles().black!,
                              width: 1)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: focusunderlinecolor ??
                                  ColorStyles().black!,
                              width: 1)),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: underlinecolor ??
                                  ColorStyles().black!,
                              width: 1)),
                      counterText: counterText ?? "",
                      isDense: true,
                    )),
                  )
                      : Center(
                    child: TextFormField(
                      autofocus: false,
                      readOnly: readonly!,
                      enabled: enabled,
                      style: textstyle ??
                          TextStyle(
                              fontSize: height * 0.019,
                              fontWeight: FontWeight.w500,
                              color: ColorStyles().black!),
                      onTap: onTap,
                      textCapitalization: textCapitalization,
                      textAlignVertical: TextAlignVertical.center,
                      inputFormatters: inputFormatters,
                      controller: controller,
                      focusNode: focusNode,
                      textAlign: textAlign ?? TextAlign.start,
                      onChanged: onChanged,
                      scrollPhysics: scrollPhysics ??
                          const NeverScrollableScrollPhysics(),
                      obscureText: obscureText!,
                      keyboardType: keyboardType,
                      textInputAction: textInputAction,
                      maxLines: maxLines,
                      cursorColor: cursorColor ??
                          ColorStyles().black!,
                      maxLength: maxLength,
                      cursorHeight: cursorHeight ?? height * 0.025,
                      decoration:textFieldsBorder==true ? InputDecoration(
                        border: textFieldBorder, enabledBorder: textFieldBorder,
                        focusedBorder: textFieldBorder,
                        errorBorder: textFieldBorder,
                        focusedErrorBorder: textFieldBorder,
                        disabledBorder: textFieldBorder,
                        labelText: lableText,
                        labelStyle: lableStyle,
                        hintText: hintText,
                        prefixIcon: prefix,
                        prefixIconConstraints:prefixIconConstraints,
                        contentPadding: contentPadding ??
                            EdgeInsetsDirectional.symmetric(
                                horizontal: width * 0.05,
                                vertical: height * 0.01),
                        hintStyle: hintStyle ??
                            TextStyle(
                                fontSize: height * 0.018,
                                fontWeight: FontWeight.w400,
                                color: ColorStyles()
                                    .black!),
                        suffixIcon: suffixicon != null
                            ? GestureDetector(
                            onTap: suffixonTap,
                            child: suffixicon)
                            : suffixicon,
                        counterText: counterText ?? "",
                        isDense: true,
                      ): (underline == false
                          ? InputDecoration(
                        border: InputBorder.none,
                        labelText: lableText,
                        labelStyle: lableStyle,
                        hintText: hintText,
                        prefixIcon: prefix,
                        prefixIconConstraints:prefixIconConstraints,
                        contentPadding: contentPadding ??
                            EdgeInsetsDirectional.symmetric(
                                horizontal: width * 0.05,
                                vertical: height * 0.01),
                        hintStyle: hintStyle ??
                            TextStyle(
                                fontSize: height * 0.018,
                                fontWeight: FontWeight.w400,
                                color: ColorStyles()
                                    .black!),
                        suffixIcon: suffixicon != null
                            ? GestureDetector(
                            onTap: suffixonTap,
                            child: suffixicon)
                            : suffixicon,
                        counterText: counterText ?? "",
                        isDense: true,
                      )
                          : InputDecoration(
                        labelText: lableText,
                        labelStyle: lableStyle,
                        hintText: hintText,
                        prefixIcon: prefix,
                        prefixIconConstraints:prefixIconConstraints,
                        contentPadding: contentPadding ??
                            EdgeInsetsDirectional.symmetric(
                                horizontal: width * 0.05,
                                vertical: height * 0.01),
                        hintStyle: hintStyle ??
                            TextStyle(
                                fontSize: height * 0.018,
                                fontWeight: FontWeight.w400,
                                color: ColorStyles()
                                    .black!),
                        suffixIcon: suffixicon != null
                            ? GestureDetector(
                            onTap: suffixonTap,
                            child: suffixicon)
                            : suffixicon,
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: enableunderlinecolor ??
                                    ColorStyles()
                                        .black!,
                                width: 1)),
                        disabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: disableunderlinecolor ??
                                    ColorStyles()
                                        .black!,
                                width: 1)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: focusunderlinecolor ??
                                    ColorStyles()
                                        .black!,
                                width: 1)),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: underlinecolor ??
                                    ColorStyles()
                                        .black!,
                                width: 1)),
                        counterText: counterText ?? "",
                        isDense: true,
                      )),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        _buildErrorLabel(context),
      ],
    );
  }
}
