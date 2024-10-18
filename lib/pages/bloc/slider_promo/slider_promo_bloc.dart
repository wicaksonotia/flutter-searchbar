import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:searchbar/models/slider_model.dart';
import 'package:searchbar/network_manager/dio_helper.dart';
import 'package:searchbar/pages/bloc/slider_promo/slider_promo_event.dart';
import 'package:searchbar/pages/bloc/slider_promo/slider_promo_state.dart';

class SliderPromoBloc extends Bloc<SliderPromoEvent, SliderPromoState> {
  final RemoteDataSource _remoteDataSource;

  SliderPromoBloc(this._remoteDataSource) : super(SliderPromoLoading()) {
    on<LoadSliderPromoEvent>((event, emit) async {
      emit(SliderPromoLoading());
      try {
        final result = await _remoteDataSource.getSliderPromo();
        emit(SliderPromoLoaded(result!));
      } catch (e) {
        emit(SliderPromoError(e.toString()));
      }
    });
  }
}
