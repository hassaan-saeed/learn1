import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../assets/assets.dart';

class AppsLoadingWidget extends StatelessWidget {
  const AppsLoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[500]!,
      highlightColor: Colors.grey[100]!,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 20),
            itemCount: 10,
            separatorBuilder: (BuildContext context, int index) =>
                Divider(height: 20, color: AppAssets.colors.grey, thickness: 1),
            itemBuilder: (BuildContext context, int index) {
              return Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      height: 80,
                      width: 80,
                      color: Colors.white24,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Container(
                            height: 40,
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
                            color: Colors.white24,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }
}
