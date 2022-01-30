import 'package:freezed_annotation/freezed_annotation.dart';

part 'property.freezed.dart';

part 'property.g.dart';

@freezed
class Property with _$Property {
  const Property._();

  const factory Property(
    @JsonKey(name: 'Adres') String? address,
    @JsonKey(name: 'HoofdFoto') String? photo,
    @JsonKey(name: 'AantalBadkamers') int? numOfBathRms,
    @JsonKey(name: 'AantalSlaapkamers') int? numOfBedRms,
    @JsonKey(name: 'Makelaar') String? agentName,
    @JsonKey(name: 'MakelaarTelefoon') String? agentPhone,
    @JsonKey(name: 'ObjectType') String? propertyType,
    @JsonKey(name: 'WGS84_X') double? lat,
    @JsonKey(name: 'WGS84_Y') double? lng,
    @JsonKey(name: 'WoonOppervlakte') double? area,
    @JsonKey(name: 'KoopPrijs') double? price,
  ) = _Property;

  factory Property.fromJson(Map<String, dynamic> json) =>
      _$PropertyFromJson(json);
}
