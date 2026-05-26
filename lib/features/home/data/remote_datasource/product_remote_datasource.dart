import 'package:dartz/dartz.dart';
import 'package:platzy_fackstore/core/constants/keys.dart';

import 'package:platzy_fackstore/core/network/api_request.dart';
import 'package:platzy_fackstore/core/network/app_cancel_tokens.dart';
import 'package:platzy_fackstore/core/network/app_dio.dart';
import 'package:platzy_fackstore/core/network/failuer.dart';
import 'package:platzy_fackstore/core/network/general_api.dart';
import 'package:platzy_fackstore/features/home/models/create_product.module.dart';
import 'package:platzy_fackstore/features/home/models/product.module.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../abstract/product_datasource.dart';

class ProductRemoteDatasource implements ProductDatasource {
  final AppDio appDio;
  final GeneralApi generalApi;
  final AppCancelTokens appCancelTokens;

  ProductRemoteDatasource({
    required this.appDio,
    required this.generalApi,
    required this.appCancelTokens,
  });

  static const String _getProductsCancelToken = 'GET_PRODUCTS_CANCEL_TOKEN';

  @override
  Future<Either<Failuer, List<ProductModel>>> getData() async {
    appDio.setJsonHeaders();

    appCancelTokens.modifyToken(_getProductsCancelToken);

    return (await generalApi.get(
      ApiRequest(
        url: dotenv.env[ConstantKeys.productsApi]!,
        cancelToken: appCancelTokens.getToken(_getProductsCancelToken),
      ),
    ))
        .map(
      (r) => List.generate(
        (r.body as List).length,
        (index) => ProductModel.fromMap(
          (r.body as List)[index],
        ),
      ),
    );
  }

  @override
  Future<Either<Failuer, ProductModel>> getDataById(int id) async {
    appDio.setJsonHeaders();

    return (await generalApi.get(
      ApiRequest(url: '${dotenv.env[ConstantKeys.productsApi]!}/$id'),
    ))
        .map(
      (r) => ProductModel.fromMap(
        r.body as Map<String, dynamic>,
      ),
    );
  }

  @override
  Future<Either<Failuer, ProductModel>> postData(
      CreateProductModel model) async {
    appDio.setJsonHeaders();

    return (await generalApi.post(
      ApiRequest(
        url: dotenv.env[ConstantKeys.productsApi]!,
        body: model.toMap(),
      ),
    ))
        .map(
      (r) => ProductModel.fromMap(
        r.body as Map<String, dynamic>,
      ),
    );
  }

  @override
  Future<Either<Failuer, ProductModel>> putData(model) async {
    appDio.setJsonHeaders();

    return (await generalApi.put(
      ApiRequest(
        url: dotenv.env[ConstantKeys.productsApi]!,
        body: model.toMap(),
      ),
    ))
        .map(
      (r) => ProductModel.fromMap(
        r.body as Map<String, dynamic>,
      ),
    );
  }

  @override
  Future<Either<Failuer, List<ProductModel>>> getLimit(
      int offset, int count) async {
    appDio.setJsonHeaders();

    return (await generalApi.get(
      ApiRequest(
        url: dotenv.env[ConstantKeys.productsApi]!,
        parameters: {
          ConstantKeys.offset: offset,
          ConstantKeys.limit: count,
        },
      ),
    ))
        .map(
      (r) => List.generate(
        (r.body as List).length,
        (index) => ProductModel.fromMap((r.body as List)[index]),
      ),
    );
  }
}

// Response 404
// {
// "path": "/api/v1/products/3333",
// "timestamp": "2025-01-14T05:24:16.573Z",
// "name": "EntityNotFoundError",
// "message": "Could not find any entity of type \"Product\" matching: {
//    \"relations\": [
//        \"category\"
//    ],
//    \"where\": {
//        \"id\": 3333
//    }
// }"
// }
