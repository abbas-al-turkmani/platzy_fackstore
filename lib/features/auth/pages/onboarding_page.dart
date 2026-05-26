import 'package:platzy_fackstore/core/constants/routes.dart';
import 'package:platzy_fackstore/core/router.dart';
import 'package:platzy_fackstore/core/widgets/my_button_2.dart';
import 'package:platzy_fackstore/core/widgets/my_dropdown_button.dart';
import 'package:platzy_fackstore/core/widgets/my_radio_buttons.dart';
import 'package:flutter/material.dart';

import 'package:platzy_fackstore/core/constants/strings.dart';
import 'package:platzy_fackstore/core/dependency_injection/service_locator.dart';
import 'package:platzy_fackstore/core/utils/responsive_utils.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    List<String> genders = [Strings.men, Strings.women];
    // ignore: unused_local_variable
    late int selectedGenderIndex;

    ResponsiveUtils utils = getItInstance();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: utils.getResponsiveFullPadding(context, padding: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 123,
                ),
                Text(
                  Strings.tellUsAboutYourself,
                  style: theme.primaryTextTheme.headlineMedium,
                ),
                const SizedBox(
                  height: 49,
                ),
                Text(
                  Strings.whoDoYouShopFor,
                  style: theme.primaryTextTheme.bodySmall,
                ),
                const SizedBox(
                  height: 13,
                ),
                Center(
                  child: MyRadioButtonSet<String>(
                    values: genders,
                    onSelectionChanged: (index) => selectedGenderIndex = index,
                    buttonChildBuilder: (context, isSelected, index) => Text(
                      genders[index],
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 56,
                ),
                Text(
                  Strings.howOldAreYou,
                  style: theme.primaryTextTheme.bodySmall,
                ),
                const SizedBox(
                  height: 13,
                ),
                MyDropdownButton<String>(
                  items: [Strings.ageRange, '25', '26'],
                  onChanged: (value) {},
                ),
              ],
            ),
          ),
          SizedBox(
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Divider(),
                Padding(
                  padding: utils.getResponsiveSymmetricPadding(
                    context,
                    horizontal: 24,
                  ),
                  child: MyButton2(
                    text: Strings.finish,
                    height: 52,
                    onPressed: () {
                      router.go(Routes.homePage);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
