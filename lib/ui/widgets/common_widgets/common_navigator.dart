import 'package:digitifyze/utils/import_utils.dart';

Future<T?> commonNavigator<T>({
  required Widget child,
  PageTransitionType type = PageTransitionType.fade,
  Duration duration = const Duration(milliseconds: 350),
  bool replace = false, // Optional: Add support for replacing current route
}) async {
  final navigator = Navigator.of(Globals.navigatorKey.currentContext!,
      rootNavigator: replace);
  FocusScope.of(Globals.navigatorKey.currentContext!).unfocus();
  return navigator.push<T>(
    PageTransition(
      child: child,
      type: type,
      duration: duration,
    ),
  );
}

Future<T?> commonNavigatorPushAndRemoveUntil<T>({
  required Widget child,
  bool replaceCurrent = false, // Optional: Set to true to replace current page
  PageTransitionType type = PageTransitionType.fade,
  Duration duration = const Duration(milliseconds: 350),
}) async {
  final navigator = Navigator.of(Globals.navigatorKey.currentContext!,
      rootNavigator: replaceCurrent);
  FocusScope.of(Globals.navigatorKey.currentContext!).unfocus();
  return navigator.pushAndRemoveUntil<T>(
    PageTransition(
      child: child,
      type: type,
      duration: duration,
    ),
    (Route route) => replaceCurrent, // Predicate for route removal
  );
}
