import 'package:flutter/material.dart';
import 'package:searchbar/common/sizes.dart';
import 'package:searchbar/features/shop/widgets/widget_categories.dart';

class PopularCategoriesContainer extends StatelessWidget {
  const PopularCategoriesContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Popular Categories",
          style: TextStyle(
            fontSize: MySizes.fonztSizeMd,
            fontWeight: FontWeight.w600,
            letterSpacing: 1,
            wordSpacing: 2,
            color: Colors.white,
          ),
        ),
        MySizes.sizedBox10,
        SizedBox(
          height: 80,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 7,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, int index) {
              return const WidgetCategories(
                title: 'Chacha-tata',
              );
            },
          ),
        ),
      ],
    );
  }
}
