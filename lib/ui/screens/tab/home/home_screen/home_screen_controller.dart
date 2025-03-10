import 'package:digitifyze/utils/images.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../utils/import_utils.dart';

part 'home_screen_controller.g.dart';

@riverpod

class HomeScreenController extends _$HomeScreenController{

  List<Map<String, dynamic>> getMenuList({required BuildContext context}) {
    return [
      {
        'imgPath': AppImg.analytics,
        'title': S.of(context).analytics,
      },
      {
        'imgPath': AppImg.addLead,
        'title': S.of(context).addLead,
      },
      {
        'imgPath': AppImg.kycVerification,
        'title': S.of(context).kycVerification,
      },
      {
        'imgPath': AppImg.onBoarding,
        'title': S.of(context).onBoarding,
      },
      {
        'imgPath': AppImg.productAssign,
        'title': S.of(context).productAssign,
      },
      {
        'imgPath': AppImg.agreementGeneration,
        'title': S.of(context).agreementGeneration,
      },
      {
        'imgPath': AppImg.assetsManagement,
        'title': S.of(context).assetsManagement,
      },
      {
        'imgPath': AppImg.paymentTracker,
        'title': S.of(context).paymentTracker,
      },
      {
        'imgPath': AppImg.serviceTicketing,
        'title': S.of(context).serviceTicketing,
      },
    ];
  }

  List<Map<String,dynamic>> homeMenuList  = [
    {
      'imgPath' : AppImg.analytics,
      'title' : 'Analytics',
    },
    {
      'imgPath' : AppImg.addLead,
      'title' : 'Add Lead',
    },
    {
      'imgPath' : AppImg.kycVerification,
      'title' : 'KYC Verification',
    },
    {
      'imgPath' : AppImg.onBoarding,
      'title' : 'OnBoarding',
    },
    {
      'imgPath' : AppImg.productAssign,
      'title' : 'Product Assign',
    },
    {
      'imgPath' : AppImg.agreementGeneration,
      'title' : 'Agreement Generation',
    },
    {
      'imgPath' : AppImg.assetsManagement,
      'title' : 'Assets Management',
    },
    {
      'imgPath' : AppImg.paymentTracker,
      'title' : 'Payment Tracker',
    },
    {
      'imgPath' : AppImg.serviceTicketing,
      'title' : 'service Ticketing',
    },
  ];



  @override
  FutureOr<void> build() {

  }

}
