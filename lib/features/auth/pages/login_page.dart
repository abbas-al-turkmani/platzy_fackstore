// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:platzy_fackstore/features/auth/models/text_field.module.dart';
import 'package:platzy_fackstore/features/auth/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:platzy_fackstore/core/app_cubit/app_cubit.dart';
import 'package:platzy_fackstore/core/app_cubit/app_state.dart';
import 'package:platzy_fackstore/core/constants/routes.dart';
import 'package:platzy_fackstore/core/constants/strings.dart';
import 'package:platzy_fackstore/core/dependency_injection/service_locator.dart';
import 'package:platzy_fackstore/core/router.dart';
import 'package:platzy_fackstore/core/theme_management/extensions/any_page_theme/any_page_theme.dart';
import 'package:platzy_fackstore/core/utils/responsive_utils.dart';
import 'package:platzy_fackstore/gen/assets.gen.dart';

import '../models/login_form.module.dart';
import '../models/social_button.module.dart';
import '../widgets/social_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    ResponsiveUtils utils = getItInstance();
    AnyPageTheme pageTheme =
        Theme.of(context).extensions[AnyPageTheme] as AnyPageTheme;

    List<SocialButtonModel> socialButtonModels = [
      SocialButtonModel(
        text: Strings.continueWithApple,
        icon: Icons.apple,
      ),
      SocialButtonModel(
        text: Strings.continueWithGoogle,
        imagePath: Assets.icons.google.path,
      ),
      SocialButtonModel(
        text: Strings.continueWithFacebook,
        imagePath: Assets.icons.facebook.path,
      ),
    ];

    TextEditingController emailController = TextEditingController();

    return Scaffold(
      backgroundColor: pageTheme.background,
      body: BlocListener<AppCubit, AppState>(
        listener: (context, state) {
          if (!state.checkEmailSubstate.error.isEmpty()) {
            var error = state.checkEmailSubstate.error;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  '${error.error} error code: ${error.statusCode}',
                ),
              ),
            );
          }
        },
        listenWhen: (previous, current) =>
            previous.checkEmailSubstate.isLoading !=
            current.checkEmailSubstate.isLoading,
        child: Padding(
          padding: utils.getResponsiveSymmetricPadding(context, horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header text, text field Countinue Button and a small text
              LoginForm(
                utils: utils,
                loginFormModel: LoginFormModel(
                  textFieldsData: [
                    TextFieldModel(
                      controller: emailController,
                      hintText: Strings.emailAddress,
                    )
                  ],
                  headerText: Strings.signIn,
                  questionText: Strings.dontHaveAnAccount,
                  clickableText: Strings.createOne,
                  clickableTextOnTap: () =>
                      router.push(Routes.createAccountPage),
                  continueButtonOnTap: () {
                    // appCubit.tryEmail(emailController.text);
                    router.push(Routes.passwordPage);
                  },
                ),
              ),
              const SizedBox(height: 71),
              SizedBox(
                height: socialButtonModels.length * 62,
                child: ListView.separated(
                  itemCount: socialButtonModels.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(height: 12),
                  itemBuilder: (BuildContext context, int index) {
                    return SocialButton(model: socialButtonModels[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
