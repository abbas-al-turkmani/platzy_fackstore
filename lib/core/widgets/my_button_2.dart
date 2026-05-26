import 'package:flutter/material.dart';

class MyButton2 extends StatelessWidget {
  const MyButton2({
    super.key,
    this.text,
    this.icon,
    this.child,
    this.height,
    this.onPressed,
    this.backgroundColor,
  }) : assert(
          child != null || text != null || icon != null,
        );

  final String? text;
  final IconData? icon;
  final Widget? child;
  final double? height;
  final VoidCallback? onPressed;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return SizedBox(
      width: double.infinity,
      height: height ?? 60,
      child: ElevatedButton(
        onPressed: onPressed,
        style: theme.elevatedButtonTheme.style!.copyWith(
          backgroundColor: WidgetStateProperty.resolveWith(
            (states) => backgroundColor,
          ),
        ),
        child: child ??
            (text != null
                ? Text(
                    text ?? '',
                    style:
                        theme.elevatedButtonTheme.style!.textStyle!.resolve({}),
                  )
                : Icon(icon)),
      ),
    );
  }
}
