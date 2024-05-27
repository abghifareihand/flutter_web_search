import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wifipos_web/data/datasources/auth_local_datasource.dart';
import 'package:wifipos_web/data/datasources/tracking_remote_datasource.dart';
import 'package:wifipos_web/data/models/tracking_response_model.dart';

part 'tracking_event.dart';
part 'tracking_state.dart';

class TrackingBloc extends Bloc<TrackingEvent, TrackingState> {
  TrackingBloc() : super(TrackingInitial()) {
    on<GetTracking>((event, emit) async {
      emit(TrackingLoading());
      final username = await AuthLocalDatasource().getUsername();
      final result = await TrackingRemoteDatasource().getTracking();
      result.fold(
        (error) => emit(TrackingError(message: error)),
        (success) {
          final filterUsername = success.data
              .where((tracking) => tracking.username == username)
              .toList();
          final tracking = TrackingResponseModel(
            data: filterUsername,
          );
          emit(TrackingLoaded(trackingResponse: tracking));
        },
      );
    });

    on<SearchTracking>((event, emit) async {
      emit(TrackingSearchLoading());
      final result = await TrackingRemoteDatasource().getTracking();
      result.fold(
        (error) => emit(TrackingSearchError(message: error)),
        (success) {
          final searchResult = success.data.where((tracking) =>
              tracking.username.toLowerCase() == event.query.toLowerCase());

          // Batasi jumlah hasil pencarian menjadi maksimal 5
          final limitedSearchResult = searchResult.take(5).toList();
          emit(TrackingSearchLoaded(listTracking: limitedSearchResult));
        },
      );
    });

    on<ResetTracking>((event, emit) {
      emit(TrackingInitial());
    });
  }
}
