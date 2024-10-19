import 'dart:convert';
import 'dart:typed_data';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:searchbar/common/colors.dart';
import 'package:searchbar/common/product_title.dart';
import 'package:searchbar/common/sizes.dart';
import 'package:searchbar/containers/container_rounded.dart';
import 'package:searchbar/models/carousel_model.dart';
import 'package:searchbar/network_manager/dio_helper.dart';
import 'package:searchbar/pages/bloc/slider_promo/slider_promo_bloc.dart';
import 'package:searchbar/pages/bloc/slider_promo/slider_promo_event.dart';
import 'package:searchbar/pages/bloc/slider_promo/slider_promo_state.dart';

Widget sliderWidget() {
  return BlocProvider(
    create: (context) => SliderPromoBloc(
      RemoteDataSource(),
    )..add(LoadSliderPromoEvent()),
    child: BlocBuilder<SliderPromoBloc, SliderPromoState>(
      builder: (context, state) {
        if (state is SliderPromoLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is SliderPromoError) {
          return Center(
            child: Text('Error: ${state.error}'),
          );
        }
        if (state is SliderPromoLoaded) {
          List<CarouselModel> sliderImage = state.sliderPromo;
          return Container(
            margin: EdgeInsets.only(top: 5),
            child: CarouselSlider(
              options: CarouselOptions(
                height: 220,
                autoPlay: true,
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
                autoPlayInterval: Duration(seconds: 5),
                autoPlayAnimationDuration: Duration(milliseconds: 2800),
              ),
              items: sliderImage.map((dataSliderImage) {
                Uint8List decodePhoto;
                decodePhoto =
                    Base64Decoder().convert('${dataSliderImage.photo}');
                return Builder(
                  builder: (BuildContext context) {
                    return Stack(children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: MemoryImage(decodePhoto),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: RoundedContainer(
                          backgroundColor: Colors.white,
                          height: 100,
                          margin: EdgeInsets.symmetric(horizontal: 40),
                          radius: 20,
                          shadow: true,
                          // padding: EdgeInsets.all(10),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TProductTitle(
                                  title:
                                      'Mallvose - Celana Pria Chino Premium Panjang 100cm Black Slimfit',
                                  maxLines: 1,
                                ),
                                Gap(5),
                                Row(
                                  children: [
                                    RoundedContainer(
                                      backgroundColor: Colors.yellow.shade200,
                                      padding: EdgeInsets.all(2),
                                      radius: 5,
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow.shade800,
                                            size: MySizes.iconXs,
                                          ),
                                          Text(
                                            '4.9 ',
                                            style: TextStyle(
                                              fontSize: MySizes.fonztSizeXsm,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    MySizes.sizedBoxW5,
                                    Text('|'),
                                    MySizes.sizedBoxW5,
                                    Text(
                                      '4,7RB terjual',
                                      style: TextStyle(
                                          fontSize: MySizes.fonztSizeXsm),
                                    )
                                  ],
                                ),
                                Gap(5),
                                Text(
                                  'is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s',
                                  style: TextStyle(
                                      color: MyColors.text,
                                      fontSize: MySizes.fonztSizeSm),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]);
                  },
                );
              }).toList(),
            ),
          );
        }
        return Container();
      },
    ),
  );
}
