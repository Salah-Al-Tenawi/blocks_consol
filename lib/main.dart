import 'models/game.dart';
import 'printer/print_field.dart';

void main() {
  Game game = Game.init();
  PrintField printField = PrintField(field: game.field, pieces: game.pieces);
  printField.printgame();

}
