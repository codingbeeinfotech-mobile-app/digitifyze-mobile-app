import 'package:digitifyze/utils/dropdown/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';




class CommonDropdown extends ConsumerWidget {
  void Function(String?)? onChanged;
  void Function()? onTap;
  int elevation;

  final bool? messagetext;

  final String? dropdownValue;
  final String? titleText;

  bool? isDense;
  double? itemHeight;
  bool isExpanded;
  bool autofocus;
  bool enableFeedback;
  FocusNode? focusNode;
  Widget? dropdownicon;
  Widget? dropdownsuffix;

  double? iconSize;
  double? menuMaxHeight;
  Color? focusColor;
  Color? dropdownColor;
  Color? iconcolor;
  Color? icondisablecolor;

  double containerwidth;
  double containerheight;

  Color? containercolor;

  TextStyle? textstyle;
  TextStyle? selectItemTextStyle;
  TextStyle? itemTextStyle;
  TextStyle? titletextstyle;
  Widget? dropdowntitle;
  List<String>? itemslist;
  AlignmentGeometry? alignment;
  BorderRadius? borderRadius;
  EdgeInsetsGeometry? padding;
  Widget? prefix;
  String? titlesuffix;
  BoxBorder? border;
  bool? checkboxval;
  void Function(bool)? onchange;

  ///
  void Function(String?)? onSaved;
  String? Function(String?)? validator;
  AutovalidateMode? autoValidateMode = AutovalidateMode.disabled;
  void Function(String?) onChangedsearch;
  List<String> items;

  String? selectedItem;
  Future<List<String>> Function(String)? asyncItems;
  Widget Function(BuildContext, String?)? dropdownBuilder;
  DropDownDecoratorProps dropdownDecoratorProps = DropDownDecoratorProps();
  ClearButtonProps clearButtonProps = ClearButtonProps();
  DropdownButtonProps dropdownButtonProps = DropdownButtonProps();
  bool enabled = true;
  bool Function(String, String)? filterFn;
  String Function(String)? itemAsString;
  bool Function(String, String)? compareFn;
  Future<bool?> Function(String?, String?)? onBeforeChange;
  Future<bool?> Function(String?)? onBeforePopupOpening;
  PopupProps<String>? popupProps;
  List<BoxShadow>? boxShadow;
  final ValueChanged<String?>? onItemSelected;
  final String? errorText;
  final TextStyle? errorStyle;
  final bool isExpansion;
  CommonDropdown({
    Key? key,
    this.onSaved,
    this.validator,
    this.boxShadow,
    this.autoValidateMode,
    required this.onChangedsearch,
    required this.items,
    this.selectedItem,
    this.asyncItems,
    this.dropdownBuilder,
    required this.dropdownDecoratorProps,
    required this.clearButtonProps,
    required this.dropdownButtonProps,
    required this.enabled,
    this.filterFn,
    this.dropdownsuffix,
    this.itemAsString,
    this.compareFn,
    this.onBeforeChange,
    this.onBeforePopupOpening,
    this.popupProps,
    this.titlesuffix,
    this.onChanged,
    this.onTap,
    this.dropdowntitle,
    this.border,
    this.checkboxval,
    required this.elevation,
    this.itemHeight,
    this.focusNode,
    this.onchange,
    this.menuMaxHeight,
    this.enableFeedback = false,
    required this.isExpanded,
    this.autofocus = false,
    this.itemslist,
    this.messagetext,
    this.dropdownValue,
    this.focusColor,
    this.dropdownColor,
    this.borderRadius,
    this.alignment,
    this.padding,
    this.iconcolor,
    this.isDense,
    this.icondisablecolor,
    this.dropdownicon,
    required this.containerwidth,
    required this.containerheight,
    required this.containercolor,
    this.titleText,
    this.textstyle,
    this.selectItemTextStyle,
    this.itemTextStyle,
    this.titletextstyle,
    this.iconSize,
    this.prefix,
    this.onItemSelected,
    this.errorText,
    this.errorStyle,
    this.isExpansion = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          width: containerwidth,
          height: containerheight ?? height * 0.06,
          decoration: BoxDecoration(
            boxShadow: boxShadow,
            color: containercolor,
            border: border,
            borderRadius: borderRadius,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  width: containerwidth,
                  height: containerheight,
                  decoration: BoxDecoration(
                    boxShadow: boxShadow,
                    color: containercolor,
                    border: border,
                    borderRadius: borderRadius,
                  ),
                  child: DropdownSearch<String>(
                    onSaved: onSaved,
                    validator: validator,
                    autoValidateMode: autoValidateMode,
                    // onChanged: onChangedsearch,
                    onChanged:onChangedsearch,
                    items: items,
                    selectedItem: selectedItem ?? dropdownValue,
                    asyncItems: asyncItems,
                    dropdownBuilder: _style,
                    dropdownDecoratorProps: dropdownDecoratorProps,
                    clearButtonProps: clearButtonProps,
                    dropdownButtonProps: dropdownButtonProps,
                    enabled: enabled,
                    filterFn: filterFn,
                    itemAsString: itemAsString,
                    compareFn: compareFn,
                    onBeforeChange: onBeforeChange,
                    onBeforePopupOpening: onBeforePopupOpening,
                    popupProps: PopupProps.menu(
                      fit: FlexFit.loose,
                      title: dropdowntitle,
                      containerBuilder: (context, child) {
                        return Container(
                          height: items.length > 5
                              ? height * 0.3
                              : (height * 0.039) * items.length,
                          color: containercolor,
                          child: child,
                        );
                      },
                      itemBuilder: (context, item, isSelected) {
                        return Container(
                          margin: EdgeInsets.symmetric(
                              vertical: height * 0.006,
                              horizontal: width * 0.025),
                          height: height * 0.025,
                          color: containercolor,
                          child: Row(
                            children: [
                              dropdownicon != null
                                  ? dropdownicon!
                                  : const SizedBox.shrink(),
                              dropdownsuffix != null
                                  ? Expanded(
                                child: Text(
                                  item!,
                                  style: itemTextStyle ?? TextStyle(
                                      color: Colors.black
                                          .withOpacity(0.8),
                                      fontSize: height * 0.02,
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.w600)
                                      .copyWith(
                                      overflow:
                                      TextOverflow.ellipsis),
                                ),
                              )
                                  : Expanded(
                                child: Text(
                                  item!,
                                  style: itemTextStyle ?? TextStyle(
                                      color:
                                      Colors.black.withOpacity(0.8),
                                      fontSize: height * 0.02,
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              dropdownsuffix != null
                                  ? dropdownsuffix!
                                  : const SizedBox.shrink(),
                            ],
                          ),
                        );
                      },
                      constraints: BoxConstraints.tightFor(),
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
        ],
      ),
    );
  }

  Widget _style(BuildContext context, String? selectedItem) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(left: w * 0.03),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          selectedItem ?? titleText ?? "",
          style: selectedItem!= null && selectedItem.isNotEmpty ? selectItemTextStyle : textstyle ??
              TextStyle(
                  color: Colors.black.withOpacity(0.8),
                  fontSize: w * 0.04,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  Widget _style1(BuildContext context, String? item, bool isSelected) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.025,
      child: Row(
        children: [
          Icon(Icons.location_on),
          Text(
            selectedItem!,
            style: TextStyle(
                overflow: TextOverflow.ellipsis,
                color: Colors.black.withOpacity(0.8),
                fontSize: height * 0.02,
                fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
