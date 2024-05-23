import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wifipos_web/data/datasources/tracking_remote_datasource.dart';
import 'package:wifipos_web/data/models/tracking_response_model.dart';

part 'tracking_event.dart';
part 'tracking_state.dart';

class TrackingBloc extends Bloc<TrackingEvent, TrackingState> {
  TrackingBloc() : super(TrackingInitial()) {
    on<GetTracking>((event, emit) async {
      emit(TrackingLoading());
      final result = await TrackingRemoteDatasource().getTracking();
      result.fold(
        (error) => emit(TrackingError(message: error)),
        (success) => emit(TrackingLoaded(trackingResponse: success)),
      );
    });

    on<SearchTracking>((event, emit) async {
      emit(TrackingSearchLoading());
      final result = await TrackingRemoteDatasource().getTracking();
      result.fold(
        (error) => emit(TrackingSearchError(message: error)),
        (success) {
          final searchResult = success.data.where((tracking) =>
              tracking.username
                  .toLowerCase()
                  .contains(event.query.toLowerCase()) ||
              tracking.lokasi.toLowerCase().contains(event.query.toLowerCase()));
          emit(TrackingSearchLoaded(listTracking: searchResult.toList()));
        },
      );
    });
  }
}
