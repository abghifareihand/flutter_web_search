part of 'tracking_bloc.dart';

abstract class TrackingEvent {}

class GetTracking extends TrackingEvent {}

class SearchTracking extends TrackingEvent {
  final String query;
  SearchTracking({
    required this.query,
  });
}

class ResetTracking extends TrackingEvent {}
