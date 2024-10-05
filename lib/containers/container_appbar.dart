import 'package:flutter/material.dart';
import 'package:searchbar/common/sizes.dart';

class TAppBar extends StatelessWidget {
  const TAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
                    fontSize: MySizes.fonztSizeLg,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Customer",
                  style: TextStyle(
                    fontSize: MySizes.fonztSizeLg,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Text(
              "Have a nice day!",
              style: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: MySizes.fonztSizeXsm),
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
    );
  }
}
