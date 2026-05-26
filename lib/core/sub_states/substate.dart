import 'package:dartz/dartz.dart';

import '../../core/network/failuer.dart';

class Substate<T> {
  final bool isLoading;
  final Failuer error;
  Substate({
    required this.isLoading,
    required this.error,
  });

  factory Substate.initState() => Substate<T>(
        isLoading: false,
        error: Failuer.empty(),
      );

  Substate<T> runLoading() => copyWith(
        isLoading: true,
        error: Failuer.empty(),
      );

  Substate<T> stopLoading() => copyWith(isLoading: false);

  Substate<T> handleEither(
    Either<Failuer, T> either, {
    void Function()? onLeft,
    void Function(T value)? onRight,
  }) =>
      either.fold(
        (l) {
          (onLeft ?? () {}).call();
          return Substate(
            isLoading: false,
            error: l,
          );
        },
        (r) {
          (onRight ?? () {}).call();
          return Substate(
            isLoading: false,
            error: Failuer.empty(),
          );
        },
      );

  Substate<T> copyWith({
    bool? isLoading,
    Failuer? error,
  }) {
    return Substate(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
