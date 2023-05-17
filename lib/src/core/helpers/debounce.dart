import 'dart:async';

import 'package:flutter/material.dart';

class Debounce {
  final int milliseconds;

  Timer? _timer;

  Debounce({required this.milliseconds});

  void call(VoidCallback callback) {
    _timer?.cancel();

    _timer = Timer(Duration(milliseconds: milliseconds), callback);
  }
}
