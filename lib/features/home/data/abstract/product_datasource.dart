import 'package:dartz/dartz.dart';
import 'package:platzy_fackstore/core/network/datasource.dart';
import 'package:platzy_fackstore/core/network/failuer.dart';

import '../../models/create_product.module.dart';
import '../../models/product.module.dart';

abstract class ProductDatasource
    extends Datasource<ProductModel, CreateProductModel> {
  Future<Either<Failuer, List<ProductModel>>> getLimit(int offset, int count);
}
