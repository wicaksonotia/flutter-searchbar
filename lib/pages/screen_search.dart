import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:searchbar/common/background.dart';
import 'package:searchbar/containers/container_appbar.dart';
import 'package:searchbar/containers/container_search.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: BackgroundPainter(),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  const AppBarContainer(),
                  Gap(20),
                  SearchBarContainer(),
                  // const PopularCategoriesContainer(),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.only(bottom: 220),
                  // child: ProductContainer(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
