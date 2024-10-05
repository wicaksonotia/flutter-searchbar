import 'package:flutter/material.dart';
import 'package:searchbar/common/sizes.dart';

class TProductTitle extends StatelessWidget {
  const TProductTitle({
    Key? key,
    required this.title,
    this.smallSize = false,
    this.maxLines = 2,
    this.textAlign = TextAlign.left,
  }) : super(key: key);

  final String title;
  final bool smallSize;
  final int maxLines;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: TextStyle(
          fontSize: smallSize ? MySizes.fonztSizeSm : MySizes.fonztSizeSm,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: maxLines,
        textAlign: textAlign);
  }
}
