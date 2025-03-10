import 'package:digitifyze/ui/screens/tab/home/lead_screen/add_lead/add_lead_screen_controller.dart';
import 'package:digitifyze/ui/screens/tab/home/lead_screen/add_lead/widget/add_lead_body_screen.dart';
import 'package:digitifyze/ui/screens/tab/home/lead_screen/add_lead/widget/add_lead_top_bar.dart';
import 'package:digitifyze/utils/import_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_indicator/loading_indicator.dart';

class AddLeadScreen extends ConsumerStatefulWidget {
  const AddLeadScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddLeadScreenState();
}

class _AddLeadScreenState extends ConsumerState<AddLeadScreen> {
  @override
  Widget build(BuildContext context) {
    final asyncState = ref.watch(addLeadScreenControllerProvider);
    final controller = ref.read(addLeadScreenControllerProvider.notifier);

    return Scaffold(
      backgroundColor: ColorStyles().whiteLilac!,
      body: asyncState.when(
        data: (data) {
          if (asyncState.isLoading) {
            return CommonLoader();
          }
          return Stack(
            children: [
              SizedBox(
                height: 1.sh,
                child: Stack(
                  children: [
                    AddLeadTopBar(),
                    AddLeadBodyScreen(),
                  ],
                ),
              ),
              if (controller.isInsertLeadLoading)
                Positioned.fill(
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque, // Blocks all interactions
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
        },
        error: (error, stackTrace) {
          return ErrorWidget(error);
        },
        loading: () => CommonLoader(),
      ),
    );
  }
}
