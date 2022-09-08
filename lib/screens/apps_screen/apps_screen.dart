import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learn1/assets/assets.dart';
import 'package:learn1/data/data_source/remote/api.dart';
import 'package:learn1/model/app.dart';
import 'package:learn1/screens/app_detail_screen/app_detail_screen.dart';

class AppsScreen extends StatefulWidget {
  static String routeName = "/";

  const AppsScreen({Key? key}) : super(key: key);

  @override
  State<AppsScreen> createState() => _AppsScreenState();
}

class _AppsScreenState extends State<AppsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Apps"),
        backgroundColor: AppAssets.colors.blue,
      ),
      backgroundColor: AppAssets.colors.background,
      body: FutureBuilder(
        future: AppApi().getApps(),
        builder: (BuildContext context, AsyncSnapshot<Apps> snapshot) {
          if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  itemCount: snapshot.data!.apps.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(
                          height: 20,
                          color: AppAssets.colors.grey,
                          thickness: 1),
                  itemBuilder: (BuildContext context, int index) {
                    return AppTile(
                      app: snapshot.data!.apps[index],
                    );
                  }),
            );
          }
        },
      ),
    );
  }
}

class AppTile extends StatelessWidget {
  final App app;

  const AppTile({
    Key? key,
    required this.app,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        context.push(AppDetailsScreen.routeName);
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              app.logoImageUrl,
              height: 80,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  app.title,
                  style: AppAssets.fontStyles.appTitle,
                  softWrap: true,
                ),
                Text(
                  app.subtitle,
                  style: AppAssets.fontStyles.subTitle,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
