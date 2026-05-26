import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:platzy_fackstore/core/widgets/my_container.dart';
import 'package:platzy_fackstore/core/widgets/my_radio_buttons.dart';

class ProductSizeSelector extends StatefulWidget {
  const ProductSizeSelector({
    super.key,
  });

  @override
  State<ProductSizeSelector> createState() => _ProductSizeSelectorState();
}

class _ProductSizeSelectorState extends State<ProductSizeSelector> {
  late String _currentValue;
  late List<String> _values;

  @override
  void initState() {
    _values = ['S', 'L', 'XL'];
    _currentValue = _values[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return MyContainer(
      child: InkWell(
        onTap: () => showBottomSheet(
          context: context,
          enableDrag: true,
          builder: (context) {
            return Container(
              height: 250.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.horizontal(
                  start: Radius.circular(100.r),
                ),
              ),
              padding: EdgeInsets.all(24.w),
              width: double.infinity,
              child: MyRadioButtonSet<String>(
                values: _values,
                buttonHeight: 50,
                buttonChildBuilder: (context, isSelected, index) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _values[index],
                      style: theme.elevatedButtonTheme.style!.textStyle!
                          .resolve({}),
                    ),
                    isSelected ? Icon(IconsaxPlusBroken.check) : SizedBox()
                  ],
                ) as Widget,
                scrollDirection: Axis.vertical,
                onSelectionChanged: (index) {},
              ),
            );
          },
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Size',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Row(
              spacing: 12.w,
              children: [
                Text(
                  _currentValue,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Icon(
                  IconsaxPlusBroken.arrow_down_2,
                  color: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
