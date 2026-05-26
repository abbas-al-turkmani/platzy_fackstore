import 'package:dartz/dartz.dart';
import 'package:platzy_fackstore/core/network/failuer.dart';

abstract class Datasource<T, M> {
  Future<Either<Failuer, List<T>>> getData();
  Future<Either<Failuer, T>> getDataById(int id);
  Future<Either<Failuer, T>> postData(M model);
  Future<Either<Failuer, T>> putData(T model);
  // Future<Either<Failuer, dynamic>> deleteData(int id);
}
