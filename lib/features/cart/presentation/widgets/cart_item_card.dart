import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:platzy_fackstore/core/gen/colors.gen.dart';
import 'package:platzy_fackstore/core/widgets/my_card.dart';
import 'package:flutter/material.dart';

import 'package:platzy_fackstore/core/utils/responsive_utils.dart';
import 'package:platzy_fackstore/core/widgets/my_cached_network_image.dart';
import 'package:platzy_fackstore/features/home/models/cart_item.module.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    super.key,
    required this.utils,
    required this.model,
  });

  final ResponsiveUtils utils;
  final CartItemModel model;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return MyCard(
      child: Container(
        height: 80.w,
        padding: utils.getResponsiveFullPadding(
          context,
          padding: 6,
        ),
        child: Row(
          children: [
            // image section
            Container(
              clipBehavior: Clip.antiAlias,
              width: 50.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  utils.generalRadius(context),
                ),
                border: BoxBorder.all(
                  style: BorderStyle.none,
                ),
              ),
              child: MyChachedNetworkImage(
                url: model.product.images[0],
              ),
            ),
            Padding(
              // Info section
              padding: utils.getResponsiveSymmetricPadding(
                context,
                horizontal: 12,
                vertical: 6,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: utils.getResponsiveWidth(context, 190),
                        child: Text(
                          model.product.title,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.titleSmall,
                        ),
                      ),
                      Text(
                        '\$${model.product.price}',
                        style: theme.textTheme.titleSmall,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Size - ',
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.titleSmall,
                      ),
                      Text(
                        model.productSize.name,
                        style: theme.textTheme.titleSmall,
                      ),
                      SizedBox(
                        width: utils.getResponsiveWidth(context, 10),
                      ),
                      Text(
                        'Color - ',
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.titleSmall,
                      ),
                      Text(
                        'Color',
                        style: theme.textTheme.titleSmall,
                      ),
                      SizedBox(width: 10.w),

                      // Coentity Buttons
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: ColorName.buttonColor2,
                            radius: utils.getResponsiveRadius(context, 12),
                            child: const Center(child: Icon(Icons.add)),
                          ),
                          CircleAvatar(
                            backgroundColor: ColorName.buttonColor2,
                            radius: utils.getResponsiveRadius(context, 12),
                            child: const Center(child: Icon(Icons.remove)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
