import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:learn1/assets/assets.dart';
import 'package:learn1/extensions/context_extension.dart';

class VersionHistoryScreen extends StatefulWidget {

  static String routeName = "/version-history";

  const VersionHistoryScreen({Key? key}) : super(key: key);

  @override
  State<VersionHistoryScreen> createState() => _VersionHistoryScreenState();
}

class _VersionHistoryScreenState extends State<VersionHistoryScreen> {
  List<History> history = [
    History("9.1.283", "1w ago",
        "When you're in a conversation, speed and stability matter. The LinkedIn app is now more reliable than ever. This update contains bug fixes."),
    History("9.1.282", "2w ago",
        "When you're in a conversation, speed and stability matter. The LinkedIn app is now more reliable than ever. This update contains bug fixes."),
    History("9.1.281", "3w ago",
        "When you're in a conversation, speed and stability matter. The LinkedIn app is now more reliable than ever. This update contains bug fixes."),
    History("9.1.280", "1mo ago",
        "When you're in a conversation, speed and stability matter. The LinkedIn app is now more reliable than ever. This update contains bug fixes."),
    History("9.1.279", "1mo ago",
        "When you're in a conversation, speed and stability matter. The LinkedIn app is now more reliable than ever. This update contains bug fixes."),
    History("9.1.278", "1mo ago",
        "When you're in a conversation, speed and stability matter. The LinkedIn app is now more reliable than ever. This update contains bug fixes."),
    History("9.1.277", "1mo ago",
        "When you're in a conversation, speed and stability matter. The LinkedIn app is now more reliable than ever. This update contains bug fixes."),
    History("9.1.276", "1mo ago",
        "When you're in a conversation, speed and stability matter. The LinkedIn app is now more reliable than ever. This update contains bug fixes."),
    History("9.1.275", "2mo ago",
        "When you're in a conversation, speed and stability matter. The LinkedIn app is now more reliable than ever. This update contains bug fixes."),
    History("9.1.274", "2mo ago",
        "When you're in a conversation, speed and stability matter. The LinkedIn app is now more reliable than ever. This update contains bug fixes."),
    History("9.1.273", "2mo ago",
        "When you're in a conversation, speed and stability matter. The LinkedIn app is now more reliable than ever. This update contains bug fixes."),
    History("9.1.272", "2mo ago",
        "When you're in a conversation, speed and stability matter. The LinkedIn app is now more reliable than ever. This update contains bug fixes.")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppAssets.colors.blue,),
      backgroundColor: AppAssets.colors.background,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.locale.versionHistory,
              style: AppAssets.fontStyles.versionHeading,
            ),
            const SizedBox(height: 6,),
            Expanded(
              child: ListView.separated(
                  itemCount: history.length,
                  separatorBuilder: (BuildContext context, int index) => Divider(
                      height: 20, color: AppAssets.colors.grey, thickness: 1),
                  itemBuilder: (BuildContext context, int index) {
                    return VersionDetails(details: history[index]);
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class VersionDetails extends StatelessWidget {
  const VersionDetails({
    Key? key,
    required this.details,
  }) : super(key: key);

  final History details;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              details.version,
              style: AppAssets.fontStyles.bodyWhite,
            ),
            Text(
              details.timePassed,
              style: AppAssets.fontStyles.bodyGrey,
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          details.body,
          style: AppAssets.fontStyles.bodyWhite,
        ),
      ],
    );
  }
}

class History {
  final String version;
  final String timePassed;
  final String body;

  History(this.version, this.timePassed, this.body);
}
