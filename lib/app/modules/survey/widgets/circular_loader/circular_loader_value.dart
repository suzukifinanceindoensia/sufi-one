import 'package:flutter/material.dart';
import 'package:sufi_one/app/modules/survey/widgets/circular_loader/circular_loader_state.dart';

class CircularLoaderValue {
  CircularLoaderState state = CircularLoaderState.idle;
  String? message;
  Icon? icon;
  Widget? messageWidget;
  String? loadingMessage;
  bool onclosed = true;
}
