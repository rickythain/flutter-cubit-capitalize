import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Capitalize extends Cubit<String> {
  Capitalize() : super("Input to start");

  void capIt(String text) {
    emit(text.toUpperCase());
  }
}
