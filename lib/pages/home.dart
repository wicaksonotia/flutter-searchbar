import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
// import 'package:searchbar/common/colors.dart';
import 'package:searchbar/containers/container_appbar.dart';
import 'package:searchbar/containers/container_popular_categories.dart';
import 'package:searchbar/containers/container_tab_bar.dart';
import 'package:searchbar/pages/bloc/product/product_bloc.dart';
import 'package:searchbar/widgets/widget_slider.dart';
import 'package:searchbar/network_manager/dio_helper.dart';
import 'package:searchbar/pages/bloc/slider_promo/slider_promo_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SliderPromoBloc>(
          create: (context) => SliderPromoBloc(
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
        body: Padding(
          padding: const EdgeInsets.only(top: 40, right: 10, left: 10),
          child: Column(
            children: [
              AppBarContainer(),
              Gap(10),
              sliderWidget(),
              Gap(10),
              PopularCategoriesContainer(),
              Gap(20),
              TabBarContainer(),
            ],
          ),
        ),
      ),
    );
  }
}
