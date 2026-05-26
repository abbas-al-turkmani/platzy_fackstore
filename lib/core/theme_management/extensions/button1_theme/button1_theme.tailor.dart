// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'button1_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$Button1ThemeTailorMixin on ThemeExtension<Button1Theme> {
  Color get backgroundColor;
  Color get textColor;
  Color get iconColor;

  @override
  Button1Theme copyWith({
    Color? backgroundColor,
    Color? textColor,
    Color? iconColor,
  }) {
    return Button1Theme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textColor: textColor ?? this.textColor,
      iconColor: iconColor ?? this.iconColor,
    );
  }

  @override
  Button1Theme lerp(covariant ThemeExtension<Button1Theme>? other, double t) {
    if (other is! Button1Theme) return this as Button1Theme;
    return Button1Theme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      textColor: Color.lerp(textColor, other.textColor, t)!,
      iconColor: Color.lerp(iconColor, other.iconColor, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Button1Theme &&
            const DeepCollectionEquality()
                .equals(backgroundColor, other.backgroundColor) &&
            const DeepCollectionEquality().equals(textColor, other.textColor) &&
            const DeepCollectionEquality().equals(iconColor, other.iconColor));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(backgroundColor),
      const DeepCollectionEquality().hash(textColor),
      const DeepCollectionEquality().hash(iconColor),
    );
  }
}

extension Button1ThemeBuildContextProps on BuildContext {
  Button1Theme get button1Theme => Theme.of(this).extension<Button1Theme>()!;
  Color get backgroundColor => button1Theme.backgroundColor;
  Color get textColor => button1Theme.textColor;
  Color get iconColor => button1Theme.iconColor;
}
