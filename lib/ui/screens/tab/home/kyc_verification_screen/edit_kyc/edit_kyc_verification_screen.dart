import 'package:digitifyze/ui/screens/tab/home/kyc_verification_screen/add_kyc/widget/add_kyc_verification_top_bar.dart';
import 'package:digitifyze/ui/screens/tab/home/kyc_verification_screen/edit_kyc/edit_kyc_verification_screen_controller.dart';
import 'package:digitifyze/ui/screens/tab/home/kyc_verification_screen/edit_kyc/widget/edit_kyc_verification_body.dart';
import 'package:digitifyze/ui/screens/tab/home/kyc_verification_screen/kyc_lead_list_screen_controller.dart';
import 'package:digitifyze/ui/screens/tab/home/kyc_verification_screen/add_kyc/widget/add_kyc_verification_body.dart';
import 'package:digitifyze/utils/import_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_indicator/loading_indicator.dart';

import 'widget/edit_kyc_verification_top_bar.dart';

class EditKycVerificationScreen extends ConsumerWidget {
  final int existLeadId;
  const EditKycVerificationScreen({super.key, required this.existLeadId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final asyncState = ref.watch(
        editKycVerificationScreenControllerProvider(existLeadId: existLeadId));
    controller() => ref.read(
        editKycVerificationScreenControllerProvider(existLeadId: existLeadId)
            .notifier);

    return Scaffold(
      backgroundColor: ColorStyles().whiteLilac!,
      body: asyncState.when(
        data: (data) {
          if (controller().isLoading) {
            return CommonLoader();
          } else {
            return Stack(
              children: [
                SizedBox(
                  height: h,
                  child: Stack(
                    children: [
                      EditKycVerificationTopBar(),
                      EditKycVerificationBodyScreen(existLeadId:existLeadId ,),
                    ],
                  ),
                ),
                if (controller().isUpdateKycLoading)
                  Positioned.fill(
                    child: GestureDetector(
                      behavior:
                          HitTestBehavior.opaque, // Blocks all interactions
                      onTap: () {}, // Prevents user from clicking
                      child: Container(
                        color: Colors.black
                            .withOpacity(0.5), // Semi-transparent overlay
                        child: Center(
                          child: SizedBox(
                            width: 100.w,
                            height: 100.h,
                            child: const LoadingIndicator(
                              indicatorType: Indicator.ballRotateChase,
                              colors: defaultRainbowColors,
                              strokeWidth: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            );
          }
        },
        error: (error, stackTrace) {
          return ErrorWidget(error);
        },
        loading: () {
          return CommonLoader();
        },
      ),
    );
  }
}
