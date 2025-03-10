import 'package:digitifyze/utils/styles/color_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomRadio extends ConsumerWidget {
  final int value;
  final int? groupValue;
  final ValueChanged<int?>? onChanged;
  final double size;
  const CustomRadio({
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.size,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        onChanged?.call(value);
      },
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey, width: w * 0.004),
          // color:  value != groupValue ? Colors.white : ColorStyles().Main_linear,
        ),
        child: Center(
          child: value != groupValue
              ? null
              : Container(
            width: 16.0,
            height: 16.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
