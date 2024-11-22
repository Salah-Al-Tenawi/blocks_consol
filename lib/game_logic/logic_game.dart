import '../models/cell.dart';
import '../models/field.dart';
import '../models/piece.dart';

abstract class LogicGame {
  Field field;
  List<Piece> pieces;
  List allMoves = [];

  LogicGame({
    required this.field,
    required this.pieces,
  });

  List<Cell> canPlacePeice(Piece piece, Cell cell);
   placePiece(Piece piece, Cell cell);
  backMove();
  bool canbackMove();
  bool isWin();
}

class LogicGameIM extends LogicGame {
  LogicGameIM({required super.field, required super.pieces});

  @override
  List<Cell> canPlacePeice(Piece piece, Cell cell) {
    List<Cell> checkCells = [];
    if (cell.type != 0) {
      return [];
    }
    int y = cell.coordinates.y;
    int x = cell.coordinates.x;
    for (int i = 0; i < piece.blocks.length; i++) {
      if (piece.blocks[i].cord.y + y < field.height &&
          piece.blocks[i].cord.x + x < field.width) {
        if (field.cells[piece.blocks[i].cord.y + y][piece.blocks[i].cord.x + x]
                .type ==
            0) {
          checkCells.add(field.cells[piece.blocks[i].cord.y + y]
              [piece.blocks[i].cord.x + x]);
        }
      }
    }

    return checkCells;
  }

  @override
  placePiece(Piece piece, Cell cell) {
    
    Map<String, dynamic> oneMove;
    List<Cell> list = canPlacePeice(piece, cell);
    if (list.isNotEmpty) {
      for (var item in list) {
        item.type = 1;
      }
    }

    oneMove = {"cells": list, "peice": piece};
    allMoves.add(oneMove);
    pieces.remove(piece);
  }

  @override
  bool isWin() {
    for (var cell in field.cells) {
      for (var cel in cell) {
        if (cel.type == 0) {
          return false;
        }
      }
    }
    return true;
  }

  @override
  backMove() {
    Map moves = allMoves.last;
    pieces.add(moves['peice']);
    List<Cell> cells = moves['cells'];
    for (var cell in cells) {
      cell.type = 0;
    }
    allMoves.removeLast();
  }

  @override
  bool canbackMove() {
    if (allMoves.isEmpty) {
      return false;
    }
    return true;
  }
}
