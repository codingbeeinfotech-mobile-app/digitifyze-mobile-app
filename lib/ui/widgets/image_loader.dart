import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:digitifyze/ui/widgets/common_widgets/common_loader.dart';
import 'package:digitifyze/ui/widgets/svg_icon.dart';
import 'package:digitifyze/utils/images.dart';

class ImageLoader extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double? width;
  final String placeholderImage;
  final AlignmentGeometry alignment;

  const ImageLoader({
    super.key,
    required this.imageUrl,
    required this.height,
    this.width,
    this.alignment = Alignment.center,
    this.placeholderImage = AppImg.placeholderImage,
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrl.isEmpty || imageUrl == '' || imageUrl == null) {
      return placeholderImage.isNotEmpty
          ? Container(
              color: Colors.grey,
              height: height * 1.2,
              width: width! * 1.2,
              child: Center(
                child: svgIcon(
                  name: placeholderImage,
                  height: height * 0.8,
                  width: width! * 0.8,
                ),
              ),
            )
          : const SizedBox();
    }
    return CachedNetworkImage(
      imageUrl: imageUrl,
      height: height,
      width: width,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => SizedBox(
        height: height,
        width: width,
        child: CommonLoader(),
      ),
      errorWidget: (
        context,
        url,
        error,
      ) {
        return placeholderImage.isNotEmpty
            ? Container(
                height: height * 1.2,
                width: width! * 1.2,
                color: Colors.grey,
                child: Center(
                  child: svgIcon(
                    color: Colors.white,
                    name: placeholderImage,
                    height: height * 0.8,
                    width: width! * 0.8,
                  ),
                ),
              )
            : const SizedBox();
      },
    );
  }
}
