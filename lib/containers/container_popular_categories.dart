import 'package:flutter/material.dart';
import 'package:searchbar/common/colors.dart';
import 'package:searchbar/common/sizes.dart';
import 'package:searchbar/features/shop/widgets/widget_categories.dart';

class PopularCategoriesContainer extends StatelessWidget {
  const PopularCategoriesContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Special for you",
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
        ),
        MySizes.sizedBox10,
        SizedBox(
          height: 80,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemBuilder: (_, int index) {
              return WidgetCategories();
            },
          ),
        ),
      ],
    );
  }
}
