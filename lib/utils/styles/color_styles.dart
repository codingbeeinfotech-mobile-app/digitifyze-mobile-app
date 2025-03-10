import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const List<Color> defaultRainbowColors = [
  Colors.red,
  Colors.orange,
  Colors.yellow,
  Colors.green,
  Colors.blue,
  Colors.indigo,
  Colors.purple,
];

class ColorStyles {
  static Map<String, ColorToken>? _colorStyles;
  static final ColorStyles _instance = ColorStyles._internal();

  factory ColorStyles() {
    return _instance;
  }

  ColorStyles._internal();

  Future<void> initColorStyles() async {
    _colorStyles ??= await getColorStyles();
  }

  Future<Map<String, dynamic>> loadDesignTokens() async {
    final String response =
        await rootBundle.loadString('assets/designtoken/color_styles.json');
    return json.decode(response);
  }

  Future<Map<String, ColorToken>> getColorStyles() async {
    final Map<String, dynamic> jsonData = await loadDesignTokens();
    return _parseColorStylesFromJson(jsonData);
  }

  // New method to parse the JSON and update the internal color map
  Map<String, ColorToken> _parseColorStylesFromJson(
      Map<String, dynamic> jsonData) {
    Map<String, ColorToken> colorStyles = {};

    void parseColorStyles(Map<String, dynamic> json, String prefix) {
      json.forEach((key, value) {
        if (value is Map<String, dynamic>) {
          if (value.containsKey('\$value')) {
            final ColorToken token = ColorToken.fromJson(value);
            colorStyles[prefix + key] = token;
          } else {
            parseColorStyles(value, prefix + key + '.');
          }
        }
      });
    }

    parseColorStyles(jsonData, '');
    return colorStyles;
  }

  // Method to update color styles by passing updated JSON object
  void updateColorStylesFromJson(Map<String, dynamic> updatedJson) {
    _colorStyles = _parseColorStylesFromJson(updatedJson);
  }

  //Brand
  Color? get pastelOrange => _colorStyles?['Color_styles.Brand.Pastel Orange']?.color;
  Color? get peachOrange => _colorStyles?['Color_styles.Brand.Peach Orange']?.color;
  Color? get linenOrange => _colorStyles?['Color_styles.Brand.Linen Orange']?.color;
  Color? get black => _colorStyles?['Color_styles.Brand.Black']?.color;
  Color? get mediumGray => _colorStyles?['Color_styles.Brand.Medium Gray']?.color;
  Color? get grey => _colorStyles?['Color_styles.Brand.Grey']?.color;
  Color? get borderGray => _colorStyles?['Color_styles.Brand.Border Gray']?.color;
  Color? get white => _colorStyles?['Color_styles.Brand.White']?.color;
  Color? get placeholderSilver => _colorStyles?['Color_styles.Brand.Placeholder Silver']?.color;
  Color? get bodyBg => _colorStyles?['Color_styles.Brand.BodyBg']?.color;
  Color? get disableGray23 => _colorStyles?['Color_styles.Brand.DisableGray23']?.color;
  Color? get mineralGreen => _colorStyles?['Color_styles.Brand.Mineral Green']?.color;
  Color? get whiteSmoke => _colorStyles?['Color_styles.Brand.White Smoke']?.color;
  Color? get peachyOrange => _colorStyles?['Color_styles.Brand.Peachy Orange']?.color;
  Color? get lightMustard => _colorStyles?['Color_styles.Brand.Light Mustard']?.color;
  Color? get limeGreen => _colorStyles?['Color_styles.Brand.Lime Green']?.color;
  Color? get blueCharcoal => _colorStyles?['Color_styles.Brand.Blue Charcoal']?.color;
  Color? get blueCrystal => _colorStyles?['Color_styles.Brand.Blue Crystal']?.color;
  Color? get dullYellow => _colorStyles?['Color_styles.Brand.Dull Yellow']?.color;
  Color? get deepPeach => _colorStyles?['Color_styles.Brand.Deep Peach']?.color;
  Color? get softPeach => _colorStyles?['Color_styles.Brand.Soft Peach']?.color;
  Color? get reddishOrange => _colorStyles?['Color_styles.Brand.Reddish Orange']?.color;
  Color? get lightOrangePeach => _colorStyles?['Color_styles.Brand.Light Orange Peach']?.color;
  Color? get disableGray => _colorStyles?['Color_styles.Brand.Disable Gray']?.color;
  Color? get peach => _colorStyles?['Color_styles.Brand.Peach']?.color;
  Color? get coffee => _colorStyles?['Color_styles.Brand.Coffee']?.color;
  Color? get sunriseOrange => _colorStyles?['Color_styles.Brand.Sunrise Orange']?.color;
  Color? get oldCopper => _colorStyles?['Color_styles.Brand.Old Copper']?.color;
  Color? get brownPink => _colorStyles?['Color_styles.Brand.Brown Pink']?.color;
  Color? get disableGray5 => _colorStyles?['Color_styles.Brand.DisableGray5']?.color;
  Color? get orangePink => _colorStyles?['Color_styles.Brand.Orange Pink']?.color;
  Color? get darkSlateGrey => _colorStyles?['Color_styles.Brand.Dark Slate Grey']?.color;
  Color? get brightSkyBlue => _colorStyles?['Color_styles.Brand.Bright Sky Blue']?.color;
  Color? get vistaWhite => _colorStyles?['Color_styles.Brand.Vista White']?.color;
  Gradient? get linearGradient => _colorStyles?['Color_styles.Brand.Linear']?.gradient;
  Color? get celestialBlue => _colorStyles?['Color_styles.Brand.Celestial Blue']?.color;
  Color? get whiteLilac => _colorStyles?['Color_styles.Brand.White Lilac']?.color;
  Color? get metalicSilver => _colorStyles?['Color_styles.Brand.Metalic Silver']?.color;
  Color? get mercury => _colorStyles?['Color_styles.Brand.Mercury']?.color;
  Color? get cloudyGrey => _colorStyles?['Color_styles.Brand.Cloudy Grey']?.color;
  Color? get darkGrey => _colorStyles?['Color_styles.Brand.Dark Grey']?.color;
  Color? get dustGrey => _colorStyles?['Color_styles.Brand.Dust Grey']?.color;
  Color? get irishGreen => _colorStyles?['Color_styles.Brand.Irish Green']?.color;
  Color? get lightOrangeMustard => _colorStyles?['Color_styles.Brand.Light Orange Mustard']?.color;
  Color? get tomatoOrange => _colorStyles?['Color_styles.Brand.Tomato Orange']?.color;
  Color? get orangeyYellow => _colorStyles?['Color_styles.Brand.Orangey Yellow']?.color;
  Color? get lavenderGrey => _colorStyles?['Color_styles.Brand.Lavender Grey']?.color;
  Color? get blueLotus => _colorStyles?['Color_styles.Brand.Blue Lotus']?.color;
  Color? get blueLightLotus => _colorStyles?['Color_styles.Brand.Blue Light Lotus']?.color;
  Color? get softLavenderBlue => _colorStyles?['Color_styles.Brand.Soft Lavender Blue']?.color;
  Color? get errorRed => _colorStyles?['Color_styles.Brand.Error Red']?.color;
  Color? get customBlue => _colorStyles?['Color_styles.Brand.Custom Blue']?.color;
  Color? get customGray => _colorStyles?['Color_styles.Brand.Custom Gray']?.color;



}

class ColorToken {
  final Color? color;
  final Gradient? gradient;

  ColorToken({this.color, this.gradient});

  factory ColorToken.fromJson(Map<String, dynamic> json) {
    if (json['\$type'] == 'color') {
      return ColorToken(
        color: _parseColor(json['\$value']),
      );
    } else if (json['\$type'] == 'gradient') {
      return ColorToken(
        gradient: _parseGradient(json['\$value']),
      );
    }
    return ColorToken(
      color: Colors.white, // default value
    );
  }

  static Color _parseColor(String hexColor) {
    hexColor = hexColor.replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor'; // add alpha channel if not present
    }
    return Color(int.parse(hexColor, radix: 16));
  }

  static Gradient _parseGradient(Map<String, dynamic> gradientJson) {
    final angle = gradientJson['angle'] ?? 90;
    final stops = (gradientJson['stops'] as List<dynamic>).map((stop) {
      return ColorStop(
        _parseColor(stop['color']),
        stop['position'].toDouble(),
      );
    }).toList();

    return LinearGradient(
      colors: stops.map((s) => s.color).toList(),
      stops: stops.map((s) => s.position).toList(),
      begin: _getGradientAlignment(double.parse(angle.toString())),
      end: _getGradientAlignment((double.parse(angle.toString()) + 180) % 360),
    );
  }

  static Alignment _getGradientAlignment(double angle) {
    final radians = angle * (3.141592653589793 / 180.0);
    return Alignment(cos(radians), sin(radians));
  }
}
class ColorStop {
  final Color color;
  final double position;
  ColorStop(this.color, this.position);
}
