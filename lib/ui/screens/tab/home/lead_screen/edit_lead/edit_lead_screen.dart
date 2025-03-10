import 'package:digitifyze/ui/screens/tab/home/lead_screen/edit_lead/edit_lead_screen_controller.dart';
import 'package:digitifyze/ui/screens/tab/home/lead_screen/edit_lead/widget/edit_lead_body_screen.dart';
import 'package:digitifyze/ui/screens/tab/home/lead_screen/edit_lead/widget/edit_lead_top_bar.dart';
import 'package:digitifyze/utils/import_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_indicator/loading_indicator.dart';

class EditLeadScreen extends ConsumerStatefulWidget {
  final int existLeadId;
  const EditLeadScreen({super.key,required this.existLeadId});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditLeadScreenState();
}

class _EditLeadScreenState extends ConsumerState<EditLeadScreen> {
  @override
  Widget build(BuildContext context) {
    final asyncState = ref.watch(editLeadScreenControllerProvider(existLeadId: widget.existLeadId));
    final controller = ref.read(editLeadScreenControllerProvider(existLeadId: widget.existLeadId).notifier);
    return Scaffold(
      backgroundColor: ColorStyles().whiteLilac!,
      body: asyncState.when(
          data: (data) {
            if(controller.isLoading){
              return CommonLoader();
            }else{
              return Stack(
                children: [
                  SizedBox(
                    height: 1.sh,
                    child: Stack(
                      children: [
                        EditLeadTopBar(),
                        EditLeadBodyScreen(existLeadId: widget.existLeadId),
                      ],
                    ),
                  ),
                  if (controller.isInsertLeadLoading)
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
