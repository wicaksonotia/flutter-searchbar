import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:searchbar/containers/container_product.dart';
import 'package:searchbar/models/product_model.dart';
import 'package:searchbar/network_manager/dio_helper.dart';
import 'package:searchbar/pages/bloc/product/product_bloc.dart';
import 'package:searchbar/pages/bloc/product/product_event.dart';
import 'package:searchbar/pages/bloc/product/product_state.dart';

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
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.only(bottom: 220),
              child: GridView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                itemCount: productData.length,
                shrinkWrap: true,
                // physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  mainAxisExtent: 240,
                ),
                itemBuilder: (_, index) {
                  return ProductContainer(
                    dataProductName: productData[index].productName!,
                    dataPhoto: productData[index].photo1!,
                    dataDescription: productData[index].description!,
                    dataPrice: productData[index].price!.toString(),
                    dataPromo: productData[index].promo,
                  );
                },
              ),
            ),
          );
        }
        return Container();
      },
    ),
  );
}
