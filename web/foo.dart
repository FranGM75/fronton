import 'dart:html';

import 'package:fronton/fronton.dart';

void main() {
  CanvasElement canvas = querySelector("#canvas");
  ParagraphElement resultado = querySelector("#fallos");
  Board b = new Board(canvas,resultado);
  b.init();
}

