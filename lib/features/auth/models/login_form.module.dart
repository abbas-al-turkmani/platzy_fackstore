import 'text_field.module.dart';

class LoginFormModel {
  List<TextFieldModel> textFieldsData;
  String headerText;
  String questionText;
  String clickableText;
  void Function() clickableTextOnTap;
  void Function() continueButtonOnTap;

  LoginFormModel({
    required this.textFieldsData,
    required this.headerText,
    required this.questionText,
    required this.clickableText,
    required this.clickableTextOnTap,
    required this.continueButtonOnTap,
  });
}
