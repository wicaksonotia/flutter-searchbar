import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
// import 'package:searchbar/common/circular_icon.dart';
import 'package:searchbar/common/colors.dart';
import 'package:searchbar/common/product_title.dart';
import 'package:searchbar/common/rounded.dart';
import 'package:searchbar/common/sizes.dart';
import 'package:searchbar/containers/container_rounded.dart';

class ProductContainer extends StatelessWidget {
  const ProductContainer(
      {super.key,
      required this.dataProductName,
      required this.dataPhoto,
      required this.dataDescription,
      required this.dataPrice,
      this.dataPromo = false});

  final String dataProductName, dataPhoto, dataDescription, dataPrice;
  final bool dataPromo;
  @override
  Widget build(BuildContext context) {
    Uint8List decodePhoto;
    decodePhoto = Base64Decoder().convert(dataPhoto);
    return RoundedContainer(
      shadow: true,
      backgroundColor: Colors.white,
      height: 240,
      child: Stack(
        children: [
          Column(
            children: [
              // THUMBNAIL PRODUCT
              TRoundedImage(
                photo: decodePhoto,
                applyImageRadius: true,
                borderRadius: MySizes.cardRadiusLg,
              ),
              Gap(10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TProductTitle(
                  title: dataProductName,
                ),
              ),
              Gap(10),
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
                              style: Theme.of(context).textTheme.labelSmall),
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
                      dataPrice,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.normal,
                        color: Colors.red,
                      ),
                    ),
                  ],
                )),
              ),
            ],
          ),

          // BUTTON ADD PRODUCT
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

          // SALE TAG
          if (dataPromo)
            Positioned(
              child: RoundedContainer(
                radius: MySizes.sm,
                backgroundColor: MyColors.main,
                padding: const EdgeInsets.all(3),
                child: Text('PROMO %',
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .apply(color: Colors.white)),
              ),
            ),

          // LOVE TAG
          // Positioned(
          //   top: 0,
          //   right: -5,
          //   child: const CircularIcon(icon: Icons.favorite, color: Colors.red),
          // ),
        ],
      ),
    );
  }
}
