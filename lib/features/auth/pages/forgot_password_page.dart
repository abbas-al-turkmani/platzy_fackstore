import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:platzy_fackstore/core/constants/strings.dart';
import 'package:platzy_fackstore/core/dependency_injection/service_locator.dart';
import 'package:platzy_fackstore/core/utils/responsive_utils.dart';
import 'package:platzy_fackstore/core/widgets/back_button.dart';

import '../bloc/reset_password_cubit/reset_password_cubit.bloc.dart';
import '../bloc/reset_password_cubit/reset_password_state.bloc.dart';
import '../models/login_form.module.dart';
import '../models/text_field.module.dart';
import '../widgets/email_sent_widget.dart';
import '../widgets/login_form.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    ResponsiveUtils utils = getItInstance();

    TextEditingController emailController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: utils.getResponsiveFullPadding(context, padding: 24),
        child: BlocProvider(
          create: (context) => ResetPasswordCubit(getItInstance()),
          child: BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
            builder: (context, state) {
              return IndexedStack(
                index: state.pageIndex,
                children: [
                  LoginForm(
                      utils: utils,
                      //Back to prevoius page button
                      topAriaChild: const MyBackButton(),
                      loginFormModel: LoginFormModel(
                        textFieldsData: [
                          TextFieldModel(
                            controller: emailController,
                            hintText: Strings.enterEmailAddress,
                          )
                        ],
                        headerText: Strings.forgotPassword,
                        questionText: '',
                        clickableText: '',
                        clickableTextOnTap: () {},
                        continueButtonOnTap: () => context
                            .read<ResetPasswordCubit>()
                            .tryEmail(emailController.value.text),
                      )),
                  const EmailSentWidget(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
