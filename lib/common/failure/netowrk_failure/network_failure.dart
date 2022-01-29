import 'package:freezed_annotation/freezed_annotation.dart';

import 'base_failure.dart';

part 'network_failure.freezed.dart';

@freezed
class NetworkFailure with _$NetworkFailure implements BaseFailure {
  const NetworkFailure._();
  const factory NetworkFailure.noConnection({String? message}) = NoConnection;
  const factory NetworkFailure.serverException({String? message}) = ServerException;
}