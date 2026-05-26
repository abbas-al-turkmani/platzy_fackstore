import 'package:platzy_fackstore/core/constants/routes.dart';
import 'package:platzy_fackstore/core/router.dart';
import 'package:flutter/material.dart';

import 'package:platzy_fackstore/core/constants/strings.dart';
import 'package:platzy_fackstore/core/dependency_injection/service_locator.dart';
import 'package:platzy_fackstore/core/utils/responsive_utils.dart';
import 'package:platzy_fackstore/core/widgets/my_button_2.dart';
import 'package:platzy_fackstore/gen/assets.gen.dart';

class EmailSentWidget extends StatelessWidget {
  const EmailSentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ResponsiveUtils utils = getItInstance();

    ThemeData theme = Theme.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Assets.images.pngs.email
            .image(width: utils.getResponsiveWidth(context, 100)),
        const SizedBox(
          height: 20,
        ),
        Text(
          Strings.weSentYouAnEmailToResetYourPassword,
          style: theme.primaryTextTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 20,
        ),
        MyButton2(
          height: 52,
          text: Strings.returnToLogin,
          onPressed: () => router.go(Routes.logInPage),
        )
      ],
    );
  }
}
