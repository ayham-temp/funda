import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:funda_assignment/common/failure/netowrk_failure/network_failure.dart';
import 'package:funda_assignment/property/model/property.dart';
import 'package:funda_assignment/property/repository/remote_property_repository.dart';

part 'property_state.dart';
part 'property_cubit.freezed.dart';

class PropertyCubit extends Cubit<PropertyState> {
  final PropertyRepository _propertyRepository;

  PropertyCubit(this._propertyRepository) : super(const PropertyState.loading());

  loadProperty(String propertyId) async {
    try {
      final property = await _propertyRepository.getPropertyById(propertyId);
      emit(PropertyState.ready(property));
    } on ServerException catch(e) {
      emit(PropertyState.error(message: e.message));
    }
  }
}
