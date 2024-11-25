
import '../models/game.dart';
import '../models/game_state.dart';
import '../printer/print_field.dart';

class DfsAlgo {
  PrintField printField;
  int call = 0;
  Game game;
  List<GameState> visited;
  int visitedCount;

  DfsAlgo({
    required this.printField,
    required this.game,
  })  : visited = [],
        visitedCount = 0; 

  bool dfs() {
    printField.printgame();
    // print(
    //     "the number of pieces for one calling is ${printField.game.pieces.length}");
    // print("the call number is$call");
    // call++;
    GameState gameState = GameState(field: game.field, pieces: game.pieces);

    if (!visited.contains(gameState)) {
      visited.add(gameState);
      visitedCount++;
    } else {
      return false;
    }
    if (gameState.isGaol()) {
      print(" number of visited state   =$visitedCount");
      return true;
    }

    for (var piece in game.pieces) {
      for (var cells in game.field.cells) {
        for (var cell in cells) {
          if (game.logicGame.placePiece(piece, cell)) {
            if (dfs()) {
              return true;
            } 
              if (game.logicGame.canbackMove()) {
                game.logicGame.backMove();
                
              
            }
          }
        }
      }
    }

    return false;
  }
}
