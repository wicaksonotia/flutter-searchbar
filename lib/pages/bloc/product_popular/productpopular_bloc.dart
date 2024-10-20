import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:searchbar/network_manager/dio_helper.dart';
import 'package:searchbar/pages/bloc/product_popular/productpopular_event.dart';
import 'package:searchbar/pages/bloc/product_popular/productpopular_state.dart';

class ProductPopularBloc
    extends Bloc<ProductPopularEvent, ProductPopularState> {
  final RemoteDataSource _remoteDataSource;

  ProductPopularBloc(this._remoteDataSource) : super(ProductPopularLoading()) {
    on<LoadProductPopularEvent>((event, emit) async {
      emit(ProductPopularLoading());
      try {
        final result = await _remoteDataSource.getProductPopular();
        emit(ProductPopularLoaded(result!));
      } catch (e) {
        emit(ProductPopularError(e.toString()));
      }
    });
  }
}
