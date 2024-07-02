import 'package:sector/sector.dart';
import 'package:sector/src/views/delegating_grid_view.dart';

/// A grid view that prevents modification of the underlying grid.
///
/// Useful for exposing a read-only view of a grid in an untrusted context.
final class UnmodifiableGridView<T> extends DelegatingGridView<T> {
  /// Creates a grid view that prevents modification of the underlying grid.
  const UnmodifiableGridView(super.view);

  @override
  void set(int x, int y, T value) {
    throw UnsupportedError('Cannot modify an unmodifiable grid view');
  }

  @override
  void setUnchecked(int x, int y, T value) {
    throw UnsupportedError('Cannot modify an unmodifiable grid view');
  }

  @override
  void clear() {
    throw UnsupportedError('Cannot clear an unmodifiable grid view');
  }

  @override
  GridAxis<T> get rows => DelegatingGridAxis(view.rows);

  @override
  GridAxis<T> get columns => DelegatingGridAxis(view.columns);
}