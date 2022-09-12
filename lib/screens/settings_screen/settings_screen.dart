import 'package:flutter/material.dart';
import 'package:learn1/assets/assets.dart';
import 'package:learn1/extensions/context_extension.dart';
import 'package:learn1/main.dart';

class SettingsScreen extends StatefulWidget {

  static String routeName = "/settings/:appname";

  String get routeW => "/settings/:";

  static String getRouteName({String appname=":appname"})=> "/settings/$appname";

  const SettingsScreen({Key? key, required this.appName}) : super(key: key);

  final String appName;

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  bool isAvailable = true;

  _changeLang() {
    if(Localizations.localeOf(context).languageCode == 'en'){
      setState(() {
        MyApp.setLocale(context, Locale("ar", ""));
      });
    }
    else{
      setState(() {
        MyApp.setLocale(context, Locale("en", ""));
      });
    }

  }

  _hideButton() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppAssets.colors.background,
      appBar: AppBar(
        backgroundColor: AppAssets.colors.blue,
        title: Text(context.locale.settingsAppbarTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // if(isAvailable)...[Text("true"),Text("true"),Text("true")]else...[Text("false"),Text("false"),Text("false")],
              // if(isAvailable)Text("true"),
              // isAvailable?Text("true"):Text("false"),
              Text(
                widget.appName,
                style: AppAssets.fontStyles.languageButton,
              ),
              ElevatedButton(
                onPressed: () => {
                  _changeLang()
                },
                child: Text(
                  context.locale.changeLanguageButton,
                  style: AppAssets.fontStyles.languageButton,
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppAssets.colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    minimumSize: const Size(20, 50)),
              ),
              ElevatedButton(
                onPressed: () => {
                  _hideButton()
                },
                child: Text(
                  "Hide",
                  style: AppAssets.fontStyles.languageButton,
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppAssets.colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    minimumSize: const Size(20, 50)),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
