import 'dart:collection';

class Anagram {
  List<String> findAnagrams(String target, List<String> candidates) {
    target = target.toLowerCase();
    Set<String> result = {};
    List<int> targetMap = _getCharCountList(target);

    for (String candidate in candidates) {
      String candidateLower = candidate.toLowerCase();
      if (candidateLower == target) {
        continue;
      }
      List<int> candidateMap = _getCharCountList(candidateLower);
      if (_isAnagram(targetMap, candidateMap)) {
        result.add(candidate);
      }
    }

    return result.toList();
  }

  List<int> _getCharCountList(String s) {
    List<int> list = List.filled(26, 0);
    for (int i = 0; i < s.length; i++) {
      list[s.codeUnitAt(i) - 97]++;
    }
    return list;
  }

  bool _isAnagram(List<int> list1, List<int> list2) {
    for (int i = 0; i < 26; i++) {
      if (list1[i] != list2[i]) {
        return false;
      }
    }
    return true;
  }
}

final anagram = Anagram();
