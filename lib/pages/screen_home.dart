import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:searchbar/containers/container_appbar.dart';
import 'package:searchbar/containers/container_tab_bar.dart';
import 'package:searchbar/pages/bloc/product/product_bloc.dart';
import 'package:searchbar/network_manager/dio_helper.dart';
import 'package:searchbar/pages/bloc/product_popular/productpopular_bloc.dart';
import 'package:searchbar/pages/bloc/slider_promo/slider_promo_bloc.dart';
import 'package:searchbar/widgets/widget_header_seeall.dart';
import 'package:searchbar/widgets/widget_slider.dart';
import 'package:searchbar/widgets/widget_product_popular.dart';

class HHomeScreen extends StatefulWidget {
  const HHomeScreen({super.key});

  @override
  State<HHomeScreen> createState() => _HHomeScreenState();
}

class _HHomeScreenState extends State<HHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SliderPromoBloc>(
          create: (context) => SliderPromoBloc(
            RemoteDataSource(),
          ),
        ),
        BlocProvider<ProductPopularBloc>(
          create: (context) => ProductPopularBloc(
            RemoteDataSource(),
          ),
        ),
        BlocProvider<ProductBloc>(
          create: (context) => ProductBloc(
            RemoteDataSource(),
          ),
        )
      ],
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.only(top: 40, right: 10, left: 10),
          children: [
            AppBarContainer(),
            Gap(10),
            sliderWidget(),
            Gap(10),
            HeaderSeeAllWidget(
              header: "Special for you",
            ),
            Gap(10),
            productPopularWidget(),
            Gap(20),
            HeaderSeeAllWidget(
              header: "Categories",
            ),
            TabBarContainer(),
          ],
        ),
      ),
    );
  }
}
