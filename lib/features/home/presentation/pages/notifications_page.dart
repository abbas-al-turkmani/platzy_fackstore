import 'package:platzy_fackstore/core/constants/strings.dart';
import 'package:platzy_fackstore/core/dependency_injection/service_locator.dart';
import 'package:platzy_fackstore/core/utils/responsive_utils.dart';
import 'package:flutter/material.dart';

import '../widget/no_notifications_widget.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    ResponsiveUtils utils = getItInstance();

    ThemeData theme = Theme.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 204,
      children: [
        Padding(
          padding: utils.getResponsivePadding(context, top: 71),
          child: Text(
            Strings.notifications,
            style: theme.textTheme.headlineSmall,
          ),
        ),
        Padding(
          padding: utils.getResponsiveSymmetricPadding(
            context,
            horizontal: 24
          ),
          child: NoNotificationsWidget(
            utils: utils,
            theme: theme
          ),
        )
      ],
    );
  }
}
