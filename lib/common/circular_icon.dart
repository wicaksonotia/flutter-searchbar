import 'package:flutter/material.dart';
import 'package:searchbar/common/sizes.dart';

class CircularIcon extends StatelessWidget {
  const CircularIcon({
    Key? key,
    required this.icon,
    this.width,
    this.height,
    this.size = MySizes.lg,
    this.onPressed,
    this.color,
    this.backgroundColor,
  }) : super(key: key);

  final double? width, height, size;
  final IconData icon;
  final Color? color, backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(MySizes.sm),
        color: backgroundColor != null
            ? backgroundColor!
            : Colors.white.withOpacity(0),
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
