import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:searchbar/common/sizes.dart';

class TRoundedImage extends StatelessWidget {
  const TRoundedImage(
      {super.key,
      this.border,
      this.padding,
      this.onPressed,
      this.width,
      this.height,
      this.applyImageRadius = true,
      required this.photo,
      this.fit = BoxFit.contain,
      this.backgroundColor = Colors.black,
      this.borderRadius = MySizes.md});

  final double? width, height;
  final Uint8List photo;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        child: ClipRRect(
          borderRadius: applyImageRadius
              ? BorderRadius.only(
                  topLeft: Radius.circular(borderRadius),
                  topRight: Radius.circular(borderRadius))
              : BorderRadius.zero,
          child: Image(
            image: MemoryImage(photo),
          ),
        ),
      ),
    );
  }
}
