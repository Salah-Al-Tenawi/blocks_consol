
import 'block.dart';

class Piece {
  List<Block> blocks;

  Piece({
    required this.blocks,
  });
  factory Piece.fromJson(Map<String, dynamic> json) {
    List<Block> blocks = (json['blocks'] as List)
        .map((blockJson) => Block.fromjson(List<int>.from(blockJson)))
        .toList();
    return Piece(blocks: blocks);
  }
  static List<Piece> listPiece(Map<String, dynamic> json) {
    List<Piece> pieces = [];
    List list = json["pieces"];
    list.map(
      (e) {
        pieces.add(Piece.fromJson(e));
      },
    ).toList();
    return pieces;
  }

  moveRight() {
    for (var block in blocks) {
      block.cord.moveright();
    }
  }

  moveLeft() {
    for (var block in blocks) {
      block.cord.moveleft();
    }
  }

  movetop() {
    for (var block in blocks) {
      block.cord.movetop();
    }
  }

  movebottom() {
    for (var block in blocks) {
      block.cord.movebottom();
    }
  }
}
