import 'package:flutter/material.dart';
import 'package:searchbar/common/circular_icon.dart';
import 'package:searchbar/common/colors.dart';
import 'package:searchbar/common/product_title.dart';
import 'package:searchbar/common/rounded.dart';
import 'package:searchbar/common/sizes.dart';
import 'package:searchbar/containers/container_rounded.dart';

class ProductContainer extends StatelessWidget {
  const ProductContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(children: [
        GridView.builder(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          itemCount: 20,
          shrinkWrap: true,
          // physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.1,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            mainAxisExtent: 220,
          ),
          itemBuilder: (_, index) {
            return RoundedContainer(
              shadow: true,
              height: 220,
              child: Stack(
                children: [
                  Column(
                    children: [
                      // THUMBNAIL PRODUCT
                      Center(
                        child: const TRoundedImage(
                          imageUrl: 'assets/images/ayam.png',
                          applyImageRadius: false,
                        ),
                      ),
                      MySizes.sizedBox10,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: TProductTitle(
                          title:
                              'Mallvose - Celana Pria Chino Premium Panjang 100cm Black Slimfit',
                          smallSize: true,
                        ),
                      ),
                      MySizes.sizedBox10,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            RoundedContainer(
                              backgroundColor: Colors.yellow.shade100,
                              shadow: false,
                              showBorder: true,
                              borderColor: Colors.orange.shade100,
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              radius: 3,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.orange.shade800,
                                    size: MySizes.iconXs,
                                  ),
                                  MySizes.sizedBoxW5,
                                  Text('70%',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall),
                                ],
                              ),
                            ),
                            Spacer(),
                            const Icon(
                              Icons.verified,
                              color: MyColors.green,
                              size: MySizes.iconXs,
                            ),
                            Text(
                              '1rb+ terjual',
                              style: Theme.of(context).textTheme.labelSmall,
                            )
                          ],
                        ),
                      ),
                      MySizes.sizedBox10,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: (Row(
                          children: [
                            Text(
                              'Rp',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: MySizes.fonztSizeSm,
                                color: Colors.red,
                              ),
                            ),
                            Text(
                              '10.000',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: MySizes.fonztSizeXl,
                                fontWeight: FontWeight.w600,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        )),
                      ),
                    ],
                  ),
                  Positioned(
                    top: 12,
                    child: RoundedContainer(
                      radius: MySizes.sm,
                      backgroundColor: Colors.red.shade100,
                      padding: const EdgeInsets.symmetric(
                        horizontal: MySizes.sm,
                        vertical: MySizes.xs,
                      ),
                      child: Text('70%',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .apply(color: Colors.black)),
                    ),
                  ),

                  // LOVE TAG
                  Positioned(
                    top: 0,
                    right: -5,
                    child: const CircularIcon(
                        icon: Icons.favorite, color: Colors.red),
                  ),

                  Align(
                    alignment: Alignment.bottomRight,
                    child: Material(
                      color: Color(0xFFE57734),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(MySizes.cardRadiusMd),
                        bottomRight: Radius.circular(MySizes.cardRadiusMd),
                      ),
                      child: InkWell(
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        )
      ]),
    );
  }
}
