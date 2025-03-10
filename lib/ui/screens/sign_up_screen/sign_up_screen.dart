import 'package:digitifyze/ui/screens/bottom_nav_bar/bottom_nav_bar_screen.dart';
import 'package:digitifyze/ui/screens/sign_up_screen/sign_up_screen_controller.dart';
import 'package:digitifyze/ui/widgets/common_widgets/text_input_field.dart';
import 'package:digitifyze/ui/widgets/validate.dart';
import 'package:digitifyze/utils/import_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends ConsumerWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

     final asyncState = ref.watch(signUpScreenControllerProvider);
     controller()=> ref.read(signUpScreenControllerProvider.notifier);

    return Scaffold(
      resizeToAvoidBottomInset: false, // Prevents resizing when the keyboard opens
      body: asyncState.when(
          data: (data) {
            return Stack(
              fit: StackFit.expand,
              children: [
                // Background Image
                Positioned(
                  bottom: 0,child: Image.asset(
                  AppImg.bgOnBoarding,
                  fit: BoxFit.cover,
                  height:591.29.h,
                  width: 591.29.h,
                ),
                ),

                // Content
                SafeArea(
                  child: Container(padding: EdgeInsets.symmetric(vertical: 70.h,horizontal:20.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Upper Section (Logo + Text)
                        Column(
                          children: [
                            Image.asset(
                              AppImg.logo,
                              height: 73.h,
                              width: 54.w,
                            ),
                            SizedBox(height: 5.h),
                            Image.asset(
                              AppImg.appName,
                              height: 50.h,
                              width: 300.w,
                            ),
                          ],
                        ),

                        // Text(
                        //   "Login To Your Account",
                        //   textAlign: TextAlign.center,
                        //   style: const TextStyle(
                        //     fontSize: 20,
                        //     fontWeight: FontWeight.w400,
                        //     color: Colors.black,
                        //   ),
                        // ),

                        // Email Field
                        Column(
                          children: [
                            TextInputField(
                              hintText: S.of(context).email,
                              hintStyle: TextStyles().bentonSansSize14Regular(color: ColorStyles().black!.withAlpha((0.3 * 255).round())),
                              controller: controller().emailController,
                              keyboardType: TextInputType.emailAddress,
                              containerwidth: 325.w,
                              containerheight: 57.h,
                              containercolor: ColorStyles().white!,
                              borderRadius: BorderRadius.circular(15.r),
                              underline: false,
                              containerborder: Border.all(color: ColorStyles().borderGray!,width: 1.0),
                              textCapitalization: TextCapitalization.none,
                              textInputAction: TextInputAction.next, textFieldsBorder: false,
                              errorText: controller().isSubmit ? validateEmail(controller().emailController.text) : null ,
                              errorStyle: TextStyles().robotoSize14Regular(color: ColorStyles().errorRed!).copyWith(fontSize: 12),
                            ),
                            SizedBox(height: 12.h),
                            // Password Field
                            TextInputField(
                              hintText: S.of(context).password,
                              hintStyle: TextStyles().bentonSansSize14Regular(color: ColorStyles().black!.withAlpha((0.3 * 255).round())),
                              controller: controller().passwordController,
                              keyboardType: TextInputType.text,
                              containerwidth: 325.w,
                              containerheight: 57.h,
                              containercolor: ColorStyles().white!,
                              borderRadius: BorderRadius.circular(15.r),
                              underline: false,
                              containerborder: Border.all(color: ColorStyles().borderGray!,width: 1.0),
                              textCapitalization: TextCapitalization.none,
                              textInputAction: TextInputAction.go, textFieldsBorder: false,
                              errorText: controller().isSubmit ? validatePassword(controller().passwordController.text) : null ,
                              errorStyle: TextStyles().robotoSize14Regular(color: ColorStyles().errorRed!).copyWith(fontSize: 12),
                            ),
                          ],
                        ),

                        // Bottom Section (Button + Forgot Password)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                S.of(context).forgotYourPassword,
                                style: TextStyles().robotoSize14Regular(color: ColorStyles().black!).copyWith(decoration: TextDecoration.underline),
                              ),
                            ),
                            SizedBox(height: 10.h),
                            GestureDetector(
                              onTap: () {
                                // Handle Login Button Click
                                if(validateEmail(controller().emailController.text) == null && validatePassword(controller().passwordController.text) == null){
                                  controller().onLoginButtonTap();
                                }else{
                                  controller().changeSubmitValue(true);
                                }
                              },
                              child: Container(
                                padding:  EdgeInsets.symmetric(
                                  horizontal: 60.w,
                                  vertical: 18.h,
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.r),
                                    color: ColorStyles().orangePink
                                ),
                                child: Text(
                                    S.of(context).login,
                                    style: TextStyles().bentonSansSize16Regular(color: ColorStyles().white!)
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
          error: (error, stackTrace) {
            return ErrorWidget(error);
          },
          loading: () {
            return CommonLoader();
          },),
    );
  }
}
