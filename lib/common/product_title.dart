import 'package:flutter/material.dart';
import 'package:searchbar/common/colors.dart';
import 'package:searchbar/common/sizes.dart';

class TProductTitle extends StatelessWidget {
  const TProductTitle({
    super.key,
    required this.title,
    this.smallSize = false,
    this.maxLines = 2,
    this.textAlign = TextAlign.left,
  });

  final String title;
  final bool smallSize;
  final int maxLines;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: TextStyle(
          fontSize: smallSize ? MySizes.fonztSizeSm : MySizes.fonztSizeMd,
          color: MyColors.main,
          fontWeight: FontWeight.w600,
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: maxLines,
        textAlign: textAlign);
  }
}
