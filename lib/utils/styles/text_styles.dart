import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  static final TextStyles _instance = TextStyles._internal();
  static Map<String, dynamic>? jsonData;
  static Map<String, TextStyle>? _textStyles;
  static String _currentLanguage = "English"; // Default language

  factory TextStyles() {
    return _instance;
  }

  TextStyles._internal();

  Future<void> initTextStyles() async {
    _textStyles ??= await loadDesignTokens();
  }

  Future<Map<String, TextStyle>> loadDesignTokens() async {
    final String response =
        await rootBundle.loadString('assets/designtoken/typography.json');
    jsonData = json.decode(response);
    return getTextStyles();
  }

  Map<String, TextStyle> getTextStyles() {
    final Map<String, dynamic> textStyleData = jsonData?[_currentLanguage];
    return _parseTextStylesFromJson(textStyleData);
  }

  // New method to parse the JSON and update the internal color map
  Map<String, TextStyle> _parseTextStylesFromJson(
      Map<String, dynamic> textStyleData) {
    Map<String, TextStyle> textStyles = {};

    textStyleData.forEach((key, value) {
      if (value is Map<String, dynamic>) {
        value.forEach((subKey, subValue) {

          if (subValue is Map<String, dynamic>) {
            subValue.forEach((subSubKey, subSubValue) {

              if (subSubValue is Map<String, dynamic>) {
                subSubValue.forEach((subSubSubKey, subSubSubValue) {

                  if (subSubSubValue is Map<String, dynamic>) {
                if(subSubSubValue['\$value']!= null){
                  final TypographyToken token =
                  TypographyToken.fromJson(subSubSubValue['\$value']);
                  textStyles['$key.$subKey.$subSubKey.$subSubSubKey'] = token.toTextStyle();
                }
                }
                });
              }
            });
          }
        });
      }
    });

    return textStyles;
  }

  // Method to update color styles by passing updated JSON object
  void updateTextStylesFromJson(Map<String, dynamic> updatedJson) {
    _textStyles = _parseTextStylesFromJson(updatedJson[_currentLanguage]);
  }

  void changeLanguage(String languageCode) {
    _currentLanguage = languageCode == "ar" ? "Arabic" : "English";
    _textStyles = getTextStyles();
  }

  TextStyle _getStyle(String key, {Color? color}) {
    final baseStyle = _textStyles?[key];
    if (baseStyle == null) {
      throw Exception("Style not found for key: $key");
    }
    return baseStyle.copyWith(color: color);
  }


  TextStyle lexendSize16({required Color color}) =>
      _getStyle('Typography.Lexend.16.Regular', color: color);
  TextStyle lexendSize18({required Color color}) =>
      _getStyle('Typography.Lexend.18.Regular', color: color);
  TextStyle lexendRegularSize28({required Color color}) =>
      _getStyle('Typography.Lexend.28.Regular', color: color);
  TextStyle lexendMediumSize28({required Color color}) =>
      _getStyle('Typography.Lexend.28.Medium', color: color);
  TextStyle lexendSemiBoldSize28({required Color color}) =>
      _getStyle('Typography.Lexend.28.SemiBold', color: color);
  TextStyle lexendBoldSize28({required Color color}) =>
      _getStyle('Typography.Lexend.28.Bold', color: color);
  TextStyle lexendRegularSize24({required Color color}) =>
      _getStyle('Typography.Lexend.24.Regular', color: color);
  TextStyle lexendMediumSize24({required Color color}) =>
      _getStyle('Typography.Lexend.24.Medium', color: color);
  TextStyle lexendSemiBoldSize24({required Color color}) =>
      _getStyle('Typography.Lexend.24.SemiBold', color: color);
  TextStyle lexendBoldSize24({required Color color}) =>
      _getStyle('Typography.Lexend.24.Bold', color: color);

  TextStyle robotoSize14Regular({required Color color}) =>
      _getStyle('Typography.Roboto.14.Regular', color: color);
  TextStyle robotoSize14SemiBold({required Color color}) =>
      _getStyle('Typography.Roboto.14.SemiBold', color: color);
  TextStyle robotoSize14Bold({required Color color}) =>
      _getStyle('Typography.Roboto.14.Bold', color: color);
  TextStyle robotoSize16Regular({required Color color}) =>
      _getStyle('Typography.Roboto.16.Regular', color: color);
  TextStyle robotoSize16Medium({required Color color}) =>
      _getStyle('Typography.Roboto.16.Medium', color: color);
  TextStyle robotoSize16SemiBold({required Color color}) =>
      _getStyle('Typography.Roboto.16.SemiBold', color: color);
  TextStyle robotoSize16Bold({required Color color}) =>
      _getStyle('Typography.Roboto.16.Bold', color: color);
  TextStyle robotoSize12Light({required Color color}) =>
      _getStyle('Typography.Roboto.12.Light', color: color);

  TextStyle bentonSansSize14Regular({required Color color}) =>
      _getStyle('Typography.BentonSans.14.Regular', color: color);
  TextStyle bentonSansSize14SemiBold({required Color color}) =>
      _getStyle('Typography.BentonSans.14.SemiBold', color: color);
  TextStyle bentonSansSize14Bold({required Color color}) =>
      _getStyle('Typography.BentonSans.14.Bold', color: color);
  TextStyle bentonSansSize16Regular({required Color color}) =>
      _getStyle('Typography.BentonSans.16.Regular', color: color);
  TextStyle bentonSansSize16Medium({required Color color}) =>
      _getStyle('Typography.BentonSans.16.Medium', color: color);
  TextStyle bentonSansSize16SemiBold({required Color color}) =>
      _getStyle('Typography.BentonSans.16.SemiBold', color: color);
  TextStyle bentonSansSize16Bold({required Color color}) =>
      _getStyle('Typography.BentonSans.16.Bold', color: color);
  TextStyle bentonSansSize12Light({required Color color}) =>
      _getStyle('Typography.BentonSans.12.Light', color: color);
 }

class TypographyToken {
  final String fontFamily;
  final double fontSize;
  final FontWeight fontWeight;

  final TextTransform textTransform;
  final TextDecoration textDecoration;

  TypographyToken({
    required this.fontFamily,
    required this.fontSize,
    required this.fontWeight,

    required this.textTransform,
    required this.textDecoration,
  });

  factory TypographyToken.fromJson(Map<String, dynamic> json) {
    return TypographyToken(
      fontFamily: json['fontFamily'],
      fontSize: getResponsiveFontSize(_parsePx(json['fontSize'])),
      fontWeight: _parseFontWeight(json['fontWeight']),
        textTransform: _parseTextTransform(json['textTransform']),
      textDecoration: _parseTextDecoration(json['textDecoration']),
    );
  }

  static double getResponsiveFontSize(double baseFontSize) {
    return baseFontSize.sp;
  }

  static double _parsePx(String px) {
    return double.parse(px.replaceAll('px', ''));
  }

  static double _parseLetterSpacing(String spacing) {
    if (spacing.endsWith('%')) {
      return double.parse(spacing.replaceAll('%', '')) / 100;
    } else if (spacing.endsWith('px')) {
      return double.parse(spacing.replaceAll('px', ''));
    } else {
      return double.parse(spacing);
    }
  }

  static double _parseLineHeight(String lineHeight) {
    if (lineHeight == 'normal') {
      return 1.2; // or whatever you deem as "normal" for your typography
    } else if (lineHeight.endsWith('%')) {
      return double.parse(lineHeight.replaceAll('%', '')) / 100;
    } else if (lineHeight.endsWith('px')) {
      return double.parse(lineHeight.replaceAll('px', '')) / 100;
    } else {
      return double.parse(lineHeight);
    }
  }

  static double _parsePercentage(String percentage) {
    return double.parse(percentage.replaceAll('%', '')) / 100;
  }

  static FontWeight _parseFontWeight(int weight) {
    return FontWeight.values[(weight / 100).round() - 1];
  }

  static TextTransform _parseTextTransform(String textTransform) {
    switch (textTransform) {
      case 'uppercase':
        return TextTransform.uppercase;
      case 'lowercase':
        return TextTransform.lowercase;
      case 'capitalize':
        return TextTransform.capitalize;
      default:
        return TextTransform.none;
    }
  }

  static TextDecoration _parseTextDecoration(String textDecoration) {
    switch (textDecoration) {
      case 'underline':
        return TextDecoration.underline;
      case 'lineThrough':
        return TextDecoration.lineThrough;
      default:
        return TextDecoration.none;
    }
  }

  TextStyle toTextStyle() {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,

      decoration: textDecoration,
    );
  }
}

enum TextTransform {
  none,
  uppercase,
  lowercase,
  capitalize,
}
