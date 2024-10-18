import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:searchbar/models/carousel_model.dart';

@immutable
sealed class SliderPromoState extends Equatable {}

class SliderPromoLoading extends SliderPromoState {
  @override
  List<Object?> get props => [];
}

class SliderPromoLoaded extends SliderPromoState {
  final List<CarouselModel> sliderPromo;
  SliderPromoLoaded(this.sliderPromo);
  // SliderPromoLoaded(this.sliderPromo, from);

  @override
  List<Object?> get props => [sliderPromo];
}

class SliderPromoError extends SliderPromoState {
  final String error;
  SliderPromoError(this.error);

  @override
  List<Object?> get props => [error];
}
