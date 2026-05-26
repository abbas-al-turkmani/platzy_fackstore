import 'package:flutter/material.dart';

import 'package:platzy_fackstore/core/constants/routes.dart';
import 'package:platzy_fackstore/core/constants/strings.dart';
import 'package:platzy_fackstore/core/dependency_injection/service_locator.dart';
import 'package:platzy_fackstore/core/router.dart';
import 'package:platzy_fackstore/core/utils/responsive_utils.dart';
import 'package:platzy_fackstore/features/auth/models/login_form.module.dart';
import 'package:platzy_fackstore/features/auth/models/text_field.module.dart';
import 'package:platzy_fackstore/features/auth/widgets/login_form.dart';

class PasswordPage extends StatelessWidget {
  const PasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    ResponsiveUtils utils = getItInstance();

    TextEditingController passwordTextEditingController =
        TextEditingController();

    return Scaffold(
      body: Padding(
          padding: utils.getResponsiveSymmetricPadding(context, horizontal: 24),
          child: LoginForm(
              utils: utils,
              loginFormModel: LoginFormModel(
                textFieldsData: [
                  TextFieldModel(
                    controller: passwordTextEditingController,
                    hintText: Strings.password,
                  )
                ],
                headerText: Strings.signIn,
                questionText: '${Strings.forgotPassword}?',
                clickableText: Strings.reset,
                clickableTextOnTap: () =>
                    router.push(Routes.forgotPasswordPage),
                continueButtonOnTap: () => router.go(Routes.homePage),
              ))),
    );
  }
}
