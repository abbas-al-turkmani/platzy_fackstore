import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:platzy_fackstore/core/widgets/my_container.dart';

class MyDropdownButton<T> extends StatefulWidget {
  const MyDropdownButton({
    super.key,
    required this.items,
    required this.onChanged,
    this.buildMenuItem,
    this.width,
  });

  final List<T> items;
  final double? width;
  final void Function(T?) onChanged;
  final DropdownMenuItem<T> Function(dynamic item)? buildMenuItem;

  @override
  State<MyDropdownButton<T>> createState() => _MyDropdownButtonState<T>();
}

class _MyDropdownButtonState<T> extends State<MyDropdownButton<T>> {
  late T? _dropdownValue;
  late List<DropdownMenuItem<T>> _items;

  @override
  void initState() {
    _dropdownValue = widget.items[0];
    _items = widget.items.map(widget.buildMenuItem ?? _buildMenuItem).toList();
    super.initState();
  }

  DropdownMenuItem<T> _buildMenuItem(dynamic item) => DropdownMenuItem(
      value: item,
      enabled: true,
      child: Text(
        item.toString(),
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ));

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      width: widget.width,
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          value: _dropdownValue,
          items: _items,
          onChanged: (T? value) {
            setState(() {
              widget.onChanged(value);
              _dropdownValue = value;
            });
          },
          isExpanded: true,
          iconSize: 32,
          icon: Icon(
            IconsaxPlusBroken.arrow_down_2,
            color: Colors.white,
          ),
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
