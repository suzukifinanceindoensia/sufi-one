import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sufi_one/app/modules/survey/widgets/circular_loader/circular_loader_value.dart';
import 'package:sufi_one/app/modules/survey/widgets/circular_loader/circular_loader_state.dart';

class CircularLoaderController extends ValueNotifier<CircularLoaderValue> {
  CircularLoaderController({CircularLoaderValue? value})
    : super(value ?? CircularLoaderValue());

  VoidCallback? _onCloseCallback;

  void startLoading({String? message}) {
    value
      ..state = CircularLoaderState.onLoading
      ..loadingMessage = message
      ..onclosed = false;
    notifyListeners();
  }

  void stopLoading({
    String? message,
    bool isError = false,
    Icon? icon,
    Duration? duration,
    VoidCallback? onClose,
    Widget? messageWidget,
  }) {
    _onCloseCallback = onClose;
    value
      ..state =
          isError
              ? CircularLoaderState.showError
              : CircularLoaderState.showMessage
      ..message = message
      ..icon = icon
      ..messageWidget = messageWidget
      ..onclosed = false;
    notifyListeners();

    if (duration != null) {
      Timer(duration, () {
        _onCloseCallback?.call();
        close();
      });
    }
  }

  void close() {
    if (value.state == CircularLoaderState.onLoading) return;
    if (!value.onclosed) {
      _onCloseCallback?.call();
    }
    value
      ..state = CircularLoaderState.idle
      ..onclosed = true;
    notifyListeners();
  }

  void forceStop({String? message}) {
    value
      ..state = CircularLoaderState.idle
      ..message = message
      ..messageWidget = null
      ..onclosed = true;
    notifyListeners();
  }

  bool get isLoading => value.state == CircularLoaderState.onLoading;
}
