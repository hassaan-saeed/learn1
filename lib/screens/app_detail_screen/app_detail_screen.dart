
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learn1/assets/assets.dart';
import 'package:learn1/data/data_source/remote/api.dart';
import 'package:learn1/model/app_info.dart';
import 'package:learn1/screens/app_detail_screen/widgets/app_info.dart';
import 'package:learn1/screens/app_detail_screen/widgets/head_info.dart';
import 'package:learn1/screens/app_detail_screen/widgets/highlights.dart';
import 'package:learn1/screens/app_detail_screen/widgets/preview.dart';
import 'package:learn1/screens/app_detail_screen/widgets/updates.dart';
import 'package:learn1/screens/settings_screen/settings_screen.dart';


class AppDetailsScreen extends StatefulWidget {
  static String routeName = "/app-details/:appId";

  static String getRouteName({String appId=":appId"})=> "/app-details/$appId";

  const AppDetailsScreen({Key? key, this.appId}) : super(key: key);

  final String? appId;

  @override
  State<AppDetailsScreen> createState() => _AppDetailsScreenState();
}

class _AppDetailsScreenState extends State<AppDetailsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppAssets.colors.blue,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: IconButton(
              icon: const Icon(
                Icons.settings,
                size: 30,
              ),
              onPressed: () async {
                context.push(SettingsScreen.getRouteName(appname: "LinkedIn"));
                // context.push("/settings/kkkkkk");
                // Navigator.push(context,
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => const Settings()));
              },
            ),
          )
        ],
      ),
      backgroundColor: AppAssets.colors.background,
      body:FutureBuilder(
        future: AppApi().getAppInfo(widget.appId),
        builder: (BuildContext context, AsyncSnapshot<AppInfoM> snapshot) {
          if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Image.network(
                    snapshot.data!.backgroundImageUrl,
                    height: 180,
                    fit: BoxFit.fitHeight,
                  ),
                  HeadInfo(
                    appName: snapshot.data!.title,
                    subtitle: snapshot.data!.subtitle,
                    logoImageUrl: snapshot.data!.logoImageUrl
                  ),
                  Highlights(
                    ratings: snapshot.data!.ratings,
                    age: snapshot.data!.age,
                    chart: snapshot.data!.chart,
                    developer: snapshot.data!.developer,
                    size: snapshot.data!.size,
                    language: snapshot.data!.language,
                  ),
                  Updates(
                    version: snapshot.data!.update.version,
                    time: snapshot.data!.update.time,
                    body: snapshot.data!.update.body,
                  ),
                  Preview(images: snapshot.data!.previewImages,),
                  const AppInfo()
                ],
              ),
            );
          }
        },
      ),
    );
  }
}