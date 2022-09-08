import 'package:flutter/material.dart';
import 'package:learn1/assets/assets.dart';

class HighlightsDetails extends StatelessWidget {
  const HighlightsDetails({Key? key,required this.title,required this.value,required this.sub}) : super(key: key);

  final dynamic title;
  final dynamic value;
  final dynamic sub;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        title.runtimeType == String ?
        Text(
          title,
          style: AppAssets.fontStyles.highlightsTitle,
        )
            :
        title
        ,
        value.runtimeType == String ?
        Text(
          value,
          style: AppAssets.fontStyles.highlightsValue,
        )
            :
        value
        ,
        sub.runtimeType == String ?
        Text(
          sub,
          style: AppAssets.fontStyles.highlightsSub,
        )
            :
        sub
        ,
      ],
    );
  }
}