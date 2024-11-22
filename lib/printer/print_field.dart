import 'dart:math';

import '../models/field.dart';
import '../models/piece.dart';

class PrintField {
  Field field;
  List<Piece> pieces;

  PrintField({
    required this.field,
    required this.pieces,
  });

  void printgame() {
    for (int y = 0; y < field.height; y++) {
      String row = '';
      for (int x = 0; x < field.width; x++) {
        row += '${field.cells[y][x].type} ';
      }
      print(row.trim());
    }

    print("number the pieces is ${pieces.length}");
  }
}
