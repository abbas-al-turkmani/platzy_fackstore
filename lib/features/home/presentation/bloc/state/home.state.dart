// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:platzy_fackstore/core/sub_states/loading_list_substate.dart';
import 'package:platzy_fackstore/features/home/models/cart_item.module.dart';
import 'package:platzy_fackstore/features/home/models/notification.module.dart';

import '../../../models/category.module.dart';
import '../../../models/product.module.dart';

class HomeState {
  final LoadingListSubstate<CategoryModel> categoriesSubstate;
  final LoadingListSubstate<ProductModel> productsSubstate;
  final LoadingListSubstate<CartItemModel> cartSubstate;
  final LoadingListSubstate<NotificationModel> notificationsSubstate;
  final List<ProductModel> favoriteProducts;

  HomeState({
    required this.categoriesSubstate,
    required this.productsSubstate,
    required this.cartSubstate,
    required this.notificationsSubstate,
    required this.favoriteProducts,
  });

  factory HomeState.initState() => HomeState(
        categoriesSubstate: LoadingListSubstate.initState(),
        productsSubstate: LoadingListSubstate.initState(),
        cartSubstate: LoadingListSubstate.initState(),
        notificationsSubstate: LoadingListSubstate.initState(),
        favoriteProducts: [],
      );

  HomeState copyWith({
    LoadingListSubstate<CategoryModel>? categoriesSubstate,
    LoadingListSubstate<ProductModel>? productsSubstate,
    LoadingListSubstate<CartItemModel>? cartSubstate,
    LoadingListSubstate<NotificationModel>? notificationsSubstate,
    List<ProductModel>? favoriteProducts,
  }) {
    return HomeState(
      categoriesSubstate: categoriesSubstate ?? this.categoriesSubstate,
      productsSubstate: productsSubstate ?? this.productsSubstate,
      cartSubstate: cartSubstate ?? this.cartSubstate,
      notificationsSubstate:
          notificationsSubstate ?? this.notificationsSubstate,
      favoriteProducts: favoriteProducts ?? this.favoriteProducts,
    );
  }
}
