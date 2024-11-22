// ignore_for_file: public_member_api_docs, sort_constructors_first


import '../core/coordinates.dart';

class Block {
  Coordinates cord;
  
  Block({
    required this.cord,
    
  });
  factory Block.fromjson(List<int> json) {
    return Block(
        cord: Coordinates(x: json[0], y: json[1]),
      );
  }
}

