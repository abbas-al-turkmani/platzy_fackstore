// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_navigation_bar_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$MyNavigationBarThemeTailorMixin
    on ThemeExtension<MyNavigationBarTheme> {
  Color get backgroundColor;
  Color get navigationBarIcon;
  Color get navigationBarIconActive;

  @override
  MyNavigationBarTheme copyWith({
    Color? backgroundColor,
    Color? navigationBarIcon,
    Color? navigationBarIconActive,
  }) {
    return MyNavigationBarTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      navigationBarIcon: navigationBarIcon ?? this.navigationBarIcon,
      navigationBarIconActive:
          navigationBarIconActive ?? this.navigationBarIconActive,
    );
  }

  @override
  MyNavigationBarTheme lerp(
      covariant ThemeExtension<MyNavigationBarTheme>? other, double t) {
    if (other is! MyNavigationBarTheme) return this as MyNavigationBarTheme;
    return MyNavigationBarTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      navigationBarIcon:
          Color.lerp(navigationBarIcon, other.navigationBarIcon, t)!,
      navigationBarIconActive: Color.lerp(
          navigationBarIconActive, other.navigationBarIconActive, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MyNavigationBarTheme &&
            const DeepCollectionEquality()
                .equals(backgroundColor, other.backgroundColor) &&
            const DeepCollectionEquality()
                .equals(navigationBarIcon, other.navigationBarIcon) &&
            const DeepCollectionEquality().equals(
                navigationBarIconActive, other.navigationBarIconActive));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(backgroundColor),
      const DeepCollectionEquality().hash(navigationBarIcon),
      const DeepCollectionEquality().hash(navigationBarIconActive),
    );
  }
}

extension MyNavigationBarThemeBuildContextProps on BuildContext {
  MyNavigationBarTheme get myNavigationBarTheme =>
      Theme.of(this).extension<MyNavigationBarTheme>()!;
  Color get backgroundColor => myNavigationBarTheme.backgroundColor;
  Color get navigationBarIcon => myNavigationBarTheme.navigationBarIcon;
  Color get navigationBarIconActive =>
      myNavigationBarTheme.navigationBarIconActive;
}
