import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:searchbar/common/colors.dart';
import 'package:searchbar/containers/container_search.dart';
// import 'package:searchbar/containers/container_tab_bar.dart';
import 'package:searchbar/pages/bloc/product/product_bloc.dart';
import 'package:searchbar/network_manager/dio_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  List<String> tabBarItems = [
    "Home",
    "Explore",
    "Search",
  ];

  TabController? tabController;
  int index = 0;
  String image =
      "https://images.pexels.com/photos/1283219/pexels-photo-1283219.jpeg?auto=compress&cs=tinysrgb&w=600";
  List<String> dataImages = [
    "https://images.pexels.com/photos/1283219/pexels-photo-1283219.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://umkm.averroes.or.id/assets/assets_artikel/d0bd99163261318d5675e320af42c52d.jpeg",
    "https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=600",
  ];

  void _tabListener() {
    setState(() {
      index = tabController!.index;
      image = dataImages[index];
    });
  }

  @override
  void initState() {
    tabController = TabController(
      // initialIndex: 0,
      length: 3,
      vsync: this,
    );
    tabController!.addListener(_tabListener);
    super.initState();
  }

  @override
  void dispose() {
    tabController!.removeListener(_tabListener);
    tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductBloc>(
          create: (context) => ProductBloc(
            RemoteDataSource(),
          ),
        )
      ],
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                title: SearchBarContainer(),
                backgroundColor: MyColors.main,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.parallax,
                  background: Image.network(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(40),
                  child: Container(
                    color: Colors.white,
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
                        padding: EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 20.0),
                      ),
                      isScrollable: true,
                      labelPadding: EdgeInsets.only(left: 20, right: 20),
                      tabAlignment: TabAlignment.start,
                      dividerColor: Colors.transparent,
                      tabs:
                          tabBarItems.map((label) => Tab(text: label)).toList(),
                    ),
                  ),
                ),
                // backgroundColor: Colors.white,
                pinned: true,
                expandedHeight: 200,
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 800,
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      // productWidget(),
                      Text("Home"),
                      Text("Inspirations"),
                      Text("Emotions"),
                    ],
                  ),
                ),
              )
              // SliverList(
              //   delegate: SliverChildBuilderDelegate(
              //       (context, index) => ListTile(
              //             title: Text('item $index'),
              //           ),
              //       childCount: 100),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
