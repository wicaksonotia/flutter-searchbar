import 'package:flutter/material.dart';
import 'package:searchbar/common/colors.dart';
import 'package:searchbar/common/sizes.dart';

class HeaderSeeAllWidget extends StatelessWidget {
  const HeaderSeeAllWidget({super.key, required this.header});
  final String header;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          header,
          style: TextStyle(
            fontSize: MySizes.fonztSizeLg,
            fontWeight: FontWeight.w900,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: MyColors.outline),
            color: Colors.white.withOpacity(.5),
          ),
          child: Text(
            "See More",
            style: TextStyle(
              fontSize: MySizes.fonztSizeSm,
              color: MyColors.main,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
