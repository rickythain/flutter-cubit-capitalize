import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyState {
  final String inputString;

  MyState(this.inputString);

  String capString() {
    return inputString.toUpperCase();
  }
}

class Capitalize extends Cubit<MyState> {
  Capitalize() : super(MyState('input to start'));

  void capIt(String text) {
    emit(MyState(text));
  }
}
