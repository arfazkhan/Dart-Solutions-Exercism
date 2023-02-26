import 'position.dart';
import 'orientation.dart';

class Robot {
  Robot(this.position, this.orientation);
  Position position;
  Orientation orientation;
  void move(String user) {
    var commands = user.split('');
    for (String command in commands) {
      
      if (command == 'R') {
        switch (orientation) {case Orientation.north: orientation = Orientation.east; break;
                              case Orientation.east: orientation = Orientation.south; break;
                              case Orientation.south: orientation = Orientation.west; break;
                              case Orientation.west: orientation = Orientation.north; break;
                             }
      } 
      
      else if (command == 'L') {
        switch (orientation) { case Orientation.north: orientation = Orientation.west; break;
                               case Orientation.east: orientation = Orientation.north; break;
                               case Orientation.south: orientation = Orientation.east; break;
                               case Orientation.west: orientation = Orientation.south; break;
                             }
      }
      
       else if (command == 'A') {
        if (orientation == Orientation.west ||orientation == Orientation.east) {orientation == Orientation.east ? position.x++ : position.x--;}
        else {orientation == Orientation.north ? position.y++ : position.y--;}
      }
       else { throw FormatException('Warning! Command prohibited'); }
    }
  }
}
