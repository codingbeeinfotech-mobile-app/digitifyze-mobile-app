import 'dart:async';
import 'dart:io';

import 'package:digitifyze/ui/screens/bottom_nav_bar/bottom_nav_bar_screen.dart';
import 'package:digitifyze/ui/screens/on_boarding_screen/on_boarding_screen.dart';
import 'package:digitifyze/ui/screens/sign_up_screen/sign_up_screen.dart';
import 'package:digitifyze/utils/import_utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:digitifyze/utils/inactivity_observer.dart';
import 'package:toastification/toastification.dart';


Future<void> main() async {
  await ScreenUtil.ensureScreenSize();
  HttpOverrides.global = MyHttpOverrides();
  await AppPreferences.init();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging _firebaseMessaging =
      FirebaseMessaging.instance;
  await ColorStyles().initColorStyles();

  _firebaseMessaging.getToken().then((value) {
    debugPrint("fcm token ===> $value");
    AppPreferences().setFCMToken(value!);
  },);

  // Lock to portrait mode
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // Set status bar color to transparent
    statusBarIconBrightness: Brightness.dark, // Icons will be dark (use Brightness.light for white icons)
  ));

  // Preserve native splash screen until app loads
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Run the app
  runApp(
    const ProviderScope(observers: [StateLogger()], child: MyApp()),
  );
}


class MyApp extends ConsumerStatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  ConsumerState createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  final InactivityObserver _inactivityObserver = InactivityObserver();
  String languageCode = "en";
  bool isOnBoarding = false;
  bool isLogin = false;
  @override
  void initState() {
    languageCode = AppPreferences().getLanguage() ?? "en";

    super.initState();
    initialization();
  }

  void initialization() async {
    setState(() {  });
      isOnBoarding = await AppPreferences().getIsOnBoarding();
      isLogin = await AppPreferences().getIsLoggedIn();

    setState(() {  });


    Timer(const Duration(seconds: 2), () {
      /// Remove splash screen
      FlutterNativeSplash.remove();
    });
  }

  @override
  Widget build(BuildContext context) {
    TextStyles().initTextStyles();

    final size = MediaQuery.of(context).size;
    final width = size.width;
    Locale locale;
    try {
      locale = Locale(languageCode);
    } catch (e) {
      locale = Locale('en'); // Fallback to English if invalid
      debugPrint(
          'Invalid languageCode "$languageCode", defaulting to English.');
    }
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => _inactivityObserver.resetTimer(context),
      onPanDown: (_) => _inactivityObserver.resetTimer(context),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        child: ToastificationWrapper(
          config: const ToastificationConfig(
            // margin: EdgeInsets.fromLTRB(0, 16, 0, 110),
            alignment: Alignment.center,
            itemWidth: 1080,
            animationDuration: Duration(milliseconds: 500),
          ),
          child: MaterialApp(
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              DefaultCupertinoLocalizations.delegate,
            ],

            locale: locale,
            supportedLocales: S.delegate.supportedLocales,

            /// Navigator key for global navigation
            navigatorKey: Globals.navigatorKey,

            /// Remove debug banner
            debugShowCheckedModeBanner: false,

            /// App name
            title: "Digitifyze",

            /// Theme data
            theme: ThemeData(     scaffoldBackgroundColor: ColorStyles().white,
              useMaterial3: true,
              colorScheme:
              ColorScheme.fromSeed(seedColor:ColorStyles().orangePink!),
            ),
            home: LoaderOverlay(
              useDefaultLoading: false,
              overlayWidgetBuilder: (_) {
                return Center(
                  child: SizedBox(
                    width: width * 0.18,
                    height: width * 0.18,
                    child: const LoadingIndicator(
                      indicatorType: Indicator.ballRotateChase,
                      colors: defaultRainbowColors,
                      strokeWidth: 2,
                    ),
                  ),
                );
              },
              // child: BottomNavBarScreen(),
              child: isOnBoarding ? isLogin ? BottomNavBarScreen() : SignUpScreen() : OnBoardingScreen(),
            ),
          ),
        ),
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
