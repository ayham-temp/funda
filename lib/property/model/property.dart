import 'package:freezed_annotation/freezed_annotation.dart';

part 'property.freezed.dart';
part 'property.g.dart';

@freezed
class Property with _$Property {
  const Property._();
  const factory Property(@JsonKey(name: 'access_token') String? address) = _Property;
  factory Property.fromJson(Map<String, dynamic> json) => _$PropertyFromJson(json);
}