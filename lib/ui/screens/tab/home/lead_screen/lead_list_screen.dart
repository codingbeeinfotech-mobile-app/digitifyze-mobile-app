import 'package:digitifyze/ui/screens/tab/home/lead_screen/add_lead/add_lead_screen.dart';
import 'package:digitifyze/ui/screens/tab/home/lead_screen/edit_lead/edit_lead_screen.dart';
import 'package:digitifyze/ui/screens/tab/home/lead_screen/lead_screen_controller.dart';
import 'package:digitifyze/ui/widgets/common_widgets/common_iconbutton.dart';
import 'package:digitifyze/ui/widgets/common_widgets/text_input_field.dart';
import 'package:digitifyze/utils/import_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class LeadListScreen extends ConsumerWidget {
  const LeadListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(leadScreenControllerProvider);
    controller() => ref.read(leadScreenControllerProvider.notifier);

    return Scaffold(
      backgroundColor: ColorStyles().whiteLilac!,
      appBar: AppBar(
        backgroundColor: ColorStyles().white!,
        leading: CommonIconButton(
          containerwidth: 50.h,
          containerheight: 50.h,
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.r),
          ),
          centericon: Icon(
            Icons.arrow_back_outlined,
            color: ColorStyles().orangePink!,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: commonText(
            text: S.of(context).leads,
            style: TextStyles()
                .robotoSize16SemiBold(color: Colors.black)
                .copyWith(fontSize: 20)),
        centerTitle: true,
        // Search bar
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(61.h),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              color: ColorStyles().white!,
              alignment: Alignment.topCenter,
              height: 61.h,
              child: TextInputField(
                hintText: S.of(context).searchLead,
                hintStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Color(0xff070821)),
                controller: controller().searchLeadController,
                keyboardType: null,
                containerwidth: 335.w,
                containerheight: 40.h,
                containercolor:
                    ColorStyles().metalicSilver!.withAlpha((0.2 * 255).round()),
                prefix: Padding(
                  padding: EdgeInsets.only(left: 12.w, right: 8.w),
                  child: Icon(Icons.search, color: Color(0xff070821)),
                ),
                prefixIconConstraints: BoxConstraints(minWidth: 0.w),
                borderRadius: BorderRadius.circular(10.0),
                underline: false,
                containerborder:
                    Border.all(color: ColorStyles().mercury!, width: 1.0),
                textCapitalization: TextCapitalization.none,
                textInputAction: TextInputAction.go,
                textFieldsBorder: false,
                onChanged: (value) {
                  controller().pageId = 1;
                  controller().getLeadList();
                },
              ),
            )),
      ),
      body: asyncState.when(
        data: (data) {
          if (controller().isLoading) {
            return CommonLoader();
          } else {
            return SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 35.h,
                    ),
                    // Data table

                    if (controller().getLeadDataList.isEmpty) ...[
                      Container(
                          height: 525.h,
                          margin: EdgeInsets.symmetric(horizontal: 14.w),
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 16.h),
                          decoration: BoxDecoration(
                              color: ColorStyles().white!,
                              borderRadius: BorderRadius.circular(10.r)),
                          child: Center(
                              child: noDataCommonText(
                                  style: TextStyles().robotoSize16Medium(
                                      color: ColorStyles().errorRed!))))
                    ] else ...[
                      Container(
                        height: 525.h,
                        margin: EdgeInsets.symmetric(horizontal: 14.w),
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 16.h),
                        decoration: BoxDecoration(
                            color: ColorStyles().white!,
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Container(
                          decoration: BoxDecoration(
                            color: ColorStyles().white!,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Column(
                            children: [
                              // Table Header
                              Container(
                                decoration: BoxDecoration(
                                    color: ColorStyles().orangePink!,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10.r),
                                        topRight: Radius.circular(10.r))),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 16.h, horizontal: 8.w),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                          padding: EdgeInsets.only(right: 8.0),
                                          child: commonText(
                                              text: "#",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                  fontWeight:
                                                      FontWeight.w400))),
                                      Expanded(
                                          flex: 2,
                                          child: Container(
                                              // color: Colors.red,
                                              child: commonText(
                                                  text: S.of(context).leadName,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400)))),
                                      Expanded(
                                          flex: 1,
                                          child: commonText(
                                              text: S.of(context).leadID,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                  fontWeight:
                                                      FontWeight.w400))),
                                      Expanded(
                                          child: commonText(
                                              text: S.of(context).addDate,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                  fontWeight:
                                                      FontWeight.w400))),
                                      Expanded(
                                          flex: 1,
                                          child: commonText(
                                              text: S.of(context).status,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                  fontWeight:
                                                      FontWeight.w400))),
                                    ],
                                  ),
                                ),
                              ),
                              // Table Rows
                              Flexible(
                                child: Container(
                                  // height: h * 0.485,
                                  decoration: BoxDecoration(
                                      border: Border(
                                    left: BorderSide(
                                        color: ColorStyles().borderGray!),
                                    right: BorderSide(
                                        color: ColorStyles().borderGray!),
                                    bottom: BorderSide(
                                        color: ColorStyles().borderGray!),
                                  )),
                                  child: ListView.builder(
                                    itemCount:
                                        controller().getLeadDataList.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      var data =
                                          controller().getLeadDataList[index];
                                      return GestureDetector(
                                        onTap: () {
                                          controller()
                                              .onTapLeadList(data.leadId ?? 0);
                                          commonNavigator(child: EditLeadScreen(existLeadId: data.leadId!,));
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8.w, vertical: 12.h),
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  bottom: BorderSide(
                                                      color: ColorStyles()
                                                          .borderGray!))),
                                          child: Row(
                                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                  width: 16.w,
                                                  child: commonText(
                                                      text: "${((controller().pageId - 1) * controller().recordCount) + (index + 1)}",
                                                      style: TextStyles()
                                                          .robotoSize14Regular(
                                                              color: ColorStyles()
                                                                  .customGray!)
                                                          .copyWith(
                                                              fontSize:
                                                                  10.sp))),
                                              SizedBox(
                                                width: 2.w,
                                              ),
                                              Expanded(
                                                  flex: 2,
                                                  child: Container(
                                                      // color: Colors.yellow,
                                                      child: commonText(
                                                          text:
                                                              data.firstName ??
                                                                  '-',
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: TextStyles()
                                                              .robotoSize14Regular(
                                                                  color: ColorStyles()
                                                                      .customGray!)
                                                              .copyWith(
                                                                  fontSize:
                                                                      10.sp)))),
                                              SizedBox(
                                                width: 2.w,
                                              ),
                                              Expanded(
                                                  flex: 1,
                                                  child: commonText(
                                                      text: data.leadCode!
                                                          .toString(),
                                                      style: TextStyles()
                                                          .robotoSize14Regular(
                                                              color: ColorStyles()
                                                                  .customGray!)
                                                          .copyWith(
                                                              fontSize: 10.sp,
                                                              decoration:
                                                                  TextDecoration
                                                                      .underline))),
                                              SizedBox(
                                                width: 2.w,
                                              ),
                                              Expanded(
                                                  flex: 1,
                                                  child: commonText(
                                                      text: DateFormat(
                                                              "dd/MM/yyyy")
                                                          .format(
                                                              data.entryDate!),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyles()
                                                          .robotoSize14Regular(
                                                              color: ColorStyles()
                                                                  .customGray!)
                                                          .copyWith(
                                                              fontSize:
                                                                  10.sp))),
                                              SizedBox(
                                                width: 2.w,
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: commonText(
                                                  text: controller()
                                                          .getLeadDataList[
                                                              index]
                                                          .status ??
                                                      '-', // Function to get text based on index
                                                  textAlign: TextAlign.end,
                                                  style: TextStyles()
                                                      .robotoSize14Regular(
                                                          color: getStatusColor(
                                                              controller()
                                                                      .getLeadDataList[
                                                                          index]
                                                                      .status ??
                                                                  '-') // Function to get color based on index
                                                          )
                                                      .copyWith(
                                                          fontSize: 10.sp),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              // Pagination
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    commonText(
                                        text:
                                            "Total: ${controller().totalCount}",
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: ColorStyles().customGray,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400)),
                                    SizedBox(
                                      width: 8.w,
                                    ),
                                    if (controller().pageId > 1)
                                      GestureDetector(
                                        onTap: () {
                                          controller().pageId = controller().pageId - 1;
                                          controller().getLeadList();
                                        },
                                        child: Container(
                                          // color: Colors.red,
                                          padding: EdgeInsets.all(4.0),
                                          child: Icon(
                                            Icons.arrow_back_ios_new_rounded,
                                            size: 10.h,
                                            color: ColorStyles().customGray,
                                          ),
                                        ),
                                      ),
                                    Row(
                                      children: List.generate(
                                        (controller().totalCount / controller().recordCount).ceil(),
                                        (index) {
                                          return Padding(
                                            padding: EdgeInsets.only(
                                                right: 4.w,
                                                left: index == 0 ? 4.w : 0),
                                            child: commonText(
                                                text: "${index + 1}",
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    color: controller().pageId == index + 1
                                                        ? ColorStyles()
                                                            .customGray
                                                        : ColorStyles()
                                                            .metalicSilver,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                          );
                                        },
                                      ),
                                    ),
                                    if ((controller().totalCount / controller().recordCount).ceil() > controller().pageId)
                                      GestureDetector(
                                        onTap: () {
                                          controller().pageId = controller().pageId + 1;
                                          controller().getLeadList();
                                        },
                                        child: Container(
                                          // color: Colors.red,
                                           padding: EdgeInsets.all(4.0),
                                          child: Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            size: 10.h,
                                            color: ColorStyles().customGray,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                    SizedBox(height: 22.h),
                    // Add Lead Button
                    ElevatedButton.icon(
                      onPressed: () {
                        // Add Lead action
                        commonNavigator(child: AddLeadScreen());
                      },
                      icon: Icon(
                        Icons.add,
                        color: ColorStyles().white!,
                      ),
                      label: commonText(
                          text: S.of(context).addLead,
                          style: TextStyles()
                              .robotoSize16Regular(color: ColorStyles().white!)
                              .copyWith(fontSize: 14)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorStyles().orangePink!,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 30.w, vertical: 12.h),
                      ),
                    ),
                  ],
                ),
              ),
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

  Color getStatusColor(String status) {
    switch (status) {
      case "Start KYC":
        return ColorStyles().orangePink!;
      case "Pending":
        return ColorStyles().orangeyYellow!;
      case "Accepted":
        return ColorStyles().irishGreen!;
      case "Rejected":
        return Colors.red; // Example color for "Re-Work"
      case "Re-work":
        return ColorStyles().lightOrangeMustard!; // Example color for "Accepted"
      default:
        return Colors.grey; // Default color for "Pending"
    }
  }

}
