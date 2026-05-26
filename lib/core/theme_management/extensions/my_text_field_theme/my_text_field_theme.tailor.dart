// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_text_field_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$MyTextFieldThemeTailorMixin on ThemeExtension<MyTextFieldTheme> {
  Color get fillColor;
  Color get textColor;
  Color get hintColor;

  @override
  MyTextFieldTheme copyWith({
    Color? fillColor,
    Color? textColor,
    Color? hintColor,
  }) {
    return MyTextFieldTheme(
      fillColor: fillColor ?? this.fillColor,
      textColor: textColor ?? this.textColor,
      hintColor: hintColor ?? this.hintColor,
    );
  }

  @override
  MyTextFieldTheme lerp(
      covariant ThemeExtension<MyTextFieldTheme>? other, double t) {
    if (other is! MyTextFieldTheme) return this as MyTextFieldTheme;
    return MyTextFieldTheme(
      fillColor: Color.lerp(fillColor, other.fillColor, t)!,
      textColor: Color.lerp(textColor, other.textColor, t)!,
      hintColor: Color.lerp(hintColor, other.hintColor, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MyTextFieldTheme &&
            const DeepCollectionEquality().equals(fillColor, other.fillColor) &&
            const DeepCollectionEquality().equals(textColor, other.textColor) &&
            const DeepCollectionEquality().equals(hintColor, other.hintColor));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(fillColor),
      const DeepCollectionEquality().hash(textColor),
      const DeepCollectionEquality().hash(hintColor),
    );
  }
}

extension MyTextFieldThemeBuildContextProps on BuildContext {
  MyTextFieldTheme get myTextFieldTheme =>
      Theme.of(this).extension<MyTextFieldTheme>()!;
  Color get fillColor => myTextFieldTheme.fillColor;
  Color get textColor => myTextFieldTheme.textColor;
  Color get hintColor => myTextFieldTheme.hintColor;
}
