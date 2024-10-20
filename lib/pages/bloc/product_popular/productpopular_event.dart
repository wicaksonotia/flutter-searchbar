import 'package:equatable/equatable.dart';

abstract class ProductPopularEvent extends Equatable {
  const ProductPopularEvent();
}

class LoadProductPopularEvent extends ProductPopularEvent {
  @override
  List<Object?> get props => [];
}
