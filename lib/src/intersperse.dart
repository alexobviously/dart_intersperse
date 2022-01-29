/// Puts [element] between every element in [list].
///
/// Example:
///
///     final list1 = intersperse(2, <int>[]); // [];
///     final list2 = intersperse(2, [0]); // [0];
///     final list3 = intersperse(2, [0, 0]); // [0, 2, 0];
///     final list4 = intersperse(2, [0, 0, 0, 0, 0, 0], stride: 2); // [0, 0, 2, 0, 0, 2, 0, 0];
///
Iterable<T> intersperse<T>(T element, Iterable<T> iterable, {int stride = 1, int? offset}) sync* {
  if (stride < 1) throw ArgumentError.value(stride, 'stride', 'stride must be > 0');
  final iterator = iterable.iterator;
  final _offset = offset ?? stride;
  int pos = 0;
  while (iterator.moveNext()) {
    if (pos >= _offset && (pos - _offset) % stride == 0) yield element;
    yield iterator.current;
    pos++;
  }
}

/// Puts [element] between every element in [list] and at the bounds of [list].
///
/// Example:
///
///     final list1 = intersperseOuter(2, <int>[]); // [];
///     final list2 = intersperseOuter(2, [0]); // [2, 0, 2];
///     final list3 = intersperseOuter(2, [0, 0]); // [2, 0, 2, 0, 2];
///
Iterable<T> intersperseOuter<T>(T element, Iterable<T> iterable) sync* {
  final iterator = iterable.iterator;
  if (iterable.isNotEmpty) {
    yield element;
  }
  while (iterator.moveNext()) {
    yield iterator.current;
    yield element;
  }
}
