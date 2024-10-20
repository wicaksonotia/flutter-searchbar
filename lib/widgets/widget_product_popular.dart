import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:searchbar/models/product_popular_model.dart';
import 'package:searchbar/network_manager/dio_helper.dart';
import 'package:searchbar/pages/bloc/product_popular/productpopular_bloc.dart';
import 'package:searchbar/pages/bloc/product_popular/productpopular_event.dart';
import 'package:searchbar/pages/bloc/product_popular/productpopular_state.dart';
import 'package:searchbar/containers/container_product_popular.dart';

Widget productPopularWidget() {
  return BlocProvider(
    create: (context) => ProductPopularBloc(
      RemoteDataSource(),
    )..add(LoadProductPopularEvent()),
    child: BlocBuilder<ProductPopularBloc, ProductPopularState>(
      builder: (context, state) {
        if (state is ProductPopularLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ProductPopularError) {
          return Center(
            child: Text('Error: ${state.error}'),
          );
        }
        if (state is ProductPopularLoaded) {
          List<ProductPopularModel> productData = state.product;
          return SizedBox(
            height: 80,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: productData.length,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemBuilder: (_, int index) {
                return productPopularContainer(
                  dataProductName: productData[index].productName!,
                  dataPhoto: productData[index].photo1!,
                  dataDescription: productData[index].description!,
                );
              },
            ),
          );
        }
        return Container();
      },
    ),
  );
}
