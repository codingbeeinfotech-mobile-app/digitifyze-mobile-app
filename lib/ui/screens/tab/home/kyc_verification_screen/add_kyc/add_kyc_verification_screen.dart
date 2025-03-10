import 'package:digitifyze/ui/screens/tab/home/kyc_verification_screen/add_kyc/widget/add_kyc_verification_top_bar.dart';
import 'package:digitifyze/ui/screens/tab/home/kyc_verification_screen/add_kyc/widget/add_kyc_verification_body.dart';
import 'package:digitifyze/utils/import_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_indicator/loading_indicator.dart';

import 'add_kyc_verification_screen_controller.dart';

class AddKycVerificationScreen extends ConsumerWidget {
  final int existLeadId;
  const AddKycVerificationScreen({super.key,required this.existLeadId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final asyncState = ref.watch(addKycVerificationScreenControllerProvider(existLeadId:existLeadId));
    controller() => ref.read(addKycVerificationScreenControllerProvider(existLeadId:existLeadId).notifier);

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
                      AddKycVerificationTopBar(),
                      AddKycVerificationBodyScreen(existLeadId: existLeadId,),
                    ],
                  ),
                ),
                if (controller().isInsertKycLoading)
                  Positioned.fill(
                    child: GestureDetector(
                      behavior:
                          HitTestBehavior.opaque, // Blocks all interactions
                      onTap: () {}, // Prevents user from clicking
                      child: Container(
                        color: Colors.black.withOpacity(0.5), // Semi-transparent overlay
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
