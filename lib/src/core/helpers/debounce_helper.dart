import 'dart:async';

import 'package:flutter/material.dart';

class DebounceHelper {
  final int milliseconds;

  Timer? _timer;

  DebounceHelper({required this.milliseconds});

  void call(VoidCallback callback) {
    _timer?.cancel();

    _timer = Timer(Duration(milliseconds: milliseconds), callback);
  }
}
