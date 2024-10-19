import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:searchbar/models/product_model.dart';

@immutable
sealed class ProductState extends Equatable {}

class ProductLoading extends ProductState {
  @override
  List<Object?> get props => [];
}

class ProductLoaded extends ProductState {
  final List<ProductModel> product;
  ProductLoaded(this.product);

  @override
  List<Object?> get props => [product];
}

class ProductError extends ProductState {
  final String error;
  ProductError(this.error);

  @override
  List<Object?> get props => [error];
}
