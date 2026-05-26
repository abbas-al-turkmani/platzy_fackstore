import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyContainer extends StatelessWidget {
  const MyContainer({super.key, this.width, this.child, this.height});

  final double? width;
  final double? height;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height ?? 50.w,
      padding: EdgeInsets.symmetric(
        horizontal: 24.w,
        vertical: 5.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.r),
        color: Color(0xFF342F3F),
      ),
      child: child,
    );
  }
}
