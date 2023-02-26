class BeerSong {
  var stringRegular = [
    "{was} bottles of beer on the wall, {was} bottles of beer.",
    "Take one down and pass it around, {left} bottles of beer on the wall."
  ];
  var stringTwo = [
    "2 bottles of beer on the wall, 2 bottles of beer.",
    "Take one down and pass it around, 1 bottle of beer on the wall."
  ];
  var stringOne = [
    "1 bottle of beer on the wall, 1 bottle of beer.",
    "Take it down and pass it around, no more bottles of beer on the wall."
  ];
  var stringZero = [
    "No more bottles of beer on the wall, no more bottles of beer.",
    "Go to the store and buy some more, 99 bottles of beer on the wall."
  ];

  List<String> recite(int startBottles, int count) {
    var result = <String>[];

    for (var i = 0; i < count; i++) {
      var verse = <String>[];

      if (startBottles == 0) {
        verse = stringZero;
      } else if (startBottles == 1) {
        verse = stringOne;
      } else if (startBottles == 2) {
        verse = stringTwo;
      } else {
        verse.add(stringRegular[0].replaceAll("{was}", startBottles.toString()));
        verse.add(stringRegular[1].replaceAll("{left}", (startBottles - 1).toString()));
      }

      result.add(verse[0]);
      result.add(verse[1]);

      startBottles--;

      if (i < count - 1) {
        result.add('');
      }
    }

    return result;
  }
}
