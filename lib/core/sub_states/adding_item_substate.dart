import 'package:dartz/dartz.dart';

import '../../core/network/failuer.dart';
import 'substate.dart';

class AddingItemSubstate<T> extends Substate<T> {
  final T? iteme;
  final bool isSucceed;
  AddingItemSubstate({
    required super.isLoading,
    required super.error,
    required this.isSucceed,
    this.iteme,
  });

  factory AddingItemSubstate.initState() => AddingItemSubstate(
        isLoading: false,
        error: Failuer.empty(),
        isSucceed: true,
      );

  @override
  AddingItemSubstate<T> runLoading() => AddingItemSubstate(
        isLoading: true,
        error: Failuer.empty(),
        isSucceed: true,
      );

  @override
  AddingItemSubstate<T> handleEither(
    Either<Failuer, T> either, {
    void Function()? onLeft,
    void Function(T value)? onRight,
  }) {
    return either.fold(
      (l) => AddingItemSubstate(
        isLoading: false,
        isSucceed: false,
        error: l,
      ),
      (r) => AddingItemSubstate(
        isLoading: false,
        isSucceed: true,
        error: Failuer.empty(),
        iteme: r,
      ),
    );
  }
}
