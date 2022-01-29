import '../intersperse.dart' as core;

extension IntersperseExtensions<T> on Iterable<T> {
  /// Puts [element] between every element in [list].
  ///
  /// Example:
  ///
  ///     final list1 = <int>[].intersperse(2); // [];
  ///     final list2 = [0].intersperse(2); // [0];
  ///     final list3 = [0, 0].intersperse(2); // [0, 2, 0];
  ///     final list4 = [0, 0, 0, 0, 0, 0].intersperse(2, stride: 2); // [0, 0, 2, 0, 0, 2, 0, 0];
  ///
  Iterable<T> intersperse(T element, {int stride = 1, int? offset}) {
    return core.intersperse(element, this, stride: stride, offset: offset);
  }

  /// Puts [element] between every element in [list] and at the bounds of [list].
  ///
  /// Example:
  ///
  ///     final list1 = <int>[].intersperseOuter(2); // [];
  ///     final list2 = [0].intersperseOuter(2); // [2, 0, 2];
  ///     final list3 = [0, 0].intersperseOuter(2); // [2, 0, 2, 0, 2];
  ///
  Iterable<T> intersperseOuter(T element) {
    return core.intersperseOuter(element, this);
  }
}
