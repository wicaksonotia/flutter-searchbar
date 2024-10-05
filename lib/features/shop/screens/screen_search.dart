import 'package:flutter/material.dart';
import 'package:searchbar/common/colors.dart';
import 'package:searchbar/common/sizes.dart';
import 'package:searchbar/containers/container_appbar.dart';
import 'package:searchbar/containers/container_categories.dart';
import 'package:searchbar/containers/container_product.dart';
// import 'package:searchbar/containers/container_product_vertical.dart';
import 'package:searchbar/containers/container_search.dart';

class ScreenSearch extends StatefulWidget {
  const ScreenSearch({Key? key}) : super(key: key);

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding:
                const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 10),
            decoration: const BoxDecoration(
                color: mainText,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TAppBar(),
                MySizes.sizedBox10,
                SearchBarContainer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Popular Categories",
                      style: TextStyle(
                        fontSize: MySizes.fonztSizeMd,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                        wordSpacing: 2,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                MySizes.sizedBox10,
                // Popular Categories
                SizedBox(
                  height: 80,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 7,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, int index) {
                      return const TVerticalImageText(
                        title: 'Chacha-tata',
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 500,
            child: SingleChildScrollView(
              child: CProduct(),
            ),
          ),
        ],
      ),
    );
  }
}
