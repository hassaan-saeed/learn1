import 'package:flutter/material.dart';
import 'package:learn1/assets/assets.dart';

class PreviewImage extends StatelessWidget {
  const PreviewImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: ClipRRect(
        child: Image.network(
          image,
          height: 500,
        ),
        borderRadius: BorderRadius.circular(24),
      ),
    );
  }
}