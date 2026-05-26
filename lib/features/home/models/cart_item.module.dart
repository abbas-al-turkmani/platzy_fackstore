import 'package:flutter/material.dart';

import 'package:platzy_fackstore/features/home/models/product.module.dart';

class CartItemModel {
  final int id;
  final ProductModel product;
  final ProductSize productSize;
  final Color productColor;
  final int amount;

  CartItemModel({
    required this.id,
    required this.product,
    required this.amount,
    required this.productSize,
    required this.productColor,
  });

  CartItemModel copyWith({
    int? id,
    ProductModel? product,
    ProductSize? productSize,
    Color? productColor,
    int? amount,
  }) {
    return CartItemModel(
      id: id ?? this.id,
      product: product ?? this.product,
      productSize: productSize ?? this.productSize,
      productColor: productColor ?? this.productColor,
      amount: amount ?? this.amount,
    );
  }
}

enum ProductSize {
  S,
  M,
  L,
  xl,
  xxl,
}
