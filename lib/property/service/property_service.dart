import 'dart:async';
import 'dart:convert';

import 'package:funda_assignment/common/env.dart';
import 'package:funda_assignment/common/failure/netowrk_failure/network_failure.dart';
import 'package:funda_assignment/common/service/base_service.dart';
import 'package:funda_assignment/property/model/property.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

abstract class PropertyService implements BaseService {
  Future<Property> getPropertyById(String propertyId);
}

@Injectable(as: PropertyService)
class PropertyServiceImpl implements PropertyService {
  final Client client;
  static const String _propertyUrl = apiUrl;

  PropertyServiceImpl(this.client);

  @override
  Future<Property> getPropertyById(String propertyId) async {
    final response = await client.get(Uri.parse('$_propertyUrl/$propertyId'));
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return Property.fromJson(jsonResponse);
    }
    throw NetworkFailure.serverException(message: response.body);
  }

  @override
  FutureOr onDispose() {}
}
