import 'package:flutter/material.dart';

class ResponsiveUtils {
  // Singleton pattern to ensure a single instanc
  factory ResponsiveUtils() => _instence;
  static final ResponsiveUtils _instence = ResponsiveUtils._local();
  ResponsiveUtils._local();

  // Default reference screen size (you can adjust these based on your design)
  static const double _referenceScreenWidth = 390; // width taken from figma
  static const double _referenceScreenHeight = 844; // height taken from figma

  // Text Styles util
  // ResponsiveTextStyles get textStyles => getItInstance<ResponsiveTextStyles>();

  // Get responsive width based on screen width
  double getResponsiveWidth(BuildContext context, double width) =>
      (width / _referenceScreenWidth) * MediaQuery.of(context).size.width;

  double getResponsiveWidthByRatio(BuildContext context, double ratio) {
    return MediaQuery.of(context).size.width * ratio;
  }

  // Get responsive height based on screen height
  double getResponsiveHeight(BuildContext context, double height) =>
      (height / _referenceScreenHeight) * MediaQuery.of(context).size.height;

  double getResponsiveHeightByRatio(BuildContext context, double ratio) =>
      MediaQuery.of(context).size.height * ratio;

  // Get responsive padding based on screen width and height
  EdgeInsetsDirectional getResponsivePadding(
    BuildContext context, {
    double start = 0,
    double top = 0,
    double end = 0,
    double bottom = 0,
  }) =>
      EdgeInsetsDirectional.fromSTEB(
        getResponsiveWidth(context, start),
        getResponsiveHeight(context, top),
        getResponsiveWidth(context, end),
        getResponsiveHeight(context, bottom),
      );

  // Get responsive symmetric padding based on screen width and height
  EdgeInsets getResponsiveSymmetricPadding(
    BuildContext context, {
    double horizontal = 0,
    double vertical = 0,
  }) =>
      EdgeInsets.symmetric(
        horizontal: getResponsiveWidth(context, horizontal),
        vertical: getResponsiveHeight(context, vertical),
      );

  // Get responsive all padding based on screen width and height
  EdgeInsets getResponsiveFullPadding(
    BuildContext context, {
    double padding = 0,
  }) =>
      EdgeInsets.all(getResponsiveWidth(context, padding));

  // Get responsive size (width and height) based on screen size
  Size getResponsiveSize(BuildContext context, double width, double height) =>
      Size(
        getResponsiveWidth(context, width),
        getResponsiveHeight(context, height),
      );

  // Get responsive font size based on screen width
  double getResponsiveFontSize(BuildContext context, double fontSize) =>
      (fontSize / _referenceScreenWidth) * MediaQuery.of(context).size.width;

  // Get responsive radius based on screen width
  double getResponsiveRadius(BuildContext context, double radius) =>
      (radius / _referenceScreenWidth) * MediaQuery.of(context).size.width;

  // This radius is the most comment in the app
  Radius generalRadius(BuildContext context) => Radius.circular(
        getResponsiveRadius(context, 12),
      );

  // Get responsive icon size based on screen width
  double getResponsiveIconSize(BuildContext context, double iconSize) =>
      (iconSize / _referenceScreenWidth) * MediaQuery.of(context).size.width;

  // Get responsive margin based on screen width and height
  EdgeInsets getResponsiveMargin(
    BuildContext context, {
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) =>
      EdgeInsets.fromLTRB(
        getResponsiveWidth(context, left),
        getResponsiveHeight(context, top),
        getResponsiveWidth(context, right),
        getResponsiveHeight(context, bottom),
      );
}
