import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:searchbar/containers/container_appbar.dart';
import 'package:searchbar/containers/container_popular_categories.dart';
import 'package:searchbar/widgets/widget_slider.dart';
import 'package:searchbar/network_manager/dio_helper.dart';
import 'package:searchbar/pages/bloc/slider_promo/slider_promo_bloc.dart';

class HomeScreensssss extends StatelessWidget {
  const HomeScreensssss({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SliderPromoBloc>(
          create: (context) => SliderPromoBloc(
            RemoteDataSource(),
          ),
        )
      ],
      child: Scaffold(
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 40),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  AppBarContainer(),
                  Gap(10),
                  sliderWidget(),
                  Gap(10),
                  PopularCategoriesContainer(),
                  Gap(10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
