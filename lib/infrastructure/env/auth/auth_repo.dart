import 'dart:io';

import 'package:app/domain/auth/service/auth_service.dart';
import 'package:app/domain/auth/token.dart';
import 'package:app/domain/error/auth_failure.dart';
import 'package:app/infrastructure/env/env.dart';
import 'package:app/main.dart';
import 'package:app/resource/api/end_points.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';


@LazySingleton(as: AuthService)
class AuthRepo implements AuthService {
  @override
  Future<Either<AuthFailure, Token>> login(
      String email, String password) async {
    try {
      final response = await Dio().post(
        "${Env().apiBaseUrl}${EndPoints.login}",
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        return Right(Token.fromJson(response.data));
      } else {
        return Left(AuthFailure.custom(response.data.toString()));
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError ||
          e.error is SocketException) {
        return const Left(AuthFailure.noInternet());
      } else if (e.response?.statusCode == 400) {
        return const Left(AuthFailure.wrongUsernameOrPwd());
      } else {
        return const Left(AuthFailure.serverError());
      }
    }
  }

  @override
  Future<Either<AuthFailure, String>> logout(String refresh) async {
    try {
      final response = await dioClient.dio.post(
        "${Env().apiBaseUrl}${EndPoints.login}",
        data: {
          'refresh_token': refresh,
        },
      );

      if (response.statusCode == 205) {
        return const Right('');
      } else {
        return Left(AuthFailure.custom(response.data.toString()));
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError ||
          e.error is SocketException) {
        return const Left(AuthFailure.noInternet());
      } else {
        return const Left(AuthFailure.serverError());
      }
    }
  }

  @override
  Future<Either<AuthFailure, Token>> refresh(String refresh) async {
    try {
      final response = await Dio().post(
        "${Env().apiBaseUrl}${EndPoints.login}",
        data: {
          'refresh': refresh,
        },
      );

      if (response.statusCode == 200) {
        return Right(Token.fromJson(response.data));
      } else {
        return Left(AuthFailure.custom(response.data.toString()));
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError ||
          e.error is SocketException) {
        return const Left(AuthFailure.noInternet());
      } else {
        return const Left(AuthFailure.serverError());
      }
    }
  }

  @override
  Future<Either<AuthFailure, String>> deleteAccount(
      String password, String feedback) async {
    try {
      final response = await dioClient.dio.post(
        "${Env().apiBaseUrl}${EndPoints.login}",
        data: {
          'password': password,
          'refresh_token': pref.token.value.refreshToken,
        },
      );

      if (response.statusCode == 200) {
        return Right(response.data.toString());
      } else {
        return Left(AuthFailure.custom(response.data.toString()));
      }
    } on DioException catch (e) {
      
      if (e.type == DioExceptionType.connectionError ||
          e.error is SocketException) {
        return const Left(AuthFailure.noInternet());
      } else if (e.response?.statusCode == 400) {
        return Left(AuthFailure.custom(e.response?.data['message']));
      } else {
        return const Left(AuthFailure.serverError());
      }
    }
  }
}
