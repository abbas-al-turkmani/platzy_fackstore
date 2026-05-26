import 'package:dartz/dartz.dart';

import '../../core/network/failuer.dart';
import 'substate.dart';

class LoadingItemSubstate<T> extends Substate<T> {
  T? item;
  LoadingItemSubstate({
    required this.item,
    required super.isLoading,
    required super.error,
  });

  factory LoadingItemSubstate.initState() => LoadingItemSubstate(
        item: null,
        isLoading: false,
        error: Failuer.empty(),
      );

  LoadingItemSubstate<T> _copyWith({
    T? item,
    bool? isLoading,
    Failuer? error,
  }) {
    return LoadingItemSubstate<T>(
      item: item ?? this.item,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }

  @override
  LoadingItemSubstate<T> runLoading() => _copyWith(isLoading: true);

  @override
  LoadingItemSubstate<T> handleEither(
    Either<Failuer, T> either, {
    void Function()? onLeft,
    void Function(T value)? onRight,
  }) {
    return either.fold(
      (l) => _copyWith(
        isLoading: false,
        error: l,
      ),
      (r) => _copyWith(
        isLoading: false,
        item: r,
      ),
    );
  }

  @override
  bool operator ==(covariant LoadingItemSubstate<T> other) {
    if (identical(this, other)) return true;

    return other.item == item &&
        other.isLoading == isLoading &&
        other.error == error;
  }

  bool notEqual(LoadingItemSubstate<T> other) => !(this == other);

  @override
  int get hashCode => item.hashCode ^ isLoading.hashCode ^ error.hashCode;
}
