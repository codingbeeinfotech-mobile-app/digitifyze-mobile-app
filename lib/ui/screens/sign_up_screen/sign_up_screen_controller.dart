import 'package:digitifyze/model/response/login_model.dart';
import 'package:digitifyze/model/response/login_token_model.dart';
import 'package:digitifyze/services/login_service.dart';
import 'package:digitifyze/ui/screens/bottom_nav_bar/bottom_nav_bar_screen.dart';
import 'package:digitifyze/ui/widgets/validate.dart';
import 'package:digitifyze/utils/import_utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'sign_up_screen_controller.g.dart';

@riverpod
class SignUpScreenController extends _$SignUpScreenController {
  final signUpFormKey = GlobalKey<FormState>();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isSubmit = false;
  bool get isSubmit => _isSubmit;

  String _fcmToken = "";
  String _loginToken = "";
  late LoginTokenModel loginTokenModel;
  late LoginModel? loginModel;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  changeSubmitValue(value) {
    state = AsyncLoading();
    _isSubmit = value;
    state = AsyncValue.data(_isSubmit);
  }

  onLoginButtonTap() async {
    state = AsyncLoading();
    // if(validateEmail(emailController.text) == null && validatePassword(passwordController.text) == null){
    _isLoading = true;
    loginModel = (await ref.read(loginServiceProvider).userLogin(
        emailId: emailController.text,
        loginToken: AppPreferences().getLoginToken(),
        password: passwordController.text,
        fcmToken: _fcmToken)) ;

    _isLoading = false;

    state = const AsyncValue.data(null);
    // }
  }

  getLoginToken() async {
    try {
      final tokenModel = await ref.read(loginServiceProvider).getLoginToken();
      if (tokenModel != null) {
        loginTokenModel = tokenModel;
        _loginToken = AppPreferences().getLoginToken();
      } else {
        debugPrint("Error: loginTokenModel is null");
      }
    } catch (e, stackTrace) {
      debugPrint("Exception in build: $e\n$stackTrace");
    }
  }

  Future<void> build() async {
    state = AsyncLoading();
    getLoginToken();
    _fcmToken = AppPreferences().getFCMToken();

    debugPrint("FCM Token Is =dgfg=== $_fcmToken $_loginToken");
    state = AsyncValue.data(null);
  }
}
