import 'package:flutter/material.dart';
import 'package:searchbar/common/circular_icon.dart';
import 'package:searchbar/common/colors.dart';
import 'package:searchbar/common/product_title.dart';
import 'package:searchbar/common/rounded.dart';
import 'package:searchbar/common/sizes.dart';
import 'package:searchbar/containers/container_rounded.dart';

class CProduct extends StatelessWidget {
  const CProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(children: [
        GridView.builder(
          itemCount: 100,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.1,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            mainAxisExtent: 200,
          ),
          itemBuilder: (_, index) {
            return TRoundedContainer(
              child: Column(
                children: [
                  Stack(
                    children: [
                      // THUMBNAIL PRODUCT
                      const TRoundedImage(
                        imageUrl: 'assets/images/ayam.png',
                        applyImageRadius: false,
                      ),

                      // SALE TAG
                      Positioned(
                        top: 12,
                        child: TRoundedContainer(
                          radius: MySizes.sm,
                          backgroundColor: Colors.red.shade100.withOpacity(0.8),
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
                        right: 0,
                        child: const CircularIcon(
                            icon: Icons.heart_broken, color: Colors.red),
                      ),
                    ],
                  ),
                  MySizes.sizedBox10,
                  Padding(
                    padding: const EdgeInsets.only(left: MySizes.sm),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TProductTitle(
                          title:
                              'Mallvose - Celana Pria Chino Premium Panjang 100cm Black Slimfit',
                          smallSize: true,
                        ),
                        Row(
                          children: [
                            Text(
                              'Celana',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            const Icon(
                              Icons.verified,
                              color: primary,
                              size: MySizes.iconXs,
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
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
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                  color: Colors.black87,
                                  borderRadius: BorderRadius.only(
                                    topLeft:
                                        Radius.circular(MySizes.cardRadiusMd),
                                    bottomRight:
                                        Radius.circular(MySizes.cardRadiusMd),
                                  )),
                              child: const SizedBox(
                                width: MySizes.iconLg * 1.2,
                                height: MySizes.iconLg * 1.2,
                                child: Center(
                                    child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                )),
                              ),
                            ),
                          ],
                        ),
                      ],
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
