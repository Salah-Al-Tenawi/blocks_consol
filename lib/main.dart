import 'dart:io';

import 'models/game.dart';
import 'player/dfs.dart';
import 'printer/print_field.dart';

void main() {
  Game game = Game.init();
  PrintField printField = PrintField(game: game);
  DfsAlgo dfsplayer = DfsAlgo(game: game,printField: printField);
 
  print(dfsplayer.dfs());
}
