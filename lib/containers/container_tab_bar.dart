import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:searchbar/common/colors.dart';
import 'package:searchbar/widgets/widget_product.dart';

class TabBarContainer extends StatefulWidget {
  const TabBarContainer({super.key});

  @override
  State<TabBarContainer> createState() => _TabBarContainerState();
}

class _TabBarContainerState extends State<TabBarContainer>
    with TickerProviderStateMixin {
  List<String> tabBarItems = [
    "Home",
    "Explore",
    "Search",
  ];
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(
      // initialIndex: 0,
      length: 3,
      vsync: this,
    );
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: TabBar(
            controller: tabController,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            // indicator:
            //     CircleTabIndicators(color: MyColors.main, radius: 5),
            indicator: BubbleTabIndicator(
              indicatorColor: MyColors.main,
              indicatorRadius: 5,
              padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
            ),
            isScrollable: true,
            labelPadding: EdgeInsets.only(left: 20, right: 20),
            tabAlignment: TabAlignment.start,
            dividerColor: Colors.transparent,
            tabs: tabBarItems.map((label) => Tab(text: label)).toList(),
          ),
        ),
        Gap(10),
        Container(
          constraints: const BoxConstraints(
            maxHeight: 300,
          ),
          child: TabBarView(
            controller: tabController,
            children: [
              productWidget(),
              Text("Inspirations"),
              Text("Emotions"),
            ],
          ),
        ),
      ],
    );
  }
}
