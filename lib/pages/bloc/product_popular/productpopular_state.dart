import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:searchbar/models/product_popular_model.dart';

@immutable
sealed class ProductPopularState extends Equatable {}

class ProductPopularLoading extends ProductPopularState {
  @override
  List<Object?> get props => [];
}

class ProductPopularLoaded extends ProductPopularState {
  final List<ProductPopularModel> product;
  ProductPopularLoaded(this.product);

  @override
  List<Object?> get props => [product];
}

class ProductPopularError extends ProductPopularState {
  final String error;
  ProductPopularError(this.error);

  @override
  List<Object?> get props => [error];
}
