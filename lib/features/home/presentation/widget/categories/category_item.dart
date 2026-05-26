// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:platzy_fackstore/core/theme_management/extensions/my_card_theme/my_card_theme.dart';
import 'package:platzy_fackstore/core/widgets/my_cached_network_image.dart';

import '../../../models/category.module.dart';

class CatigoryItemV extends StatelessWidget {
  const CatigoryItemV({
    super.key,
    required this.category,
    required this.onTap,
  });

  final CategoryModel category;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 25,
            child: MyChachedNetworkImage(url: category.image),
          ),
          Text(
            category.name,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryItemH extends StatelessWidget {
  const CategoryItemH({
    super.key,
    required this.category,
    required this.onTap,
  });

  final CategoryModel category;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    MyCardTheme cardTheme =
        Theme.of(context).extensions[MyCardTheme] as MyCardTheme;

    return Card(
      color: cardTheme.cardColor,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: CircleAvatar(
              radius: 20,
              child: MyChachedNetworkImage(url: category.image),
            ),
            title: Text(
              category.name,
              style: cardTheme.textMedium,
            ),
          ),
        ),
      ),
    );
  }
}
