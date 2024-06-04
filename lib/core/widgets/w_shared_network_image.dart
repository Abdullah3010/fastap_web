import 'package:cached_network_image/cached_network_image.dart';
import 'package:fastap/core/assets/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fastap/core/extension/color_extension.dart';
import 'package:fastap/core/extension/context_extension.dart';

class WSharedNetworkImage extends StatelessWidget {
  const WSharedNetworkImage({
    super.key,
    required this.imageUrl,
    this.fit,
    this.width,
    this.height,
    this.withBackground = true,
    this.isProfiel = false,
  });

  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final bool withBackground;
  final bool isProfiel;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: withBackground ? context.theme.colorScheme.naturalColor40 : null,
        borderRadius: BorderRadius.circular(5.r),
      ),
      clipBehavior: Clip.antiAlias,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: width,
        height: height,
        fit: fit ?? BoxFit.cover,
        fadeOutDuration: const Duration(milliseconds: 300),
        errorWidget: (context, url, error) {
          return Container(
            width: width ?? 75.w,
            height: height ?? 75.h,
            decoration: BoxDecoration(
              color: withBackground
                  ? context.theme.colorScheme.naturalColor40
                  : isProfiel
                      ? context.theme.colorScheme.naturalColor0
                      : null,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Center(
              child: isProfiel
                  ? Image.asset(
                      Assets.icons.imagePlaceHolder.path,
                    )
                  : Icon(
                      Icons.error,
                      color: context.theme.colorScheme.dangerColor200,
                      size: 40.w,
                    ),
            ),
          );
        },
      ),
    );
  }
}
