import 'dart:math';

import 'package:flutter/material.dart';

// Default reference screen size (you can adjust these based on your design)
const int _referenceScreenWidth = 390; // width taken from figma
const int _referenceScreenHeight = 844; // height taken from figma

extension ResponsiveSizes on num {
  double _getWidth(BuildContext context) =>
      (this / _referenceScreenWidth) * MediaQuery.of(context).size.width;
  double _getHeight(BuildContext context) =>
      (this / _referenceScreenHeight) * MediaQuery.of(context).size.height;
  double getWidthRatio(BuildContext context) =>
      _referenceScreenWidth * MediaQuery.of(context).size.width;
  double getHeightRatio(BuildContext context) =>
      _referenceScreenHeight * MediaQuery.of(context).size.height;

  Widget responsiveHeight(BuildContext context) =>
      SizedBox(height: _getHeight(context));
  Widget responsiveWidth(BuildContext context) =>
      SizedBox(width: _getWidth(context));

  Widget responsiveHeightAsRatio(BuildContext context) =>
      SizedBox(height: (MediaQuery.of(context).size.height * this));
  Widget responsiveWidthAsRatio(BuildContext context) =>
      SizedBox(width: MediaQuery.of(context).size.width * this);

  // Font Scaling
  // Scaled Pixels
  double sp(BuildContext context) =>
      this * min(getHeightRatio(context), getWidthRatio(context));

  EdgeInsets fullEdgeInsets(BuildContext context) => EdgeInsets.symmetric(
      horizontal: _getWidth(context), vertical: _getHeight(context));
  EdgeInsets horizontalEdgeInsets(BuildContext context) =>
      EdgeInsets.symmetric(horizontal: _getWidth(context));
  EdgeInsets verticalEdgeInsets(BuildContext context) =>
      EdgeInsets.symmetric(vertical: _getWidth(context));
  EdgeInsetsDirectional startEdgeInsets(BuildContext context) =>
      EdgeInsetsDirectional.only(start: _getWidth(context));
  EdgeInsetsDirectional endEdgeInsets(BuildContext context) =>
      EdgeInsetsDirectional.only(end: _getWidth(context));
  EdgeInsets topEdgeInsets(BuildContext context) =>
      EdgeInsets.only(top: _getWidth(context));
  EdgeInsets bottomEdgeInsets(BuildContext context) =>
      EdgeInsets.only(bottom: _getWidth(context));
}
