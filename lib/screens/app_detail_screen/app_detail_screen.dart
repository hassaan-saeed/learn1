import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:learn1/assets/assets.dart';
import 'package:learn1/screens/app_detail_screen/widgets/app_info.dart';
import 'package:learn1/screens/app_detail_screen/widgets/head_info.dart';
import 'package:learn1/screens/app_detail_screen/widgets/highlights.dart';
import 'package:learn1/screens/app_detail_screen/widgets/preview.dart';
import 'package:learn1/screens/app_detail_screen/widgets/updates.dart';
import 'package:learn1/screens/settings_screen/settings_screen.dart';

import '../loading_screens/app_details_loading_screen.dart';
import 'bloc/app_details_bloc.dart';

class AppDetailsScreen extends StatefulWidget {
  static String routeName = "/app-details/:appId";

  static String getRouteName({String appId = ":appId"}) =>
      "/app-details/$appId";

  const AppDetailsScreen({Key? key, this.appId}) : super(key: key);

  final String? appId;

  @override
  State<AppDetailsScreen> createState() => _AppDetailsScreenState();
}

class _AppDetailsScreenState extends State<AppDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppDetailsBloc(RepositoryProvider.of(context))
        ..add(LoadAppApiEvent(appId: widget.appId!)),
      child: Scaffold(
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
                  context
                      .push(SettingsScreen.getRouteName(appname: "LinkedIn"));
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
        body: BlocBuilder<AppDetailsBloc, AppDetailsState>(
          builder: (context, state) {
            if (state is AppDetailsLoadingState) {
              return AppDetailsLoading();
            } else if (state is AppDetailsLoadedState) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Image.network(
                      state.app.backgroundImageUrl,
                      height: 180,
                      fit: BoxFit.fitHeight,
                    ),
                    HeadInfo(
                        appName: state.app.title,
                        subtitle: state.app.subtitle,
                        logoImageUrl: state.app.logoImageUrl),
                    Highlights(
                      ratings: state.app.ratings,
                      age: state.app.age,
                      chart: state.app.chart,
                      developer: state.app.developer,
                      size: state.app.size,
                      language: state.app.language,
                    ),
                    Updates(
                      version: state.app.update.version,
                      time: state.app.update.time,
                      body: state.app.update.body,
                    ),
                    Preview(
                      images: state.app.previewImages,
                    ),
                    const AppInfo()
                  ],
                ),
              );
            } else {
              return ErrorWidget("Something went wrong.");
            }
          },
        ),
      ),
    );
  }
}
