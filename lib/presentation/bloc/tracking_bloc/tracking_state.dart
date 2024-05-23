part of 'tracking_bloc.dart';

abstract class TrackingState {}

final class TrackingInitial extends TrackingState {}

final class TrackingLoading extends TrackingState {}

final class TrackingLoaded extends TrackingState {
  final TrackingResponseModel trackingResponse;
  TrackingLoaded({
    required this.trackingResponse,
  });
}

final class TrackingError extends TrackingState {
  final String message;
  TrackingError({
    required this.message,
  });
}

final class TrackingSearchLoading extends TrackingState {}

final class TrackingSearchLoaded extends TrackingState {
  final List<Data> listTracking;
  TrackingSearchLoaded({
    required this.listTracking,
  });
}

final class TrackingSearchError extends TrackingState {
  final String message;
  TrackingSearchError({
    required this.message,
  });
}
