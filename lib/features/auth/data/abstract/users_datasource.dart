import 'package:dartz/dartz.dart';
import 'package:platzy_fackstore/core/network/failuer.dart';
import 'package:platzy_fackstore/core/network/datasource.dart';
import '../models/new_user.module.dart';
import '../models/user_profile.module.dart';

abstract class UsersDatasource extends Datasource<UserProfile, NewUser> {
  Future<Either<Failuer, bool>> isValid(String email);
}
