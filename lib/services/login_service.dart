import 'package:digitifyze/data/login_repo.dart';
import 'package:digitifyze/model/response/login_token_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../model/response/login_model.dart';

abstract class LoginService {
  Future<LoginModel?> userLogin({
    required String emailId,
    required String password,  required String loginToken,
    required String fcmToken,
  });
  Future<LoginTokenModel?> getLoginToken();
 }

class LoginServiceV1 implements LoginService {
  LoginServiceV1(
    this.loginRepository,
  );

  final LoginRepository loginRepository;

  @override
  Future<LoginModel?> userLogin({
    required String emailId,  required String loginToken,
    required String password,
    required String fcmToken,
  }) async {
    return await loginRepository.userLogin(
        emailId: emailId, password: password, fcmToken: fcmToken,loginToken: loginToken);
  }

  @override
  Future<LoginTokenModel?> getLoginToken() async {
    return await loginRepository.getLoginToken();
  }
}

final loginServiceProvider = Provider.autoDispose<LoginService>((ref) {
  final service = LoginServiceV1(
    ref.watch(loginRepositoryProvider),
  );
  return service;
});
