import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:searchbar/models/product_model.dart';
import 'package:searchbar/network_manager/dio_helper.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final RemoteDataSource remoteDataSource;
  ProductBloc({required this.remoteDataSource}) : super(ProductInitial()) {
    on<LoadProducts>((event, emit) async {
      emit(ProductLoading());
      try {
        // final result = await remoteDataSource.getProducts();
        // emit(ProductLoaded(result.data!.cast<Products>()));
      } catch (e) {
        emit(ProductError(e.toString()));
      }
    });
  }
}
