import 'package:digitifyze/ui/screens/tab/home/assets_management_screen/assets_management_controller.dart';
import 'package:digitifyze/ui/widgets/common_widgets/common_iconbutton.dart';
import 'package:digitifyze/utils/import_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AssetsManagementScreen extends ConsumerStatefulWidget {
  const AssetsManagementScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState()=>_AssetsManagementScreen();
}


class _AssetsManagementScreen extends ConsumerState<AssetsManagementScreen> with TickerProviderStateMixin{


  late TabController tabController;


  @override
  void initState() {
    tabController = TabController(length: 3,vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final asyncState = ref.watch(assetsManagementControllerProvider);

    return Scaffold(
      backgroundColor: ColorStyles().whiteLilac!,
      body: asyncState.when(data: (data) {
        return SizedBox(
          height: 1.sh,
          child: Stack(
            children: [
              _buildTopBar(),
              _buildTabBarView(),
            ],
          ),
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


  Widget _buildTopBar(){
    return Container(
      height: 257.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            ColorStyles().celestialBlue!,
            ColorStyles().orangePink!,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          // stops: [0.0, 0.7],
        ),
      ),
      child: Column(
        children: [
          AppBar(
            backgroundColor: Colors.transparent,
            leading: CommonIconButton(
              containerwidth: 50.h,
              containerheight: 50.h,
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              centericon: Icon(Icons.arrow_back_outlined,color: ColorStyles().white!,),
              onPressed: () {
                Navigator.pop(context);
              },

            ),
            centerTitle: true,
            title: commonText(text : S.of(context).assetsManagement,style: TextStyles().robotoSize16SemiBold(color: ColorStyles().white!).copyWith(fontSize: 20)),

          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Container(
              padding: EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                border: Border.all(color: ColorStyles().white!),
                borderRadius: BorderRadius.circular(50.r)
              ),
              child: Row(
                children: [
                  Expanded(
                    child: _buildTab(
                      title: "Fresh Stock",
                      index: 0,
                    ),
                  ),
                  Expanded(
                    child: _buildTab(
                      title: "Assigned",
                      index: 1,
                    ),
                  ),
                  Expanded(
                    child: _buildTab(
                      title: "Recovered",
                      index: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab({required String title,required int index}) {
    final tabWatch = ref.watch(assetsManagementControllerProvider);
    controller ()=> ref.read(assetsManagementControllerProvider.notifier);
    return GestureDetector(
      onTap: () {
        controller().changePage(index: index);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          color: controller().currentPage == index ? ColorStyles().white : Colors.transparent,
          borderRadius: BorderRadius.circular(50.r),
        ),
        child: commonText(text: title,textAlign: TextAlign.center,style: TextStyles().robotoSize16Medium(color: controller().currentPage == index ? ColorStyles().orangePink! :ColorStyles().white!)),
      ),
    );
  }

  Widget _buildTabBarView () {
    controller()=> ref.read(assetsManagementControllerProvider.notifier);
    final tabWatch = ref.watch(assetsManagementControllerProvider);
    return Positioned(
      top: 90.h,
      left: 13.5.w,
      right: 13.5.w,
      child: Container(
        height: 1.sh,
        padding: EdgeInsets.only(bottom: 32.h),
        child: PageView.builder(
          itemCount: controller().tabList.length,
          controller: controller().pageController,
          onPageChanged: (value) {
            controller().changePage(index: value);
          },
          itemBuilder: (context, index) {
            return Container(
                padding: EdgeInsets.symmetric(vertical: 70.h),
                child:  controller().tabviewList
                    .elementAt(controller().currentPage));
          },
        ),
      ),
    );
  }



}