import 'package:dartz/dartz.dart';
import 'package:platzy_fackstore/core/constants/keys.dart';
import 'package:platzy_fackstore/core/network/api_request.dart';
import 'package:platzy_fackstore/core/network/app_dio.dart';
import 'package:platzy_fackstore/core/network/failuer.dart';
import 'package:platzy_fackstore/core/network/general_api.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../models/category.module.dart';
import '../abstract/category_datasource.dart';

class CategoryRemoteDatasource implements CategoryDatasource {
  final GeneralApi generalApi;
  final AppDio appDio;

  CategoryRemoteDatasource({
    required this.generalApi,
    required this.appDio,
  });

  @override
  Future<Either<Failuer, List<CategoryModel>>> getData() async {
    appDio.setJsonHeaders();

    return (await generalApi
            .get(ApiRequest(url: dotenv.env[ConstantKeys.categoriesApi]!)))
        .map(
      (r) => List.generate(
        (r.body as List).length,
        (index) => CategoryModel.fromJsonMap(
          (r.body as List)[index],
        ),
      ),
    );
  }

  @override
  Future<Either<Failuer, CategoryModel>> getDataById(int id) async {
    appDio.setJsonHeaders();

    return (await generalApi.get(
            ApiRequest(url: '${dotenv.env[ConstantKeys.categoriesApi]!}/$id')))
        .map(
      (r) => CategoryModel.fromJsonMap(
        r.body as Map<String, dynamic>,
      ),
    );
  }

  @override
  Future<Either<Failuer, CategoryModel>> postData(map) async {
    throw UnimplementedError();

    // try {
    //   Response response = await dio.post(
    //     ApiLinks.categoriesApi,
    //     data: jsonEncode(map),
    //   );

    //   dynamic decodedData = jsonDecode(response.data);

    //   if (response.statusCode == 200) {
    //     return right(CategoryModel.fromJsonMap(decodedData));
    //   }

    //   return left(decodedData['error']);
    // } catch (e) {
    //   return left(Failuer.handleExeption(e as Exception));
    // }
  }

  @override
  Future<Either<Failuer, CategoryModel>> putData(map) async {
    throw UnimplementedError();

    // try {
    //   Response response = await dio.put(
    //     '${ApiLinks.categoriesApi}/$id',
    //     data: jsonEncode(map),
    //   );

    //   dynamic decodedData = jsonDecode(response.data);

    //   if (response.statusCode == 200) {
    //     return right(CategoryModel.fromJsonMap(decodedData));
    //   }

    //   return left(decodedData['error']);
    // } catch (e) {
    //   return left(Failuer.handleExeption(e as Exception));
    // }
  }
}

/*some old local data
CategoryModel(
id: 0,
name: 'Hoodies',
image: Assets.images.catigories.hoddiesPng.image(),
),
CategoryModel(
id: 1,
name: 'Shorts',
image: Assets.images.catigories.shorts.image(),
),
CategoryModel(
id: 2,
name: 'Shoes',
image: Assets.images.catigories.shose.image(),
),
CategoryModel(
id: 3,
name: 'Bag',
image: Assets.images.catigories.bag.image(),
),
CategoryModel(
id: 4,
name: 'Accessories',
image: Assets.images.catigories.glasses.image(),
),

ProductModel(
id: 0,
image: Assets.images.products.mensHarringtonJacket.image(),
title: 'Men\'s Harrington Jacket',
price: '\$148.00',
),
ProductModel(
id: 1,
image: Assets.images.products.maxCirroMensSlides.image(),
title: 'Max Cirro Men\'s Slides',
price: '\$55.00',
discount: '\$100.97',
),
ProductModel(
id: 2,
image: Assets.images.products.mensCoachesJacket.image(),
title: 'Men\'s Coaches Jacket',
price: '\$66.97',
),
ProductModel(
id: 3,
image:
categoriesImages.hoddies.mensFleecePulloverHoodie.image(),
title: 'Men\'s Fleece Pullover Hoodie',
price: '\$100.00',
categoryId: 0,
),
ProductModel(
id: 4,
image:
categoriesImages.hoddies.fleecePulloverSkateHoodie.image(),
title: 'Fleece Pullover Skate Hoodie',
price: '\$150.97',
categoryId: 0,
),
ProductModel(
id: 5,
image: categoriesImages.hoddies.fleeceSkateHoodie.image(),
title: 'Fleece Skate Hoodie',
price: '\$110.00',
categoryId: 0,
),
ProductModel(
id: 6,
image:
categoriesImages.hoddies.mensIcedyePulloverHoodie.image(),
title: 'Men\'s Ice-Dye Pullover Hoodie',
price: '\$128.97',
categoryId: 0,
),
ProductModel(
id: 7,
image: categoriesImages.hoddies.mensMonogramHoodie.image(),
title: 'Men\'s Monogram Hoodie',
price: '\$52.97',
discount: '\$70.00',
categoryId: 0,
),
ProductModel(
id: 8,
image: categoriesImages.hoddies.mensPulloverBasketballHoodie.image(),
title: 'Men\'s Pullover Basketball Hoodie',
price: '\$105.00',
categoryId: 0,
),
*/
