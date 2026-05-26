import 'package:platzy_fackstore/core/constants/routes.dart';
import 'package:platzy_fackstore/core/constants/strings.dart';
import 'package:platzy_fackstore/core/dependency_injection/service_locator.dart';
import 'package:platzy_fackstore/core/router.dart';
import 'package:platzy_fackstore/core/utils/responsive_utils.dart';
import 'package:platzy_fackstore/core/widgets/my_button_2.dart';
import 'package:platzy_fackstore/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class OrderPlacedPage extends StatelessWidget {
  const OrderPlacedPage({super.key});

  @override
  Widget build(BuildContext context) {
    ResponsiveUtils utils = getItInstance();
    ThemeData theme = Theme.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFF8e6cef),
      bottomSheet: BottomSheet(
        onClosing: () {},
        builder: (context) => Container(
          decoration: BoxDecoration(
            color: const Color(0xFF342F3F),
            borderRadius: BorderRadius.circular(16),
          ),
          padding: utils.getResponsiveSymmetricPadding(
            context,
            vertical: 45,
            horizontal: 70,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                Strings.orderPlacedSuccessfully,
                textAlign: TextAlign.center,
                style: theme.textTheme.titleLarge,
              ),
              const SizedBox(height: 25),
              Text(
                Strings.youWillReceiveAConfirmationEmail,
                style: theme.textTheme.bodySmall,
              ),
              const SizedBox(height: 78),
              MyButton2(
                text: Strings.seeOrders,
                onPressed: () => router.go(Routes.ordersPage),
              )
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: utils.getResponsivePadding(
            context,
            top: 154,
            start: 36,
          ),
          child: Assets.images.pngs.orderPlaced.image(),
        ),
      ),
    );
  }
}
