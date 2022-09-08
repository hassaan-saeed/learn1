import 'package:flutter/material.dart';
import 'package:learn1/assets/assets.dart';

class RowDivider extends StatelessWidget {
  const RowDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: VerticalDivider(width: 40, color:  AppAssets.colors.grey, thickness: 1),
    );
  }
}