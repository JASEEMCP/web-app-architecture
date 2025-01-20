import 'dart:io';

import 'package:app/domain/auth/service/signup_service.dart';
import 'package:app/domain/auth/token.dart';
import 'package:app/domain/error/auth_failure.dart';
import 'package:app/infrastructure/env/env.dart';
import 'package:app/resource/api/dio_cookie_manager.dart';
import 'package:app/resource/api/end_points.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';


@LazySingleton(as: SignupService)
class SignupRepo implements SignupService {
  final DioCookieManger _dio = DioCookieManger();
  @override
  Future<Either<AuthFailure, Token>> createProfile(
      String username, String password, String phone) async {
    try {
      final response = await _dio.dio.post(
        "${Env().apiBaseUrl}${EndPoints.login}",
        data: {
          'phone_number': phone,
          'user_type': 'Customer',
          'name': username,
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
        return const Left(AuthFailure.custom('Username already taken'));
      } else {
        return const Left(AuthFailure.serverError());
      }
    }
  }

  @override
  Future<Either<AuthFailure, String>> signup(String email) async {
    try {
      final response = await _dio.dio.post(
        "${Env().apiBaseUrl}${EndPoints.login}",
        data: {
          'email': email,
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
        return const Left(AuthFailure.userAlreadyExist());
      } else {
        return const Left(AuthFailure.serverError());
      }
    }
  }

  @override
  Future<Either<AuthFailure, String>> verifyOtp(String otp) async {
    try {
      final response = await _dio.dio.post(
        "${Env().apiBaseUrl}${EndPoints.login}",
        data: {
          'otp': otp,
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
        return const Left(AuthFailure.invalidOtp());
      } else {
        return const Left(AuthFailure.serverError());
      }
    }
  }
}
