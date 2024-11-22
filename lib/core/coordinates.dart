// ignore_for_file: public_member_api_docs, sort_constructors_first

class Coordinates {
  int x;
  int y;
  

   Coordinates({
    required this.x,
    required this.y,
  });

  movebottom() {
    x++;
  }

  moveleft() {
    y--;
  }

  moveright() {
    y++;
  }

  movetop() {
    x--;
  }
}
