import 'package:digitifyze/ui/screens/bottom_nav_bar/bottom_nav_bar_screen.dart';
import 'package:digitifyze/ui/screens/on_boarding_screen/widget/widget_on_boarding.dart';
import 'package:digitifyze/ui/screens/sign_up_screen/sign_up_screen.dart';
import 'package:digitifyze/utils/import_utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'on_boarding_screen_controller.g.dart';

@riverpod
class OnBoardingScreenController extends _$OnBoardingScreenController {
  late List<Widget> _onBoardingList = [];
  List<Widget> get onBoardingList => _onBoardingList;
  int _currentPage = 0;
  int get currentPage => _currentPage;
  PageController pageController = PageController();


  @override
  Future<void> build() async {
    state = AsyncLoading();
    // Initialize your onboarding data
    final context = Globals.navigatorKey.currentContext!;
    _onBoardingList = [
      WidgetOnBoarding(
        title: S.of(context).splash1Title,
        subTitle: /*S.of(context).splash1SubTitle*/"",
        imgPath: AppImg.splash1,
        firstPage: true,
      ),
      WidgetOnBoarding(
          title: S.of(context).splash2Title,
          subTitle: S.of(context).splash2SubTitle,
          imgPath: AppImg.splash2),
      WidgetOnBoarding(
          title: S.of(context).splash3Title,
          subTitle: S.of(context).splash3SubTitle,
          imgPath: AppImg.splash3),
      WidgetOnBoarding(
          title: S.of(context).splash4Title,
          subTitle: S.of(context).splash4SubTitle,
          imgPath: AppImg.splash4),
    ];
    bool isOnBoarding = await AppPreferences().getIsOnBoarding();
    bool isLogin = await AppPreferences().getIsLoggedIn();


    if(isOnBoarding){
      commonNavigatorPushAndRemoveUntil(child:isLogin ? BottomNavBarScreen(): const SignUpScreen());

    }
    state = AsyncValue.data(null);
  }

  changePage({required int index}) {
    state = AsyncLoading();
    pageController.animateToPage(index,
        duration: Duration(milliseconds: 100), curve: Curves.linear);

    _currentPage = index;
    debugPrint("Current Page => $_currentPage");

    state = AsyncValue.data(_currentPage);
  }

  navigateToSignup() {
    state = AsyncLoading();
    debugPrint("Current Page => $_currentPage");

    if (_currentPage < _onBoardingList.length - 1) {
      // Navigate to the next page
      pageController.animateToPage(
        _currentPage + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      _currentPage++;
    } else {
      AppPreferences().setIsOnBoarding(true);


      // Navigate to SignUpScreen when on the last page
      commonNavigatorPushAndRemoveUntil(child: const SignUpScreen());
    }
    state = AsyncValue.data(_currentPage);
  }
}
