// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../game_logic/logic_game.dart';
import '../models/field.dart';
import '../models/game.dart';
import '../models/game_state.dart';
import '../models/piece.dart';

class DfsAlgo {
  Game game;
  List<GameState>? visited;
  DfsAlgo({required this.game}) {
    visited = [];
  }

  dfs(Field field, List<Piece> pieces) {
    GameState gameState = GameState(field: field, pieces: pieces);
    visited?.add(gameState);
    game.logicGame.placePiece(pieces.first, field.cells.first.first);
    while (!gameState.isGaol()) {
      dfs(field, pieces);
    }
  }
}
