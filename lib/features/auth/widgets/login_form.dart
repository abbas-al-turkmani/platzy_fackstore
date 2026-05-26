import 'package:platzy_fackstore/core/constants/strings.dart';
import 'package:platzy_fackstore/core/utils/responsive_utils.dart';
import 'package:platzy_fackstore/core/widgets/my_button_2.dart';
import 'package:platzy_fackstore/core/widgets/my_text_field.dart';
import 'package:platzy_fackstore/core/widgets/text_with_clickable_text.dart';
import 'package:flutter/material.dart';

import '../models/login_form.module.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required this.utils,
    this.topAriaChild,
    required this.loginFormModel,
  });

  final ResponsiveUtils utils;
  final Widget? topAriaChild;
  final LoginFormModel loginFormModel;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 123,
          child: topAriaChild,
        ),
        Text(
          loginFormModel.headerText,
          style: theme.primaryTextTheme.headlineLarge,
        ),
        const SizedBox(height: 32),
        SizedBox(
          height: 80.0 * loginFormModel.textFieldsData.length,
          child: ListView.separated(
            itemCount: loginFormModel.textFieldsData.length,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 5,
              );
            },
            itemBuilder: (BuildContext context, int index) {
              return MyTextField(
                  controller: loginFormModel.textFieldsData[index].controller,
                  hintText: loginFormModel.textFieldsData[index].hintText);
            },
          ),
        ),
        const SizedBox(height: 16),
        MyButton2(
          text: Strings.sContinue,
          height: 50,
          onPressed: loginFormModel.continueButtonOnTap,
        ),
        const SizedBox(height: 16),
        TextWithClickableText(
          text: loginFormModel.questionText,
          clickableText: loginFormModel.clickableText,
          onTap: loginFormModel.clickableTextOnTap,
        ),
      ],
    );
  }
}
