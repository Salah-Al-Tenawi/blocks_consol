// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'field.dart';
import 'piece.dart';

class GameState {
  final Field field;
  final List<Piece> pieces;
  const GameState({
    required this.field,
    required this.pieces,
  });
  bool isGaol() {
    for (var rowcell in field.cells) {
      for (var cell in rowcell) {
        if (cell.type == 0) {
          return false;
        }
      }
    }
    return true;
  }
}
