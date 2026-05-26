import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:platzy_fackstore/core/network/failuer.dart';

import '../../models/file_data.module.dart';

abstract class FilesDatasource {
  Future<Either<Failuer, FileData>> uploadFile(File file);

  Future<Either<Failuer, File>> getFile(String fileName);
}
