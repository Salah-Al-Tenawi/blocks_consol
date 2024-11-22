
import '../core/coordinates.dart';
import 'cell.dart';

class Field {
  int width;
  int height;
  List<List<Cell>> cells;
  Field({
    required this.width,
    required this.height,
    required this.cells,
  });
  

  factory Field.fromjson(Map<String, dynamic> json) {
    return Field(
        width: json['field']['width'],
        height: json['field']['height'],
        cells: handleShapeFromjson(json['field']['shape']));
  }
  static List<List<Cell>> handleShapeFromjson(List<List<int>> shape) {
    List<List<Cell>> cells = [];

    for (int i = 0; i < shape.length; i++) {
      List<Cell> row = [];
      for (int j = 0; j < shape[i].length; j++) {
        int cellType = shape[i][j];
        row.add(Cell(
          coordinates: Coordinates(x: i, y: j),
          type: cellType,
        ));
      }
      cells.add(row);
    }

    return cells;
  }

  bool isPositionValid(Coordinates coords) {
    return coords.x >= 0 &&
        coords.x < width &&
        coords.y >= 0 &&
        coords.y < height;
  }

  bool cellIsEmpty(Cell cell) {
    return isPositionValid(cell.coordinates) && isCell(cell) && cell.type == 0;
  }

  bool isCell(Cell cell) {
    return cell.type != 2;
  }

  void setCellType(Cell cell, int type) {
    if (isPositionValid(cell.coordinates)) {
      cell.type = type;
    }
  }

  bool isFull() {


    for (var row in cells) {
      for (var cell in row) {
        if (cell.type == 0) {
          return false;
        }
      }
    }
    return true;
  }
}
