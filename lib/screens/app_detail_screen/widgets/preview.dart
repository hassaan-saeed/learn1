import 'package:flutter/material.dart';
import 'package:learn1/assets/assets.dart';
import 'package:learn1/extensions/context_extension.dart';
import 'package:learn1/screens/app_detail_screen/widgets/preview_image.dart';

class Preview extends StatelessWidget {
  Preview({
    Key? key, required this.images,
  }) : super(key: key);

  final List? images;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                itemCount: images?.length,
                itemBuilder: (BuildContext context, int index) {
                  return PreviewImage(image: images![index]);
                }),
          )
        ],
      ),
    );
  }
}
