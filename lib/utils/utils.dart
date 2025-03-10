import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:digitifyze/utils/import_utils.dart';

class Utils {
  static bool isCurrentDateWithinRange(DateTime? startDate, DateTime? endDate) {
    DateTime currentDate = DateTime.now();

    // If both dates are null, we cannot determine the range, so return false
    if (startDate == null && endDate == null) {
      return false;
    }

    // If only startDate is null, check if the current date is before or on endDate
    if (startDate == null) {
      return currentDate.isBefore(endDate!) ||
          currentDate.isAtSameMomentAs(endDate);
    }

    // If only endDate is null, check if the current date is after or on startDate
    if (endDate == null) {
      return currentDate.isAfter(startDate) ||
          currentDate.isAtSameMomentAs(startDate);
    }

    // If neither date is null, check if current date is within the range
    return (currentDate.isAfter(startDate) && currentDate.isBefore(endDate)) ||
        currentDate.isAtSameMomentAs(startDate) ||
        currentDate.isAtSameMomentAs(endDate);
  }

  static Future<String?> getDeviceHardwareId() async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {

          final AndroidDeviceInfo androidInfo =
              await deviceInfoPlugin.androidInfo;
          return androidInfo.id; // Unique ID on Android

      } else if (Platform.isIOS) {
        final IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
        return iosInfo.identifierForVendor; // Unique ID on iOS
      }
    } on PlatformException {
      debugPrint('Failed to get platform version');
    }
    return null;
  }
}

class DateTimeUtils {
  static String formatDate(DateTime date) {
    return '${date.day} ${getMonth(date.month)}';
  }

  static String formatTime(DateTime date) {
    return '${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}${date.hour < 12 ? 'AM' : 'PM'}';
  }

  static String getMonth(int month) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return months[month - 1];
  }
}
