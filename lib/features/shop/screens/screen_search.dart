import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:searchbar/common/background.dart';
import 'package:searchbar/common/colors.dart';
import 'package:searchbar/common/sizes.dart';
import 'package:searchbar/containers/container_appbar.dart';
import 'package:searchbar/containers/container_product.dart';
import 'package:searchbar/containers/container_search.dart';

class ScreenSearch extends StatefulWidget {
  const ScreenSearch({Key? key}) : super(key: key);

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(initialIndex: 0, length: 8, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
                  MySizes.sizedBox20,
                  SearchBarContainer(),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: ButtonsTabBar(
                      physics: ClampingScrollPhysics(),
                      controller: _tabController,
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      backgroundColor: mainText,
                      unselectedBackgroundColor: Colors.white,
                      borderWidth: .5,
                      radius: 10,
                      borderColor: mainText,
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      unselectedLabelStyle: TextStyle(
                        color: mainText,
                      ),
                      height: 40,
                      center: false,
                      tabs: [
                        Tab(
                          // icon: Icon(Icons.broken_image),
                          text: "Terkait",
                        ),
                        Tab(text: "Sayur"),
                        Tab(text: "Buah"),
                        Tab(text: "Gerabah"),
                        Tab(text: "Terkait"),
                        Tab(text: "Terkait"),
                        Tab(text: "Terkait"),
                        Tab(text: "Terkait"),
                      ],
                    ),
                  ),
                  // const PopularCategoriesContainer(),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: TabBarView(
                controller: _tabController,
                children: [
                  Text("Terkait"),
                  SizedBox(
                    child: SingleChildScrollView(
                      child: CProduct(),
                    ),
                  ),
                  Text("Terlaris"),
                  Text("Terlaris"),
                  Text("Terlaris"),
                  Text("Terlaris"),
                  Text("Terlaris"),
                  Text("Terlaris"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
