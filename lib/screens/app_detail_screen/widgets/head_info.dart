import 'package:flutter/material.dart';
import 'package:learn1/assets/assets.dart';
import 'package:learn1/extensions/context_extension.dart';


class HeadInfo extends StatelessWidget {

  final String appName;
  final String subtitle;
  final String logoImageUrl;

  const HeadInfo({
    Key? key, required this.appName, required this.subtitle, required this.logoImageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Image.network(
            logoImageUrl,
            height: 120,
          ),
          const SizedBox(width: 20,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  appName,
                  style: AppAssets.fontStyles.appTitle,
                  softWrap: true,
                ),
                Text(
                  subtitle,
                  style: AppAssets.fontStyles.subTitle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () => {},
                      child: Text(
                        context.locale.getButton,
                        style: AppAssets.fontStyles.getButton,
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppAssets.colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          minimumSize: const Size(10, 28)),
                    ),
                    IconButton(
                        onPressed: () => {},
                        icon: Icon(
                          Icons.file_upload_outlined,
                          color: AppAssets.colors.blue,
                          size: 28,
                        ))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}