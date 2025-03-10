import 'package:digitifyze/utils/globals.dart';

extension FormatExtension on String {
  String toCalorieFormat() {
    final context = Globals.navigatorKey.currentContext;
    if (context == null) {
      return '$this kcal';
    } else {
      return '$this kcal';
      // return '$this ${S.of(context).kcal}';
    }
  }
}

extension DoubleExtension on double {
  String toAmountFormat({int decimalDigits = 2}) {
    final formatter = toStringAsFixed(decimalDigits);
    return "$formatter SR";
  }
}
