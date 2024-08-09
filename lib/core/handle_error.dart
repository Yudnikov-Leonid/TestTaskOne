import 'dart:io';

class HandleError {
  static const bool _debugMode = false;

  String call(Object e) {
    if (_debugMode) return e.toString();

    switch (e) {
      case ServerError _:
        return 'The server is unavailable';
      case SocketException _:
        return 'No internet connection';
    }
    return 'Unknown error';
  }
}

class ServerError implements Exception {}
