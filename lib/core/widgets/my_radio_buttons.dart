import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:platzy_fackstore/core/widgets/my_button_2.dart';

class MyRadioButtonSet<T> extends StatefulWidget {
  const MyRadioButtonSet({
    super.key,
    required this.values,
    required this.onSelectionChanged,
    required this.buttonChildBuilder,
    this.scrollDirection = Axis.horizontal,
    this.buttonHeight,
    this.selectedIndex,
  });

  final List<T> values;
  final Widget Function(BuildContext context, bool isSelected, int index)
      buttonChildBuilder;
  final int? selectedIndex;
  final Axis scrollDirection;
  final double? buttonHeight;
  final void Function(int index) onSelectionChanged;

  @override
  State<MyRadioButtonSet> createState() => _MyRadioButtonSetState<T>();
}

class _MyRadioButtonSetState<T> extends State<MyRadioButtonSet> {
  late int? currentIndex;

  @override
  void initState() {
    currentIndex = widget.selectedIndex;

    super.initState();
  }

  void _onPressed(int index) {
    if (currentIndex != index) {
      setState(() => currentIndex = index);
      widget.onSelectionChanged(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    double buttonWidth = 150.w;

    ToggleButtonsThemeData themeData = ToggleButtonsTheme.of(context);

    return ToggleButtonsTheme(
      data: themeData,
      child: SizedBox(
        height: 55,
        child: Center(
          child: ListView.separated(
            scrollDirection: widget.scrollDirection,
            itemCount: widget.values.length,
            separatorBuilder: (context, index) =>
                widget.scrollDirection == Axis.horizontal
                    ? SizedBox(width: 15.w)
                    : SizedBox(height: 15.h),
            itemBuilder: (context, index) => SizedBox(
              width: buttonWidth,
              height: widget.buttonHeight ?? 40,
              child: MyButton2(
                height: widget.buttonHeight,
                onPressed: () => _onPressed(index),
                backgroundColor:
                    (currentIndex == index) ? null : Color(0xFF342F3F),
                child: widget.buttonChildBuilder(
                  context,
                  currentIndex == index,
                  index,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
