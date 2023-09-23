import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../utils/error_response.dart';
import '../models/user_model.dart';
import '../providers/users_provider.dart';

class UsersRepository {
  final UsersProvider provider;

  UsersRepository(this.provider);

  Future<Either<ErrorResponse, UserModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await provider.login(email: email, password: password);

      if (response.data != null) {
        if (!response.data.containsKey('errors')) {
          return right(UserModel.fromJson(response.data['data']['login']));
        } else {
          return left(
            ErrorResponse(
              statusCode: 401,
              error: response.data['errors'][0]['message'],
              stackTrace: response.data['errors'][0]['extensions']
                  ['stacktrace'],
            ),
          );
        }
      } else {
        return left(
          ErrorResponse(
            error: 'Não foi possível efetuar o login, contate o suporte.',
            statusCode: 401,
          ),
        );
      }
    } catch (e, s) {
      _printErrorDebugInfo(e, s, 'login');

      return left(
        ErrorResponse(
          error: 'Não foi possível efetuar o login, contate o suporte.',
          statusCode: 500,
        ),
      );
    }
  }

  Future<Either<ErrorResponse, bool>> isEmailAlreadyInUse({
    required String email,
  }) async {
    try {
      final response = await provider.isEmailAlreadyInUse(email: email);
      final data = response.data;

      if (data == null) {
        return left(
          ErrorResponse(
            statusCode: 400,
            error: 'Não foi possível procurar o email, contate o suporte.',
          ),
        );
      }

      if (data.containsKey('errors')) {
        final errorData = data['errors'][0];

        return left(
          ErrorResponse(
            statusCode: 401,
            error: errorData['message'],
            stackTrace: errorData['extensions']['stacktrace'],
          ),
        );
      }

      final isEmailAlreadyInUse = data['data']['isEmailAlreadyInUse'];

      if (isEmailAlreadyInUse != true) {
        return left(
          ErrorResponse(
            statusCode: 401,
            error: 'Email não encontrado :(',
          ),
        );
      }

      return right(isEmailAlreadyInUse);
    } catch (e, s) {
      _printErrorDebugInfo(e, s, 'checkIfEmailExist');

      return left(
        ErrorResponse(
          error: 'Ocorreu um erro desconhecido, contate o suporte.',
          statusCode: 500,
        ),
      );
    }
  }

  Future<Either<ErrorResponse, bool?>> setNewPassword({
    required String password,
    required String birthDate,
    required String email,
  }) async {
    try {
      final response = await provider.setNewPassword(
        password: password,
        birthDate: birthDate,
        email: email,
      );

      final data = response.data;

      // print('UserRepository setNewPassword data ==> $data');

      if (data == null) {
        return left(
          ErrorResponse(
            statusCode: 400,
            error: 'Não foi possível alterar a senha, contate o suporte.',
          ),
        );
      }

      if (data.containsKey('errors')) {
        final errorData = data['errors'][0];

        return left(
          ErrorResponse(
            statusCode: 401,
            error: errorData['message'],
            stackTrace: errorData['extensions']['stacktrace'],
          ),
        );
      }

      final successSetNewPassword = data['data']['changeStudentPassword'];

      if (successSetNewPassword != true) {
        return left(
          ErrorResponse(
            statusCode: 400,
            error: 'Não foi possível alterar a senha :(',
          ),
        );
      }

      return right(successSetNewPassword);
    } catch (e, s) {
      _printErrorDebugInfo(e, s, '_handleResponseSetNewPassword');

      return left(
        ErrorResponse(
          error: 'Ocorreu um erro desconhecido, contate o suporte.',
          statusCode: 500,
        ),
      );
    }
  }

  Future<Either<ErrorResponse, String?>> getUserIdByEmailAndBirthdayDate({
    required String email,
    required birthDate,
  }) async {
    try {
      final response = await provider.getUserIdByEmailAndBirthdayDate(
        email: email,
        birthDate: birthDate,
      );

      final data = response.data;

      if (data == null) {
        return left(
          ErrorResponse(
            statusCode: 400,
            error: 'Não foi possível procurar o usuário, contate o suporte.',
          ),
        );
      }

      if (data.containsKey('errors')) {
        final errorData = data['errors'][0];

        return left(
          ErrorResponse(
            statusCode: 401,
            error: errorData['message'],
            stackTrace: errorData['extensions']['stacktrace'],
          ),
        );
      }

      final userId = data['data']['getUserIdByEmailAndBirthdayDate'];

      if (userId == null) {
        return left(
          ErrorResponse(statusCode: 404, error: 'Usuário não encontrado :('),
        );
      }

      return right(userId);
    } catch (e, s) {
      _printErrorDebugInfo(e, s, 'getUserIdByEmailAndBirthdayDate');

      return left(
        ErrorResponse(
          error: 'Ocorreu um erro desconhecido, contate o suporte.',
          statusCode: 500,
        ),
      );
    }
  }

  void _printErrorDebugInfo(error, StackTrace stackTrace, String name) {
    if (kDebugMode) {
      print('UsersRepository $name error ==> ${error.toString()}');
      print('UsersRepository $name stack ==> ${stackTrace.toString()}');
    }
  }
}
