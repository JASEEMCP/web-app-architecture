import 'dart:io';

import 'package:app/domain/auth/service/forgot_pwd_service.dart';
import 'package:app/domain/error/auth_failure.dart';
import 'package:app/infrastructure/env/env.dart';
import 'package:app/main.dart';
import 'package:app/resource/api/end_points.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';


@LazySingleton(as: ForgotPwdService)
class ForgotPwdRepo implements ForgotPwdService {
  @override
  Future<Either<AuthFailure, String>> forgotPwd(String email) async {
    try {
      final response = await Dio().post(
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
      } else if (e.response?.statusCode == 404) {
        return const Left(AuthFailure.phoneDoesNotExist());
      } else {
        return const Left(AuthFailure.serverError());
      }
    }
  }

  @override
  Future<Either<AuthFailure, String>> resetPassword(
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
        return Right(response.data.toString());
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
  Future<Either<AuthFailure, String>> verifyOtp(
      String email, String otp) async {
    try {
      final response = await Dio().post(
        "${Env().apiBaseUrl}${EndPoints.login}",
        data: {
          'email': email,
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

  @override
  Future<Either<AuthFailure, String>> changePassword(
      String oldPassword, String newPassword) async {
    try {
      final response = await dioClient.dio.post(
        "${Env().apiBaseUrl}${EndPoints.login}",
        data: {
          'old_password': oldPassword,
          'new_password': newPassword,
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
        return Left(AuthFailure.custom(
            e.response?.data['message'].toString() ?? 'Something went wrong!'));
      } else {
        return const Left(AuthFailure.serverError());
      }
    }
  }
}
