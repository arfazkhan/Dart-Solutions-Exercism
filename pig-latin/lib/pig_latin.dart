String translate(String message) {
  final keep = RegExp(r'^([aeiou]|yt|xr)');
  final split = RegExp(r'^(?<move>sch|thr|[^aeiou]qu|ch|qu|rh|th|[^aeiou])(?<stay>\w+)');
  
  return message.split(' ')
    .map((word) {
      if (keep.hasMatch(word)) {
        return word + 'ay';
      }
      var match = split.firstMatch(word)!;
      return match.namedGroup('stay')! + match.namedGroup('move')! + 'ay';
    })
    .join(' ');
}
