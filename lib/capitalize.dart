import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

class Capitalize extends Cubit<String> {
  Capitalize() : super("hello bois");

  var _textController = StreamController<String>();
  Stream<String> get textStream => _textController.stream;

  dispose() {
    _textController.close();
  }

  void updateText(String text) {
    if (text != null && text != "") {
      _textController.sink.add(text.toUpperCase());
    } else {
      _textController.sink.add("");
    }
  }

  void capIt() {
    emit(state.toUpperCase());
  }
}
