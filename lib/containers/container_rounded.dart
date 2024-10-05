import 'package:flutter/material.dart';
import 'package:searchbar/common/colors.dart';
import 'package:searchbar/common/sizes.dart';

class TRoundedContainer extends StatelessWidget {
  const TRoundedContainer(
      {Key? key,
      this.child,
      this.width,
      this.height,
      this.margin,
      this.padding,
      this.showBorder = false,
      this.radius = MySizes.cardRadiusLg,
      this.backgroundColor = Colors.white,
      this.borderColor = mainText})
      : super(key: key);

  final double? width, height;
  final double radius;
  final Widget? child;
  final bool showBorder;
  final Color borderColor, backgroundColor;
  final EdgeInsetsGeometry? margin, padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: showBorder ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }
}
