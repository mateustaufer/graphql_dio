import 'package:dio/dio.dart';
import '../api/api.dart';
import '../api/queries.dart';

class UsersProvider {
  Future<Response> login({
    required String email,
    required String password,
  }) {
    return Future.value(
      API.loginRequest.post(
        '/graphql',
        data: {
          'query': Queries.mutationLogin
              .replaceAll(':email', email)
              .replaceAll(':password', password),
        },
      ),
    );
  }

  Future<Response> isEmailAlreadyInUse({required String email}) {
    return Future.value(
      API.loginRequest.post(
        '/graphql',
        data: {
          'query': Queries.isEmailAlreadyInUse.replaceAll(':email', email)
        },
      ),
    );
  }

  Future<Response> getUserIdByEmailAndBirthdayDate({
    required String email,
    required String birthDate,
  }) {
    return Future.value(
      API.loginRequest.post(
        '/graphql',
        data: {
          'query': Queries.getUserIdByEmailAndBirthdayDate
              .replaceAll(':email', email)
              .replaceAll(':birthday', birthDate)
        },
      ),
    );
  }

  Future<Response> setNewPassword({
    required String password,
    required String birthDate,
    required String email,
  }) {
    // print(
    //   'UsersProvider setNewPassword query ==> ${Queries.mutationSetNewPassword.replaceAll(':password', password).replaceAll(':birthday', birthDate).replaceAll(':email', email)}',
    // );

    return Future.value(
      API.loginRequest.post(
        '/graphql',
        data: {
          'query': Queries.mutationSetNewPassword
              .replaceAll(':password', password)
              .replaceAll(':birthday', birthDate)
              .replaceAll(':email', email)
        },
      ),
    );
  }
}
