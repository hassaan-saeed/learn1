import 'package:flutter/material.dart';
import 'package:learn1/assets/assets.dart';
import 'package:learn1/model/app_info.dart';

import '../../app_detail_screen/widgets/row_divider.dart';
import 'highlight_details.dart';

class Highlights extends StatelessWidget {

  final dynamic ratings;
  final String? age;
  final String? chart;
  final String? developer;
  final String? language;
  final String? size;

  Highlights({
    Key? key, required this.ratings, required this.age, required this.chart, required this.developer, required this.language, required this.size,
  }) : super(key: key);

  final Icon personIcon = Icon(Icons.person,size: 26,color: AppAssets.colors.grey,);
  final Row stars = Row(
    children: [
      Icon(Icons.star,color: AppAssets.colors.grey,size: 18,),
      Icon(Icons.star,color: AppAssets.colors.grey,size: 18,),
      Icon(Icons.star,color: AppAssets.colors.grey,size: 18,),
      Icon(Icons.star,color: AppAssets.colors.grey,size: 18,),
      Icon(Icons.star_border,color: AppAssets.colors.grey,size: 18,)
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Divider(height: 20, color: AppAssets.colors.grey, thickness: 1),
          IntrinsicHeight(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  HighlightsDetails(title: "${ratings?.count} RATINGS", value: ratings?.value, sub: stars),
                  const RowDivider(),
                  HighlightsDetails(title: "AGE", value: age, sub: "Years Old"),
                  const RowDivider(),
                  HighlightsDetails(title: "CHART", value: chart, sub: "Business"),
                  const RowDivider(),
                  HighlightsDetails(title: "DEVELOPER", value: personIcon, sub: developer),
                  const RowDivider(),
                  HighlightsDetails(title: "LANGUAGE", value: language, sub: "+ 24 More"),
                  const RowDivider(),
                  HighlightsDetails(title: "SIZE", value: size, sub: "MB"),
                ],
              ),
            ),
          ),
          Divider(height: 20, color: AppAssets.colors.grey, thickness: 1),
        ],
      ),
    );
  }
}
