// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_card_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$MyCardThemeTailorMixin on ThemeExtension<MyCardTheme> {
  Color get cardColor;
  TextStyle get textLarge;
  TextStyle get textMedium;
  Color get iconColor;

  @override
  MyCardTheme copyWith({
    Color? cardColor,
    TextStyle? textLarge,
    TextStyle? textMedium,
    Color? iconColor,
  }) {
    return MyCardTheme(
      cardColor: cardColor ?? this.cardColor,
      textLarge: textLarge ?? this.textLarge,
      textMedium: textMedium ?? this.textMedium,
      iconColor: iconColor ?? this.iconColor,
    );
  }

  @override
  MyCardTheme lerp(covariant ThemeExtension<MyCardTheme>? other, double t) {
    if (other is! MyCardTheme) return this as MyCardTheme;
    return MyCardTheme(
      cardColor: Color.lerp(cardColor, other.cardColor, t)!,
      textLarge: TextStyle.lerp(textLarge, other.textLarge, t)!,
      textMedium: TextStyle.lerp(textMedium, other.textMedium, t)!,
      iconColor: Color.lerp(iconColor, other.iconColor, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MyCardTheme &&
            const DeepCollectionEquality().equals(cardColor, other.cardColor) &&
            const DeepCollectionEquality().equals(textLarge, other.textLarge) &&
            const DeepCollectionEquality()
                .equals(textMedium, other.textMedium) &&
            const DeepCollectionEquality().equals(iconColor, other.iconColor));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(cardColor),
      const DeepCollectionEquality().hash(textLarge),
      const DeepCollectionEquality().hash(textMedium),
      const DeepCollectionEquality().hash(iconColor),
    );
  }
}

extension MyCardThemeBuildContextProps on BuildContext {
  MyCardTheme get myCardTheme => Theme.of(this).extension<MyCardTheme>()!;
  Color get cardColor => myCardTheme.cardColor;
  TextStyle get textLarge => myCardTheme.textLarge;
  TextStyle get textMedium => myCardTheme.textMedium;
  Color get iconColor => myCardTheme.iconColor;
}
