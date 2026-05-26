import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:platzy_fackstore/core/widgets/back_button.dart';
import 'package:platzy_fackstore/core/widgets/my_cached_network_image.dart';
import 'package:platzy_fackstore/core/widgets/my_dropdown_button.dart';
import 'package:platzy_fackstore/features/home/models/product.module.dart';

import '../widget/product_details/my_favorite_button.dart';
import '../widget/product_details/product_size_selector.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    Map<String, Color> colorsMap = {
      'white': Colors.white,
      'black': Colors.black,
      'red': Colors.red,
      'blue': Colors.blue,
      'orange': Colors.orange,
    };

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(24.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const MyBackButton(),
                  MyFavoriteButton(
                    onPressed: (value) async {
                      return (await Future.delayed(
                        const Duration(seconds: 2),
                        () => !value,
                      ));
                    },
                    isFavorite: productModel.isFavourite,
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              SizedBox(
                height: 250,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: productModel.images.length,
                  separatorBuilder: (context, index) => SizedBox(width: 10),
                  itemBuilder: (BuildContext context, int index) {
                    return MyChachedNetworkImage(
                      url: productModel.images[index],
                    );
                  },
                ),
              ),
              SizedBox(height: 24),
              Text(
                productModel.title,
                style: theme.textTheme.titleMedium,
                textAlign: TextAlign.start,
              ),
              Text(
                '\$${productModel.price}',
                style: theme.textTheme.titleMedium!
                    .copyWith(color: Color(0xFF8e6cef)),
              ),
              SizedBox(height: 33),
              // Here the widget that select the product size ['S', 'L', 'XL']
              ProductSizeSelector(),
              SizedBox(height: 24),
              // Here the widget that select the product Color
              MyDropdownButton<String>(
                items: colorsMap.keys.toList(),
                buildMenuItem: (item) => DropdownMenuItem(
                  value: item,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: colorsMap[item],
                        minRadius: 12.r,
                      ),
                    ],
                  ),
                ),
                onChanged: (p0) {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
