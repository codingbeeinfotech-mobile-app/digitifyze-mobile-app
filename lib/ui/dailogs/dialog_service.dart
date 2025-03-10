import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; import 'package:toastification/toastification.dart';
import 'package:digitifyze/utils/import_utils.dart';

abstract class DialogService {
  void showToast({
    required String content,
    bool hasError,
  });


}

class DialogServiceV1 implements DialogService {
  @override
  void showToast({required String content, bool hasError = false}) {


    final context = Globals.navigatorKey.currentContext;
    if (context == null) return;
       toastification.show(
        type: ToastificationType.error,
        style: ToastificationStyle.fillColored,
        autoCloseDuration: const Duration(seconds: 3),
        description: RichText(
          text: TextSpan(
              text: content,
              style: TextStyles().bentonSansSize12Light(
                color:hasError ? Colors.red.shade900:Colors.green.shade900,
              )),
        ),
        alignment: Alignment.bottomCenter,
        showIcon: true,
        padding:   EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
        margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 3.h),
        borderRadius: BorderRadius.circular(12),
        primaryColor: hasError ? Colors.red.shade100:Colors.green.shade100,
        foregroundColor: hasError ? Colors.red.shade900:Colors.green.shade900,
        showProgressBar: true,
        closeButtonShowType: CloseButtonShowType.onHover,
        closeOnClick: true,
        pauseOnHover: true,
        dragToClose: true,
        applyBlurEffect: false);
  }



  Future<void> _showDialog(Widget dialog) {
    final context = Globals.navigatorKey.currentContext;
    if (context == null) return Future.value();

    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => dialog,
    );
  }
}

final dialogServiceProvider =
    Provider<DialogService>((ref) => DialogServiceV1());
