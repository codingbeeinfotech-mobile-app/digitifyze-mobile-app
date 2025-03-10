import 'package:digitifyze/ui/screens/tab/home/on_boarding_screen/add_on_boarding_screen/widget/add_on_boarding_input_field.dart';
import 'package:digitifyze/utils/import_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widget/add_on_boarding_top_bar.dart';


class AddOnBoardingScreen extends ConsumerStatefulWidget {
  const AddOnBoardingScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InboxState();
}
class _InboxState extends ConsumerState<AddOnBoardingScreen>{



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles().whiteLilac!,
      body: SizedBox(
        height: 1.sh,
        child: Stack(
          children: [
            AddOnBoardingTopBar(),
            AddOnBoardingInputField(),
          ],
        ),
      ),
    );
  }

}
