import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

abstract class ConnectivityInfo {
  Future<bool> get isConnected;
}

@LazySingleton(as: ConnectivityInfo)
class ConnectivityInfoImpl implements ConnectivityInfo {
  final Connectivity connectivity;

  ConnectivityInfoImpl(this.connectivity);

  @override
  Future<bool> get isConnected async {
    final result = await connectivity.checkConnectivity();
    return result == ConnectivityResult.wifi ||
        result == ConnectivityResult.mobile;
  }
}
