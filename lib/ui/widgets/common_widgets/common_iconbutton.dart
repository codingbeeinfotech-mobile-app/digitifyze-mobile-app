import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommonIconButton extends ConsumerWidget {
  CommonIconButton({
    Key? key,
    required this.containerwidth,
    required this.containerheight,
    required this.backgroundColor,
    required this.shape,
    this.decoration,
    required this.centericon,
    required this.onPressed,
  }) : super(key: key);
  double containerwidth;
  double containerheight;
  Color backgroundColor;
  OutlinedBorder shape;
  BoxDecoration? decoration;

  Widget centericon;

  void Function() onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Container(
      width: containerwidth,
      height: containerheight,
      decoration: decoration,
      child: IconButton(
        padding: EdgeInsets.zero,
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: shape,
        ),
        onPressed: onPressed,
        icon: centericon,
      ),
    );
  }
}
