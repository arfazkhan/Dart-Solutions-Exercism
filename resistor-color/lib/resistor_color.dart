class ResistorColor {
  static const resclr = [
    'black',
    'brown',
    'red',
    'orange',
    'yellow',
    'green',
    'blue',
    'violet',
    'grey',
    'white',
  ];

  int colorCode(String color) => resclr.indexOf(color);

  List<String> get colors => resclr;
}