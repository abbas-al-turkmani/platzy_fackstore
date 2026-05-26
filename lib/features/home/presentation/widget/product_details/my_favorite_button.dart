import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class MyFavoriteButton extends StatefulWidget {
  const MyFavoriteButton({
    super.key,
    required this.onPressed,
    required this.isFavorite,
  });

  final Future<bool> Function(bool value) onPressed;
  final bool isFavorite;

  @override
  State<MyFavoriteButton> createState() => _MyFavoriteButtonState();
}

class _MyFavoriteButtonState extends State<MyFavoriteButton> {
  late bool _isFavorite;

  @override
  void initState() {
    super.initState();
    _isFavorite = false;
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      child: IconButtonTheme(
        data: Theme.of(context).iconButtonTheme,
        child: IconButton(
          onPressed: () async {
            setState(() {
              _isFavorite = !_isFavorite;
            });
            _isFavorite = await widget.onPressed(_isFavorite);
            setState(() {});
          },
          color: Colors.white,
          iconSize: 12,
          icon: Icon(
            _isFavorite ? Iconsax.heart5 : IconsaxPlusBroken.heart,
            color: _isFavorite ? Colors.red : Colors.white,
          ),
        ),
      ),
    );
  }
}
