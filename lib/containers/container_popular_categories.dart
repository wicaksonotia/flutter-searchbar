import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:searchbar/widgets/widget_popular_categories.dart';
import 'package:searchbar/widgets/widget_header_seeall.dart';

class PopularCategoriesContainer extends StatelessWidget {
  const PopularCategoriesContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeaderSeeAllWidget(
          header: "Special for you",
        ),
        Gap(10),
        SizedBox(
          height: 80,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemBuilder: (_, int index) {
              return WidgetPopularCategories();
            },
          ),
        ),
      ],
    );
  }
}
