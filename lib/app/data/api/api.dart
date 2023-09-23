import 'package:dio/dio.dart';
import '../local_storage/local_storage.dart';

class API {
  static Dio get loginRequest {
    final options = BaseOptions(
      baseUrl: 'https://ecs-api-stage.jovensgenios.com/graphql',
      headers: {'Content-Type': 'application/json'},
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 15),
    );

    return Dio(options);
  }

  static Dio get request {
    final token = LocalStorage.getData(key: 'userToken');

    final options = BaseOptions(
      baseUrl: 'https://ecs-api-stage.jovensgenios.com',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': token.toString(),
      },
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 15),
    );

    return Dio(options);
  }
}
