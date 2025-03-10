import 'dart:async';
import 'package:digitifyze/utils/import_utils.dart';

class InactivityObserver extends NavigatorObserver {
  Timer? _timer;
  final Duration _timeout = const Duration(seconds: AppConfig.timeOutDuration);

  void _resetTimer(BuildContext context) {
    _timer?.cancel();
    _timer = Timer(_timeout, () {
      // DialogServiceV1().showTimeoutDialog();
    });
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    _resetTimer(route.navigator!.context);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    _resetTimer(route.navigator!.context);
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didRemove(route, previousRoute);
    _resetTimer(route.navigator!.context);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    _resetTimer(newRoute!.navigator!.context);
  }

  void resetTimer(BuildContext context) {
    _resetTimer(context);
  }
}
