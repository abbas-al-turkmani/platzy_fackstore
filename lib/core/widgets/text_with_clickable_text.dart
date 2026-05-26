import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TextWithClickableText extends StatelessWidget {
  const TextWithClickableText({
    super.key,
    required this.text,
    required this.clickableText,
    required this.onTap,
  });

  final String text;
  final String clickableText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    GestureRecognizer onTapRecognizer = TapGestureRecognizer()..onTap = onTap;

    return RichText(
      text: TextSpan(
        text: text,
        style: theme.primaryTextTheme.bodySmall,
        children: [
          TextSpan(
            text: ' $clickableText',
            recognizer: onTapRecognizer,
            style: theme.primaryTextTheme.bodySmall!.copyWith(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
