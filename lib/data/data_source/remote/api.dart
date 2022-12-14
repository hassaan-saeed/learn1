import 'dart:convert';

import 'package:learn1/model/app.dart';
import 'package:learn1/model/app_info.dart';
import 'package:learn1/utils/client_helper.dart';

class AppApi {

  String get appInfo => '/appinfo';
  String get apps => '/apps';

  Future<AppInfoM> getAppInfo(String? appId) async {
    String endpoint = appInfo;
    if(appId!=null){
      endpoint = "$appInfo/$appId";
    }
    AppInfoM data;
    // try {
      ClientHelper dio = ClientHelper();
      var response = await dio.dioInstance.get(endpoint);
      data = AppInfoM.fromJson(jsonDecode(response.toString()));
      print(response);
      // print(data['title']);
    // } catch (e) {
    //   print(e);
    // }
    return data;
  }

  Future<Apps> getApps() async {
    Apps data;
    // try {
    ClientHelper dio = ClientHelper();
    var response = await dio.dioInstance.get(apps);
    data = Apps.fromJson(jsonDecode(response.toString()));
    print(response);
    // print(data['title']);
    // } catch (e) {
    //   print(e);
    // }
    return data;
  }

}