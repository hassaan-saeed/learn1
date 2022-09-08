import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learn1/assets/assets.dart';
import 'package:learn1/extensions/context_extension.dart';
import 'package:learn1/screens/version_history_screen/version_history_screen.dart';


class Updates extends StatelessWidget {

  final String? version;
  final String? time;
  final String? body;

  const Updates({
    Key? key, required this.version, required this.time, required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              GestureDetector(
                onTap: () {
                  context.push(VersionHistoryScreen.routeName);
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => const VersionHistory()));
                },
                child: Text(
                  context.locale.versionHistory,
                  style: AppAssets.fontStyles.versionHistory,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                version!,
                style: AppAssets.fontStyles.bodyGrey,
              ),
              Text(
                time!,
                style: AppAssets.fontStyles.bodyGrey,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            body!,
            style: AppAssets.fontStyles.bodyWhite,
          ),
          Divider(height: 20, color: AppAssets.colors.grey, thickness: 1)
        ],
      ),
    );
  }
}
