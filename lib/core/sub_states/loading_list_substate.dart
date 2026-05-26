import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../core/network/failuer.dart';
import 'substate.dart';

class LoadingListSubstate<T> extends Substate<List<T>> {
  final List<T> list;
  final bool pagenationIsLoading;
  final bool serverHasData;

  LoadingListSubstate({
    required this.list,
    required super.isLoading,
    required super.error,
    required this.pagenationIsLoading,
    required this.serverHasData,
  });

  factory LoadingListSubstate.initState({
    List<T>? list,
    Failuer? error,
    bool isLoading = false,
    bool pagenationIsLoading = false,
    bool serverHasData = true,
  }) =>
      LoadingListSubstate(
        list: list ?? List.empty(),
        isLoading: isLoading,
        pagenationIsLoading: pagenationIsLoading,
        serverHasData: serverHasData,
        error: error ?? Failuer.empty(),
      );

  @override
  LoadingListSubstate<T> copyWith(
      {List<T>? list,
      bool? isLoading,
      bool? pagenationIsLoading,
      Failuer? error,
      bool? hasData}) {
    return LoadingListSubstate<T>(
      list: list ?? this.list,
      isLoading: isLoading ?? this.isLoading,
      pagenationIsLoading: pagenationIsLoading ?? this.pagenationIsLoading,
      error: error ?? this.error,
      serverHasData: hasData ?? serverHasData,
    );
  }

  @override
  LoadingListSubstate<T> runLoading() => copyWith(isLoading: true);
  LoadingListSubstate<T> runPagenationLoading() {
    if (list.isNotEmpty) return copyWith(pagenationIsLoading: true);
    return runLoading();
  }

  @override
  LoadingListSubstate<T> handleEither(
    Either<Failuer, List<T>> either, {
    void Function()? onLeft,
    void Function(List<T> value)? onRight,
  }) {
    return either.fold(
      (l) => copyWith(
        isLoading: false,
        error: l,
      ),
      (r) => copyWith(
        isLoading: false,
        list: List.from(r),
      ),
    );
  }

  LoadingListSubstate<T> handleEitherForPagenation(
    Either<Failuer, List<T>> either,
    void Function(bool result) onResult,
  ) {
    return either.fold(
      (l) {
        onResult(false);
        return copyWith(
          isLoading: false,
          pagenationIsLoading: false,
          error: l,
        );
      },
      (r) {
        onResult(true);
        return copyWith(
          isLoading: false,
          pagenationIsLoading: false,
          list: List.from(list + r),
        );
      },
    );
  }

  LoadingListSubstate<T> clearList() {
    return copyWith(
      list: List.empty(),
    );
  }

  @override
  bool operator ==(covariant LoadingListSubstate<T> other) {
    if (identical(this, other)) return true;

    return listEquals(other.list, list) &&
        other.isLoading == isLoading &&
        other.error == error;
  }

  bool notEqual(LoadingListSubstate<T> other) => !(this == other);

  @override
  int get hashCode => list.hashCode ^ isLoading.hashCode ^ error.hashCode;
}
