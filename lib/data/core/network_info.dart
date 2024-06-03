import 'dart:async';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:loggy/loggy.dart';

class NetworkInfo with UiLoggy {
  late StreamSubscription<InternetStatus> _internetStatusSubscription;
  late StreamController<bool> _controller;

  Stream<bool> get stream => _controller.stream;

  NetworkInfo() {
    _controller = StreamController<bool>.broadcast();
    openStream();
  }

  void openStream() {
    _internetStatusSubscription = InternetConnection()
        .onStatusChange
        .listen(_internetStatusSubscriptionListener);
  }

  void closeStream() {
    _internetStatusSubscription.cancel();
  }

  void _addValue(bool value) {
    _controller.add(value);
  }

  void dispose() {
    _controller.close();
  }

  Future<bool> isConnected() async {
    try {
      return await InternetConnection().hasInternetAccess;
    } catch (e) {
      loggy.error("Error checking internet connection: $e");
      return false;
    }
  }

  void _internetStatusSubscriptionListener(InternetStatus status) {
    _addValue(status == InternetStatus.connected);
  }
}
