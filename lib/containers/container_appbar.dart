import 'package:flutter/material.dart';
import 'package:searchbar/common/colors.dart';
import 'package:searchbar/common/sizes.dart';
import 'package:searchbar/containers/container_rounded.dart';

class AppBarContainer extends StatelessWidget {
  const AppBarContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Text(
                    "Hello,",
                    style: TextStyle(
                        fontSize: MySizes.fonztSizeXl, color: MyColors.main),
                  ),
                  Text(
                    "Customer",
                    style: TextStyle(
                        fontSize: MySizes.fonztSizeXl,
                        fontWeight: FontWeight.w900,
                        color: MyColors.main),
                  ),
                ],
              ),
              Text(
                "Have a nice day!",
                style: TextStyle(
                    color: Colors.black87.withOpacity(0.3),
                    // color: mainText,
                    fontSize: MySizes.fonztSizeMd),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Row(
              children: const [
                RoundedContainer(
                  padding: EdgeInsets.all(5),
                  radius: 5,
                  backgroundColor: MyColors.main,
                  child: Icon(
                    Icons.search_rounded,
                    size: MySizes.iconMd,
                    color: Colors.white,
                  ),
                ),
                MySizes.sizedBoxW5,
                RoundedContainer(
                  padding: EdgeInsets.all(5),
                  radius: 5,
                  backgroundColor: MyColors.main,
                  child: Badge(
                    label: Text("10+"),
                    child: Icon(
                      Icons.shopping_cart_outlined,
                      size: MySizes.iconMd,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
