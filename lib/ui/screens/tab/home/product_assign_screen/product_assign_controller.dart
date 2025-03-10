import 'dart:io';

import 'package:digitifyze/utils/enums.dart';
import 'package:digitifyze/utils/import_utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'product_assign_controller.g.dart';

@riverpod
class ProductAssignController extends _$ProductAssignController {


  File? rickshawIdFile;
  File? batteryIdFile;
  File? chargerIdFile;

  TextEditingController assetsHandoverDateController = TextEditingController();
  TextEditingController emiStartDateController = TextEditingController();

  FocusNode assetsHandoverDateFocusNode = FocusNode();
  FocusNode emiStartDateFocusNode = FocusNode();


  String physicalWarrantyCardHandover = "";
  String brandingMaterial = "";

  bool isSave = false;


  @override
  FutureOr<void> build() async {

  }


  changeSaveValue(value) {
    state = AsyncLoading();
    isSave = value;
    state = AsyncValue.data(value);
  }

  pickFileData ({required PicType type,required File file}) async {
    state = AsyncLoading();
    if(type == PicType.rickshawId){
      rickshawIdFile = file;
    }else if(type == PicType.batteryId){
      batteryIdFile = file;
    }else if(type == PicType.chargerId){
      chargerIdFile = file;
    }
    state = AsyncValue.data(null);
  }


}
