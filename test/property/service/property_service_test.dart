import 'package:flutter_test/flutter_test.dart';
import 'package:funda_assignment/common/env.dart';
import 'package:funda_assignment/common/failure/netowrk_failure/network_failure.dart';
import 'package:funda_assignment/property/model/property.dart';
import 'package:funda_assignment/property/service/property_service.dart';
import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'property_service_test.mocks.dart';

@GenerateMocks([Client])
void main() {
  group('Property Service', () {
    late Client client;
    late PropertyService propertyService;

    setUp(() {
      client = MockClient();
      propertyService = PropertyServiceImpl(client);
    });
    test(
        'Should return a Property object when calling getPropertyById with status code 200',
        () async {
      when(client.get(Uri.parse('$apiUrl/1')))
          .thenAnswer((_) async => Response('{"AantalBadkamers":1}', 200));
      expect(await propertyService.getPropertyById('1'), isA<Property>());
    });

    test(
        'Should throw ServerException when calling getPropertyById with status code other than 200',
        () {
      when(client.get(Uri.parse('$apiUrl/1')))
          .thenAnswer((_) async => Response('error', 500));
      expect(propertyService.getPropertyById('1'), throwsException);
    });
  });
}
