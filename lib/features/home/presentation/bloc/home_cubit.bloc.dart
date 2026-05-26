import 'package:platzy_fackstore/features/home/models/cart_item.module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/abstract/category_datasource.dart';
import '../../data/abstract/product_datasource.dart';
import '../../models/product.module.dart';
import 'state/home.state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required this.categoryDatasource,
    required this.productDatasource,
  }) : super(HomeState.initState());

  final CategoryDatasource categoryDatasource;
  final ProductDatasource productDatasource;

  void initData() async {
    emit(state.copyWith(
      categoriesSubstate: state.categoriesSubstate.runLoading(),
      productsSubstate: state.productsSubstate.runLoading(),
    ));

    emit(state.copyWith(
      categoriesSubstate: state.categoriesSubstate.handleEither(
        await categoryDatasource.getData(),
      ),
      productsSubstate: state.productsSubstate.handleEither(
        await productDatasource.getLimit(0, 10),
      ),
    ));

    //* temproral for testing:

    List<CartItemModel> cartList;
    if (state.productsSubstate.list.isNotEmpty) {
      cartList = [
        CartItemModel(
          id: 0,
          product: state.productsSubstate.list[0],
          amount: 1,
          productColor: Colors.white,
          productSize: ProductSize.M,
        ),
        CartItemModel(
          id: 1,
          product: state.productsSubstate.list[1],
          amount: 1,
          productColor: Colors.white,
          productSize: ProductSize.M,
        ),
        CartItemModel(
          id: 2,
          product: state.productsSubstate.list[2],
          amount: 1,
          productColor: Colors.white,
          productSize: ProductSize.M,
        ),
        CartItemModel(
          id: 3,
          product: state.productsSubstate.list[3],
          amount: 1,
          productColor: Colors.white,
          productSize: ProductSize.M,
        ),
        CartItemModel(
          id: 4,
          product: state.productsSubstate.list[4],
          amount: 1,
          productColor: Colors.white,
          productSize: ProductSize.M,
        ),
        CartItemModel(
          id: 5,
          product: state.productsSubstate.list[5],
          amount: 1,
          productColor: Colors.white,
          productSize: ProductSize.M,
        ),
        CartItemModel(
          id: 6,
          product: state.productsSubstate.list[6],
          amount: 1,
          productColor: Colors.white,
          productSize: ProductSize.M,
        ),
      ];
    } else {
      cartList = [];
    }

    emit(
      state.copyWith(
        cartSubstate: state.cartSubstate.copyWith(list: cartList),
      ),
    );

    //*

    // (await categoryDatasource.getData()).fold(
    //   (l) => emit(state.copyWith(
    //     isCategoriesLoading: false,
    //     categoriesErrorMessage: l,
    //   )),
    //   (r) => emit(state.copyWith(
    //     isCategoriesLoading: false,
    //     categories: r,
    //   )),
    // );

    // (await productDatasource.getLimit(0, 10)).fold(
    //   (l) => emit(state.copyWith(
    //     isProductsLoading: false,
    //     productsErrorMessage: l,
    //   )),
    //   (r) => emit(state.copyWith(
    //     isProductsLoading: false,
    //     products: r,
    //   )),
    // );
  }

  ProductModel toggleProductFavorite(ProductModel product) {
    List<ProductModel> newProductsList = List.from(state.productsSubstate.list);
    List<ProductModel> newFavoriteList = List.from(state.favoriteProducts);

    ProductModel newProduct =
        product.copyWith(isFavourite: !product.isFavourite);

    newProductsList[newProductsList.indexOf(product)] = newProduct;

    if (newProduct.isFavourite) {
      newFavoriteList.add(newProduct);
    } else {
      newFavoriteList.removeWhere((element) => element.id == newProduct.id);
    }

    emit(state.copyWith(
      productsSubstate: state.productsSubstate.copyWith(list: newProductsList),
      favoriteProducts: newFavoriteList,
    ));

    return newProduct;
  }

  void _refreshCart(List<CartItemModel> newList) => emit(state.copyWith(
        cartSubstate: state.cartSubstate.copyWith(
          list: List.from(newList),
        ),
      ));

  void addToCart(CartItemModel model) {
    List<CartItemModel> newList = state.cartSubstate.list;
    CartItemModel? newModel;
    for (var element in newList) {
      if (element.id == model.id) {
        newModel = element.copyWith(amount: element.amount + 1);
      }
    }

    newList.removeWhere((element) => element.id == model.id);
    newList.add(newModel ?? model);

    _refreshCart(newList);
  }

  void removeFromCart(CartItemModel model) {
    List<CartItemModel> newList = state.cartSubstate.list;
    newList.removeWhere((element) => element.id == model.id);

    _refreshCart(newList);
  }

  void clearCart() => _refreshCart([]);
}
