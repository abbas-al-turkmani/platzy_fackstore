import 'package:platzy_fackstore/core/constants/routes.dart';
import 'package:platzy_fackstore/core/constants/strings.dart';
import 'package:platzy_fackstore/core/dependency_injection/service_locator.dart';
import 'package:platzy_fackstore/core/router.dart';
import 'package:platzy_fackstore/core/utils/responsive_utils.dart';
import 'package:platzy_fackstore/features/auth/models/login_form.module.dart';
import 'package:platzy_fackstore/features/auth/models/text_field.module.dart';
import 'package:platzy_fackstore/features/auth/widgets/login_form.dart';
import 'package:flutter/material.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    ResponsiveUtils utils = getItInstance();

    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: utils.getResponsiveFullPadding(context, padding: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LoginForm(
                utils: utils,
                loginFormModel: LoginFormModel(
                  textFieldsData: [
                    TextFieldModel(
                        controller: firstNameController,
                        hintText: Strings.firstName),
                    TextFieldModel(
                        controller: lastNameController,
                        hintText: Strings.lastName),
                    TextFieldModel(
                        controller: emailController,
                        hintText: Strings.emailAddress),
                    TextFieldModel(
                        controller: passwordController,
                        hintText: Strings.password)
                  ],
                  headerText: Strings.createAccount,
                  questionText: '${Strings.forgotPassword}?',
                  clickableText: Strings.reset,
                  clickableTextOnTap: () =>
                      router.push(Routes.forgotPasswordPage),
                  continueButtonOnTap: () => router.go(Routes.onboardingPage),
                ))
          ],
        ),
      ),
    );
  }
}
