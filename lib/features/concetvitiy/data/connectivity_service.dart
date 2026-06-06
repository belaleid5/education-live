import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  final Connectivity _connectivity = Connectivity();

  Future<ConnectivityResult> checkConnectivity() async {
    final result = await _connectivity.checkConnectivity();
    return result.isNotEmpty ? result.first : ConnectivityResult.none;
  }

  Stream<ConnectivityResult> get onConnectivityChanged {
    return _connectivity.onConnectivityChanged.map(
      (event) => event.isNotEmpty ? event.first : ConnectivityResult.none,
    );
  }
}