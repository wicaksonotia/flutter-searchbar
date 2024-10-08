import 'package:flutter/material.dart';
import 'package:searchbar/common/sizes.dart';

class AppBarContainer extends StatelessWidget {
  const AppBarContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Icon(
          //   Icons.dashboard,
          //   size: MySizes.iconMd,
          //   color: Colors.white,
          // ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Text(
                    "Hello,",
                    style: TextStyle(
                      fontSize: MySizes.fonztSizeXl,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Customer",
                    style: TextStyle(
                      fontSize: MySizes.fonztSizeXl,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Text(
                "Have a nice day!",
                style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    // color: mainText,
                    fontSize: MySizes.fonztSizeMd),
              ),
            ],
          ),
          Row(
            children: const [
              Icon(
                Icons.shopping_cart,
                size: MySizes.iconMd,
                color: Colors.white,
              ),
              Icon(
                Icons.notifications,
                size: MySizes.iconMd,
                color: Colors.white,
              )
            ],
          )
        ],
      ),
    );
  }
}
