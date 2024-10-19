import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:searchbar/models/product_model.dart';
import 'package:searchbar/network_manager/dio_helper.dart';
import 'package:searchbar/pages/bloc/product/product_bloc.dart';
import 'package:searchbar/pages/bloc/product/product_event.dart';
import 'package:searchbar/pages/bloc/product/product_state.dart';
import 'package:searchbar/widgets/widget_popular_categories.dart';

Widget productWidget() {
  return BlocProvider(
    create: (context) => ProductBloc(
      RemoteDataSource(),
    )..add(LoadProductEvent()),
    child: BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ProductError) {
          return Center(
            child: Text('Error: ${state.error}'),
          );
        }
        if (state is ProductLoaded) {
          List<ProductModel> productData = state.product;
          return SizedBox(
            height: 80,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: productData.length,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemBuilder: (_, int index) {
                return WidgetPopularCategories(
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
