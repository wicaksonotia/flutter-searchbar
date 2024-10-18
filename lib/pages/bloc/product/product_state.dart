part of 'product_bloc.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class ProductLoading extends ProductState {}

final class ProductLoaded extends ProductState {
  // final List<Products> products;
  // ProductLoaded(this.products);
}

final class ProductError extends ProductState {
  final String error;
  ProductError(this.error);
}
