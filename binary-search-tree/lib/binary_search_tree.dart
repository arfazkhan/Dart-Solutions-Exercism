class Bit {
  late final int _nd;
  String get data => _nd.toString();
  Bit? left;
  Bit? right;
  Bit(String n, {Bit? this.left, Bit? this.right}) : _nd = int.parse(n);
  void insert(String n) {
    final value = int.parse(n);
    right = value > _nd ? ((right?..insert(n)) ?? Bit(n)) : right;
    left = value <= _nd ? ((left?..insert(n)) ?? Bit(n)) : left;
  }
  List<String> list() => [...left?.list() ?? [], data, ...right?.list() ?? []];
}
class BinarySearchTree {
  late Bit root;
  List<String> get sortedData => root.list();
  BinarySearchTree(String s) {
    root = Bit(s);
  }
  void insert(String n) => root.insert(n);
}
