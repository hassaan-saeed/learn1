import 'package:flutter/material.dart';
import 'package:learn1/extensions/context_extension.dart';
import 'package:shimmer/shimmer.dart';

import '../../assets/assets.dart';

class AppDetailsLoading extends StatelessWidget {
  const AppDetailsLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[500]!,
      highlightColor: Colors.grey[100]!,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180,
              width: double.infinity,
              color: Colors.white24,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 120,
                      width: 120,
                      color: Colors.white24,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          height: 40,
                          width: 200,
                          color: Colors.white24,
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          height: 26,
                          width: 150,
                          color: Colors.white24,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Divider(height: 20, color: AppAssets.colors.grey, thickness: 1),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        LoadingHighlightDetails(),
                        VerticalDivider(
                            width: 22,
                            color: AppAssets.colors.grey,
                            thickness: 1),
                        LoadingHighlightDetails(),
                        VerticalDivider(
                            width: 22,
                            color: AppAssets.colors.grey,
                            thickness: 1),
                        LoadingHighlightDetails(),
                        VerticalDivider(
                            width: 22,
                            color: AppAssets.colors.grey,
                            thickness: 1),
                        LoadingHighlightDetails(),
                        VerticalDivider(
                            width: 22,
                            color: AppAssets.colors.grey,
                            thickness: 1),
                        LoadingHighlightDetails(),
                        VerticalDivider(
                            width: 22,
                            color: AppAssets.colors.grey,
                            thickness: 1),
                        LoadingHighlightDetails(),
                      ],
                    ),
                  ),
                  Divider(height: 20, color: AppAssets.colors.grey, thickness: 1),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        context.locale.whatsNew,
                        style: AppAssets.fontStyles.headingSection,
                      ),
                      Text(
                        context.locale.versionHistory,
                        style: AppAssets.fontStyles.versionHistory,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Container(
                          height: 20,
                          width: 60,
                          color: Colors.white24,
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Container(
                          height: 26,
                          width: 60,
                          color: Colors.white24,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: 12.0,
                        color: Colors.white24,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.0),
                      ),
                      Container(
                        width: double.infinity,
                        height: 12.0,
                        color: Colors.white24,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.0),
                      ),
                      Container(
                        width: 40.0,
                        height: 12.0,
                        color: Colors.white24,
                      ),
                    ],
                  ),
                  Divider(height: 20, color: AppAssets.colors.grey, thickness: 1),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                context.locale.preview,
                style: AppAssets.fontStyles.headingSection,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 520,
              child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: ClipRRect(
                        child: Container(
                          height: 500,
                          width: 200,
                          color: Colors.white24,
                        ),
                        borderRadius: BorderRadius.circular(24),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}


class LoadingHighlightDetails extends StatelessWidget {
  const LoadingHighlightDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Container(
            height: 16,
            width: 60,
            color: Colors.white24,
          ),
        ),
        SizedBox(
          height: 4,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Container(
            height: 30,
            width: 30,
            color: Colors.white24,
          ),
        ),
        SizedBox(
          height: 4,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Container(
            height: 16,
            width: 80,
            color: Colors.white24,
          ),
        ),
      ],
    );
  }
}
