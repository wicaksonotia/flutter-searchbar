import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:searchbar/common/sizes.dart';
import 'package:searchbar/containers/container_rounded.dart';

class WidgetPopularCategories extends StatelessWidget {
  const WidgetPopularCategories(
      {super.key,
      this.onTap,
      required this.dataProductName,
      required this.dataPhoto,
      required this.dataDescription});

  final String dataProductName, dataPhoto, dataDescription;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    Uint8List decodePhoto;
    decodePhoto = Base64Decoder().convert(dataPhoto);
    return GestureDetector(
      onTap: onTap,
      child: RoundedContainer(
        margin: EdgeInsets.only(right: 10),
        padding: EdgeInsets.all(5),
        width: 200,
        height: 80,
        radius: 10,
        backgroundColor: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(right: 5),
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.red,
                image: DecorationImage(
                  image: MemoryImage(decodePhoto),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(5),
                  Text(
                    dataDescription,
                    style: TextStyle(
                        fontSize: MySizes.fonztSizeSm,
                        color: Colors.black26.withOpacity(.3)),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    dataProductName,
                    maxLines: 1,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
