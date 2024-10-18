import 'package:equatable/equatable.dart';

abstract class SliderPromoEvent extends Equatable {
  const SliderPromoEvent();
}

class LoadSliderPromoEvent extends SliderPromoEvent {
  @override
  List<Object?> get props => [];
}
