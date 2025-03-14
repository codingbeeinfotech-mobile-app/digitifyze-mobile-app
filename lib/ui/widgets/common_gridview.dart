import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:digitifyze/ui/widgets/common_widgets/common_text.dart';

class CommonGridView extends ConsumerWidget {
  int itemCount;
  Axis scrollDirection;
  bool shrinkWrap;
  double? width;
  double? height;
  EdgeInsetsGeometry? padding;
  int crossAxisCount;
  double mainAxisSpacing = 0.0;
  double crossAxisSpacing = 0.0;
  double childAspectRatio = 1.0;
  double maxCrossAxisExtent = 1.0;
  double? mainAxisExtent;
  ScrollPhysics? physics;
  Widget? Function(BuildContext, int) itemBuilder;

  CommonGridView(
      {Key? key,
      required this.itemCount,
      required this.scrollDirection,
      required this.shrinkWrap,
      required this.padding,
      required this.mainAxisExtent,
      required this.childAspectRatio,
      required this.crossAxisSpacing,
      required this.mainAxisSpacing,
      required this.crossAxisCount,
      required this.maxCrossAxisExtent,
       this.width,
       this.height,
      required this.physics,
      required this.itemBuilder})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: height,
      padding: padding,
      child: itemCount != 0
          ? GridView.builder(
              itemCount: itemCount,
              scrollDirection: scrollDirection,
              shrinkWrap: shrinkWrap,
              itemBuilder: itemBuilder,
              physics: physics,
              padding: padding,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: crossAxisSpacing,
                mainAxisSpacing: mainAxisSpacing,
                childAspectRatio: childAspectRatio,
                mainAxisExtent: mainAxisExtent,
              ),
            )
          : Center(
              child: noDataCommonText(
                  style: TextStyle(
                      fontSize: h * 0.025,
                      overflow: TextOverflow.ellipsis,
                      foreground: Paint()
                        ..shader = const LinearGradient(
                          colors: <Color>[Colors.brown, Colors.green],
                        ).createShader(const Rect.fromLTRB(105, 0, 280, 10)),
                      fontWeight: FontWeight.w600)),
            ),
    );
  }
}
