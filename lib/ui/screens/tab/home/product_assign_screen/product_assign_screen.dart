import 'package:digitifyze/ui/screens/tab/home/product_assign_screen/product_assign_form_screen/product_assign_form_screen.dart';
import 'package:digitifyze/ui/widgets/common_widgets/common_iconbutton.dart';
import 'package:digitifyze/ui/widgets/common_widgets/text_input_field.dart';
import 'package:digitifyze/utils/import_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductAssignScreen extends ConsumerStatefulWidget{
  const ProductAssignScreen({super.key});


  @override
  ConsumerState createState() => _ProductAssignStateScreen();

}

class _ProductAssignStateScreen extends ConsumerState<ProductAssignScreen> {
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: ColorStyles().whiteLilac!,
    body: SizedBox(
      height: 1.sh,
      child: Stack(
        children: [
          _buildTopBar(),
          _buildProductData(),
        ],
      ),
    ),
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
            title: commonText(text : S.of(context).productAssign,style: TextStyles().robotoSize16SemiBold(color: ColorStyles().white!).copyWith(fontSize: 20)),
          ),
        ],
      ),
    );
  }

  Widget _buildProductData () {
    return Positioned(
      top: 90.h,
      left: 13.5.w,
      right: 13.5.w,
      bottom: 8.h,
      child: Container(
        decoration: BoxDecoration(
            color: ColorStyles().white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(8.r),topRight: Radius.circular(8.r))
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 16.h,),
              Container(
                decoration: BoxDecoration(
                    color: ColorStyles().white!,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(8.r),topRight: Radius.circular(8.r))
                ),
                alignment: Alignment.topCenter,
                height: 61.h,
                child: TextInputField(
                  hintText: S.of(context).searchPartnerId,
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Color(0xff070821)),
                  controller: null,
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
                ),
              ),
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        commonNavigator(child: ProductAssignFormScreen());
                      },
                      child: Container(
                        width: 1.sw,
                        padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.w),
                        decoration: BoxDecoration(
                          color: ColorStyles().white!,
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(color: ColorStyles().borderGray!),
                          boxShadow: [
                            BoxShadow(
                              color: ColorStyles().softLavenderBlue!.withAlpha((0.4 * 255).round()), // Shadow color with 7% opacity
                              offset: Offset(0, 0), // X and Y offset
                              blurRadius: 5, // Blur radius
                              spreadRadius: 0, // Spread radius
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(child: commonText(text: "P00${index+1}",maxLines: 2,style: TextStyles().robotoSize16Bold(color: ColorStyles().black!))),
                                commonText(text: "19/01/2025", style: TextStyles().robotoSize16Medium(color: ColorStyles().black!)),
                              ],
                            ),
                            SizedBox(height: 2.h,),
                            commonText(text: "Test Name ${index+1}", style: TextStyles().robotoSize16Medium(color: ColorStyles().black!)),
                            SizedBox(height: 2.h,),
                            commonText(text: "9899985865", style: TextStyles().robotoSize16Medium(color: ColorStyles().black!)),
                          ],
                        ),
                      ),
                    );
                  }, separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 16.h,);
                },),
              ),
            ],
          ),
        ),
      ),
    );
  }

}