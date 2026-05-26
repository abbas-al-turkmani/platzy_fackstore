import 'package:flutter/material.dart';

class MyListBuilder extends StatelessWidget {
  const MyListBuilder({
    super.key,
    required this.itemCount,
    required this.builder,
    this.initSize = 0,
  });

  final int itemCount;
  final int initSize;
  final Widget Function(BuildContext, int) builder;

  @override
  Widget build(BuildContext context) {
    double listSize = 60.0 * itemCount;

    return SizedBox(
      height: (listSize > initSize ? listSize : initSize)*1.0,
      // height: 60.0 * itemCount,
      child: ListView.builder(
        itemCount: itemCount,
        itemBuilder: builder,
      ),
    );
  }
}
