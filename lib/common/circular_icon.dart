import 'package:flutter/material.dart';
import 'package:searchbar/common/sizes.dart';

class CircularIcon extends StatelessWidget {
  const CircularIcon(
      {super.key,
      required this.icon,
      this.width,
      this.height,
      this.size = MySizes.lg,
      this.onPressed,
      this.color,
      this.radius,
      this.showBorder = false,
      this.backgroundColor,
      this.borderColor = Colors.black});

  final double? width, height, size, radius;
  final IconData icon;
  final Color? color, backgroundColor;
  final Color borderColor;
  final bool showBorder;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 0),
        border: showBorder ? Border.all(color: borderColor) : null,
        color: backgroundColor,
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: color,
          size: size,
        ),
      ),
    );
  }
}
