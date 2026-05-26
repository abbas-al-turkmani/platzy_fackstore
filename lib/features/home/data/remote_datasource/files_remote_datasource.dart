import 'dart:io';
import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:platzy_fackstore/core/constants/keys.dart';
import 'package:platzy_fackstore/core/network/api_request.dart';
import 'package:platzy_fackstore/core/network/app_dio.dart';

import 'package:platzy_fackstore/core/network/failuer.dart';
import 'package:platzy_fackstore/core/network/general_api.dart';

import 'package:platzy_fackstore/features/home/models/file_data.module.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../abstract/files_datasource.dart';

class FilesRemoteDatasource extends FilesDatasource {
  final AppDio appDio;
  final GeneralApi generalApi;

  FilesRemoteDatasource({
    required this.appDio,
    required this.generalApi,
  });

  @override
  Future<Either<Failuer, File>> getFile(String fileName) async {
    appDio.setJsonHeaders();

    return (await generalApi.get(
      ApiRequest(
        url: '${dotenv.env[ConstantKeys.getFileApi]!}/$fileName',
      ),
    ))
        .map(
      (r) => File.fromRawPath(
        r.body as Uint8List,
      ),
    );
  }

  @override
  Future<Either<Failuer, FileData>> uploadFile(File file) async {
    appDio.setFormDataHeaders();

    return (await generalApi.post(
      ApiRequest(
        url: dotenv.env[ConstantKeys.uploadFileApi]!,
        body: FormData.fromMap(
          {
            ConstantKeys.file: MultipartFile.fromString(
              file.path,
              filename: file.path.split('/').last,
            ),
          },
        ),
      ),
    ))
        .map(
      (r) => FileData.fromMap(
        r as Map<String, dynamic>,
      ),
    );
  }
}
