import 'package:sector/sector.dart';

/// A base grid implementation that delegates all methods to another grid.
base class DelegatingGridView<T> implements Grid<T> {
  /// Creates a new grid that delegates all methods to the provided view.
  const DelegatingGridView(Grid<T> view) : _view = view;
  final Grid<T> _view;

  @override
  int get width => _view.width;

  @override
  int get height => _view.height;

  @override
  bool get isEmpty => _view.isEmpty;

  @override
  bool contains(T value) => _view.contains(value);

  @override
  (int, int)? offsetOf(T element, {(int, int) start = (0, 0)}) {
    return _view.offsetOf(element, start: start);
  }

  @override
  (int, int)? offsetWhere(bool Function(T) test, {(int, int) start = (0, 0)}) {
    return _view.offsetWhere(test, start: start);
  }

  @override
  (int, int)? lastOffsetOf(T element, {(int, int)? end}) {
    return _view.lastOffsetOf(element, end: end);
  }

  @override
  (int, int)? lastOffsetWhere(bool Function(T) test, {(int, int)? end}) {
    return _view.lastOffsetWhere(test, end: end);
  }

  @override
  bool containsXY(int x, int y) => _view.containsXY(x, y);

  @override
  bool containsXYWH(int x, int y, int width, int height) {
    return _view.containsXYWH(x, y, width, height);
  }

  @override
  T get(int x, int y) => _view.get(x, y);

  @override
  T getUnchecked(int x, int y) => _view.getUnchecked(x, y);

  @override
  void set(int x, int y, T value) => _view.set(x, y, value);

  @override
  void setUnchecked(int x, int y, T value) => _view.setUnchecked(x, y, value);

  @override
  Iterable<(int, int, T)> traverse({
    GridTraversal order = rowMajor,
    (int, int)? start,
  }) {
    return _view.traverse(order: order, start: start);
  }

  @override
  void clear() => _view.clear();

  @override
  Rows<T> get rows => _view.rows;

  @override
  Columns<T> get columns => _view.columns;

  @override
  Grid<T> subGrid({
    int left = 0,
    int top = 0,
    int? width,
    int? height,
  }) {
    return _view.subGrid(left: left, top: top, width: width, height: height);
  }

  @override
  Grid<T> asSubGrid({
    int left = 0,
    int top = 0,
    int? width,
    int? height,
  }) {
    return _view.asSubGrid(left: left, top: top, width: width, height: height);
  }

  @override
  String toString() => _view.toString();
}
