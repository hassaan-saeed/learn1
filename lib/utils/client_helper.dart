import 'package:dio/dio.dart';

class ClientHelper{
  static final ClientHelper _instance = ClientHelper._internal();
  late final Dio dioInstance ;

  factory ClientHelper() {
    return _instance;
  }

  ClientHelper._internal() {
    dioInstance = getClient();
    print("new helper");
  }

  getClient(){
    // or new Dio with a BaseOptions instance.
    var options = BaseOptions(
      baseUrl: 'https://41c08c87-beaf-4869-9dd7-5faf68036270.mock.pstmn.io',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
    final dio = Dio(options);
    return dio;
  }

}