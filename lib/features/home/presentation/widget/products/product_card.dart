import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:platzy_fackstore/core/constants/routes.dart';
import 'package:platzy_fackstore/core/router.dart';
import 'package:platzy_fackstore/core/theme_management/extensions/my_card_theme/my_card_theme.dart';
import 'package:platzy_fackstore/core/widgets/my_cached_network_image.dart';
import 'package:platzy_fackstore/features/home/models/product.module.dart';
import 'package:platzy_fackstore/features/home/presentation/bloc/home_cubit.bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.model,
    required this.favoriteOnPressed,
  });

  final ProductModel model;

  final ProductModel Function(ProductModel product) favoriteOnPressed;

  @override
  Widget build(BuildContext context) {
    MyCardTheme cardTheme =
        Theme.of(context).extensions[MyCardTheme] as MyCardTheme;

    void onTap() => router.push(Routes.productDetailes,
        extra: context.read<HomeCubit>().state.productsSubstate.list.firstWhere(
              (element) => model.id == element.id,
            ));

    return SizedBox(
      width: 160,
      child: Card(
        color: cardTheme.cardColor,
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8.h,
          children: [
            //* product image
            Expanded(
              flex: 4,
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  InkWell(
                    onTap: onTap,
                    child: Container(
                      color: Colors.white,
                      width: double.infinity,
                      height: 240,
                      child: MyChachedNetworkImage(url: model.images[0]),
                    ),
                  ),
                  HeartButton(
                    favoriteOnPressed: favoriteOnPressed,
                    model: model,
                  ),
                ],
              ),
            ),

            //* product information
            Expanded(
              flex: 2,
              child: InkWell(
                onTap: onTap,
                child: Padding(
                  padding: const EdgeInsetsGeometry.directional(start: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        model.title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: cardTheme.textMedium,
                      ),
                      Row(
                        children: [
                          Text(
                            '\$${model.price}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 10),
                          if (model.discount != null)
                            Text(
                              model.discount!.toString(),
                              style: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.lineThrough,
                                decorationColor: Colors.white,
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HeartButton extends StatefulWidget {
  const HeartButton({
    super.key,
    required this.favoriteOnPressed,
    required this.model,
  });

  final ProductModel Function(ProductModel product) favoriteOnPressed;
  final ProductModel model;

  @override
  State<HeartButton> createState() => _HeartButtonState();
}

class _HeartButtonState extends State<HeartButton> {
  late ProductModel _productModel;

  @override
  void initState() {
    super.initState();
    _productModel = widget.model;
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => setState(() {
        _productModel = widget.favoriteOnPressed(_productModel);
      }),
      icon: Icon(
        _productModel.isFavourite ? Iconsax.heart5 : Iconsax.heart,
        color: _productModel.isFavourite ? Colors.red : Colors.white,
      ),
    );
  }
}
