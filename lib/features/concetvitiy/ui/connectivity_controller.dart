// features/connectivity/ui/connectivity_controller.dart

import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import '../data/connectivity_service.dart';

class ConnectivityController {
  ConnectivityController._();
  static final ConnectivityController instance = ConnectivityController._();

  final ConnectivityService _service = ConnectivityService();

  final ValueNotifier<bool> isConnected = ValueNotifier(true);

  StreamSubscription<ConnectivityResult>? _subscription;

  Future<void> init() async {
    final result = await _service.checkConnectivity();
    _updateState(result);

    _subscription = _service.onConnectivityChanged.listen(_updateState);
  }

  void _updateState(ConnectivityResult result) {
    isConnected.value = result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi;
  }

  void dispose() {
    _subscription?.cancel();
    _subscription = null;
    isConnected.dispose();
  }
}