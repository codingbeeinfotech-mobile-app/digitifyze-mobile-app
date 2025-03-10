import 'package:flutter/material.dart';

import '../../../utils/import_utils.dart';

class CommonLoader extends ConsumerWidget {
  final Color? color;
  final Color? loadercolor;

  const CommonLoader({super.key, this.color, this.loadercolor});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: CircularProgressIndicator(
        color: loadercolor ?? ColorStyles().black,
      ),
    );
    // return Container();
  }
}
