import 'package:digitifyze/data/api_client.dart';
import 'package:digitifyze/model/response/login_model.dart';
import 'package:digitifyze/model/response/login_token_model.dart';
import 'package:digitifyze/ui/screens/bottom_nav_bar/bottom_nav_bar_screen.dart';

import '../utils/import_utils.dart';

abstract class LoginRepository {
  Future<LoginModel?> userLogin({
    required String emailId,
    required String password,
    required String fcmToken,
    required String loginToken,
  });
  Future<LoginTokenModel?> getLoginToken();
}

class LoginRepositoryV1 extends LoginRepository {
  LoginRepositoryV1(this.api);
  final ApiClient api;
  @override
  Future<LoginTokenModel?> getLoginToken() async {
    try {
      return await api.postBodyStringData(
        uri: Uri.parse(AppConfig.loginToken),
        body: 'grant_type=password&username=admin&password=admin',
        headers: api.createHeaders(authToken: ''),
        builder: (data) {
          Map<String, dynamic> jsonMap = json.decode(data);
          print("jsonMap $jsonMap");

          if (jsonMap["access_token"] != "" ||
              jsonMap["access_token"] != null) {
            LoginTokenModel loginTokenModel = LoginTokenModel.fromJson(jsonMap);
            print("loginTokenModel $loginTokenModel");
            AppPreferences().setLoginToken(loginTokenModel.accessToken!);
            return loginTokenModel;
          } else {
            return LoginTokenModel();
          }
        },
      );
    } catch (e) {
      debugPrint('Error during getLoginToken: $e');
      return null;
    }
  }

  @override
  Future<LoginModel?> userLogin({
    required String emailId,
    required String password,
    required String fcmToken,
    required String loginToken,
  }) async {
    final body = {
      "EmailId": emailId.trim().toString(),
      "Password": password.trim().toString(),
      "FcmToken": fcmToken.trim().toString()
    };

    try {
      return await api.postData(
        uri: Uri.parse(AppConfig.loginUrl),
        body: body,
        headers: api.createHeaders(
          authToken: '',
        ), // Adjust header logic as needed
        builder: (data) {
          Map<String, dynamic> jsonMap = json.decode(data);
          print("jsonMapFcmToken ${jsonMap["FcmToken"]}");
          if (jsonMap["ClientId"] != 0 && jsonMap["UserName"] != '') {
            LoginModel loginModel = LoginModel.fromJson(jsonMap);
            AppPreferences().setIsLoggedIn(true);
            AppPreferences().setUserId(loginModel.userId!);

            commonNavigator(child: BottomNavBarScreen());

            // // Process the response and store the token
            AppPreferences().setAuthToken(jsonMap["token"] ?? "");

            DialogServiceV1().showToast(content: jsonMap['FlagMsg']);
            return loginModel; // Map to `LoginModel`
          } else {
            DialogServiceV1()
                .showToast(hasError: true, content: jsonMap['FlagMsg']);
            return LoginModel();
          }
        },
      );
    } catch (e) {
      debugPrint('Error during designerLogin: $e');
      return null; // Handle errors gracefully
    }
  }
}

// Provider for LoginRepository
final loginRepositoryProvider = Provider<LoginRepository>((ref) {
  return LoginRepositoryV1(ApiClient());
});
