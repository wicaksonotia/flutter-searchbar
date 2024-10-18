import 'package:flutter/material.dart';
import 'package:searchbar/common/sizes.dart';

class RoundedContainer extends StatelessWidget {
  const RoundedContainer(
      {super.key,
      this.child,
      this.width,
      this.height,
      this.margin,
      this.padding,
      this.shadow = false,
      this.showBorder = false,
      this.radius = MySizes.cardRadiusLg,
      this.backgroundColor = Colors.transparent,
      this.borderColor = Colors.black});

  final double? width, height;
  final double radius;
  final Widget? child;
  final bool showBorder, shadow;
  final Color? backgroundColor;
  final Color borderColor;
  final EdgeInsetsGeometry? margin, padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        boxShadow: [
          shadow
              ? BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 0,
                  blurRadius: 7,
                  // offset: Offset(0, 3), // changes position of shadow
                )
              : BoxShadow()
        ],
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: showBorder ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }
}
