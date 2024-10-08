import 'package:flutter/material.dart';
import 'package:searchbar/common/circular_icon.dart';
import 'package:searchbar/common/colors.dart';
import 'package:searchbar/common/product_title.dart';
import 'package:searchbar/common/rounded.dart';
import 'package:searchbar/common/shadow.dart';
import 'package:searchbar/common/sizes.dart';
import 'package:searchbar/containers/container_rounded.dart';

class TProductVertical extends StatelessWidget {
  const TProductVertical({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
          width: 100,
          padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
              boxShadow: [MyShadow.verticalProductShadow],
              borderRadius: BorderRadius.circular(MySizes.productImageRadius),
              color: Colors.grey.shade200),
          child: Column(
            children: [
              RoundedContainer(
                height: 180,
                padding: const EdgeInsets.all(MySizes.sm),
                backgroundColor: Colors.grey.shade200,
                child: Stack(
                  children: [
                    // THUMBNAIL PRODUCT
                    const TRoundedImage(
                      imageUrl: 'assets/images/Food Picture.png',
                      applyImageRadius: true,
                    ),

                    // SALE TAG
                    Positioned(
                      top: 12,
                      child: RoundedContainer(
                        radius: MySizes.sm,
                        backgroundColor:
                            Colors.yellow.shade100.withOpacity(0.8),
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
                      right: 0,
                      child: const CircularIcon(
                          icon: Icons.heart_broken, color: Colors.red),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: MySizes.spaceBtwItems / 2,
              ),
              Padding(
                padding: const EdgeInsets.only(left: MySizes.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TProductTitle(
                      title: 'Makanan Indonesia',
                      smallSize: true,
                    ),
                    const SizedBox(
                      height: MySizes.spaceBtwItems / 2,
                    ),
                    Row(
                      children: [
                        Text(
                          'Lontong',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        const SizedBox(
                          width: MySizes.xs,
                        ),
                        const Icon(
                          Icons.verified,
                          color: primary,
                          size: MySizes.iconXs,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Rp.10.000,-',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        Container(
                          decoration: const BoxDecoration(
                              color: Colors.black87,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(MySizes.cardRadiusMd),
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
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
