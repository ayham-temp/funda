part of 'property_cubit.dart';

@freezed
abstract class PropertyState with _$PropertyState {
  const factory PropertyState.loading() = PropertyStateLoading;
  const factory PropertyState.ready(Property property) = PropertyStateReady;
  const factory PropertyState.error({String? message}) = PropertyStateError;
}