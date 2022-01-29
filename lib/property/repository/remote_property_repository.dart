import 'dart:async';

import 'package:funda_assignment/common/data/base_repository.dart';
import 'package:funda_assignment/property/model/property.dart';
import 'package:funda_assignment/property/service/property_service.dart';

abstract class PropertyRepository implements BaseRepository {
  Future<Property> getPropertyById(String propertyId);
}

class RemotePropertyRepository implements PropertyRepository {
  final PropertyService _propertyService;
  RemotePropertyRepository(this._propertyService);

  @override
  Future<Property> getPropertyById(String propertyId) async {
    try{
      return await _propertyService.getPropertyById(propertyId);
    } catch(e) {
      rethrow;
    }
  }
}