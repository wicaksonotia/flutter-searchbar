import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:searchbar/network_manager/dio_helper.dart';
import 'package:searchbar/pages/bloc/product/product_event.dart';
import 'package:searchbar/pages/bloc/product/product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final RemoteDataSource _remoteDataSource;

  ProductBloc(this._remoteDataSource) : super(ProductLoading()) {
    on<LoadProductEvent>((event, emit) async {
      emit(ProductLoading());
      try {
        final result = await _remoteDataSource.getProduct();
        emit(ProductLoaded(result!));
      } catch (e) {
        emit(ProductError(e.toString()));
      }
    });
  }
}
