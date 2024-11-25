import '../models/field.dart';
import '../models/game.dart';
import '../models/piece.dart';

class PrintField {
  Game game;
  PrintField({
    required this.game,
  });

  void printgame() {
    for (int y = 0; y < game.field.height; y++) {
      String row = '';
      for (int x = 0; x < game.field.width; x++) {
        row += '${game.field.cells[x][y].type} ';
      }
      print(row.trim());
    }
    printgameCord();
  }

  void printgameCord() {
    for (int y = 0; y <game.field.height; y++) {
      String row = '';
      for (int x = 0; x < game.field.width; x++) {
        row +=
            '[${game.field.cells[y][x].coordinates.x}][${game.field.cells[y][x].coordinates.y}] ';
      }
      print(row.trim());
    }

  }

  setFeildAndPeices(List<Piece> pieces, Field field) {
    this.game.field = field;
    this.game.pieces = pieces;
  }
}
