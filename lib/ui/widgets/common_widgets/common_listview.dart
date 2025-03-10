import 'package:digitifyze/utils/import_utils.dart';

class CommonListView extends ConsumerWidget {
  final int itemCount;
  final Axis scrollDirection;
  final bool shrinkWrap;
  final double width;
  final double height;
  final ScrollController? controller;
  final EdgeInsetsGeometry? padding;
  final ScrollPhysics? physics;
  final Widget Function(BuildContext, int) itemBuilder;
  final Color? color;

  // Constructor with required fields and optional parameters
  const CommonListView({
    Key? key,
    required this.itemCount,
    required this.scrollDirection,
    required this.shrinkWrap,
    required this.padding,
    required this.width,
    required this.height,
    this.controller,
    this.color,
    this.physics,
    required this.itemBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Container(
      width: width,
      height: height,
      color: color,
      padding: padding,
      child: itemCount != 0
          ? ListView.builder(
              controller: controller,
              itemCount: itemCount,
              physics: physics,
              padding: EdgeInsets.zero,
              scrollDirection: scrollDirection,
              shrinkWrap: shrinkWrap,
              itemBuilder: itemBuilder,
            )
          : Center(
              child: noDataCommonText(
                style: TextStyle(
                  fontSize: h * 0.025,
                  overflow: TextOverflow.ellipsis,

                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
    );
  }
}
