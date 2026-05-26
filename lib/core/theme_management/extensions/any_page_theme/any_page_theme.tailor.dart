// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'any_page_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$AnyPageThemeTailorMixin on ThemeExtension<AnyPageTheme> {
  Color get background;
  Color get headerText1;
  Color get primaryText1;
  Color get secoundryText1;

  @override
  AnyPageTheme copyWith({
    Color? background,
    Color? headerText1,
    Color? primaryText1,
    Color? secoundryText1,
  }) {
    return AnyPageTheme(
      background: background ?? this.background,
      headerText1: headerText1 ?? this.headerText1,
      primaryText1: primaryText1 ?? this.primaryText1,
      secoundryText1: secoundryText1 ?? this.secoundryText1,
    );
  }

  @override
  AnyPageTheme lerp(covariant ThemeExtension<AnyPageTheme>? other, double t) {
    if (other is! AnyPageTheme) return this as AnyPageTheme;
    return AnyPageTheme(
      background: Color.lerp(background, other.background, t)!,
      headerText1: Color.lerp(headerText1, other.headerText1, t)!,
      primaryText1: Color.lerp(primaryText1, other.primaryText1, t)!,
      secoundryText1: Color.lerp(secoundryText1, other.secoundryText1, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AnyPageTheme &&
            const DeepCollectionEquality()
                .equals(background, other.background) &&
            const DeepCollectionEquality()
                .equals(headerText1, other.headerText1) &&
            const DeepCollectionEquality()
                .equals(primaryText1, other.primaryText1) &&
            const DeepCollectionEquality()
                .equals(secoundryText1, other.secoundryText1));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(background),
      const DeepCollectionEquality().hash(headerText1),
      const DeepCollectionEquality().hash(primaryText1),
      const DeepCollectionEquality().hash(secoundryText1),
    );
  }
}

extension AnyPageThemeBuildContextProps on BuildContext {
  AnyPageTheme get anyPageTheme => Theme.of(this).extension<AnyPageTheme>()!;
  Color get background => anyPageTheme.background;
  Color get headerText1 => anyPageTheme.headerText1;
  Color get primaryText1 => anyPageTheme.primaryText1;
  Color get secoundryText1 => anyPageTheme.secoundryText1;
}
