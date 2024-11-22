
import '../data/json.dart';
import '../game_logic/logic_game.dart';
import 'field.dart';
import 'piece.dart';

class Game {
  Field field;
  List<Piece> pieces;
  LogicGame logicGame;
  Game({
    required this.field,
    required this.pieces,
    required this.logicGame,
  });
  static Game init() {
    Field field = Field.fromjson(Data.getfiled());
    List<Piece> pieces = Piece.listPiece(Data.getPieces());
    LogicGame logicGame = LogicGameIM(field: field, pieces: pieces);

    return Game(field: field, pieces: pieces, logicGame: logicGame);
  }

  static restartGame() {
    Game.init();
  }
}
