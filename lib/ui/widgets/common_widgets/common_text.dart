import 'package:digitifyze/utils/import_utils.dart';

Text commonText({
  StrutStyle? strutStyle,
  TextAlign? textAlign,
  TextDirection? textDirection,
  Locale? locale,
  bool? softWrap,
  TextOverflow? overflow,
  double? textScaleFactor,
  int? maxLines,
  String? semanticsLabel,
  TextWidthBasis? textWidthBasis,
  TextHeightBehavior? textHeightBehavior,
  Color? selectionColor,
  required String text,
  required TextStyle style,
}) {
  return Text(
    text,
    textAlign: textAlign,
    style: style,
    overflow: overflow,
    locale: locale,
    maxLines: maxLines,
    selectionColor: selectionColor,
    semanticsLabel: semanticsLabel,
    softWrap: softWrap,
    strutStyle: strutStyle,
    textDirection: textDirection,
    textHeightBehavior: textHeightBehavior,
    textWidthBasis: textWidthBasis,
  );
}

Text noDataCommonText({
  required TextStyle style,
  String? data,
}) {
  return commonText(
    text: data ?? "No Data Found",
    style: style,
  );
}

Widget commonRichText (
{
  required String text1,
  required TextStyle style1,
  required String text2,
  required TextStyle style2,
}
    ) {
  return Row(
    children: [
      commonText(text: text1, style: style1),
      commonText(text: text2, style: style2),
    ],
  );
}
