import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:wifipos_web/data/models/login_request_model.dart';
import 'package:wifipos_web/data/models/login_response_model.dart';
import '../../core/constants/variables.dart';
import 'auth_local_datasource.dart';

class AuthRemoteDatasource {
  Future<Either<String, LoginResponseModel>> login(
      LoginRequestModel loginRequest) async {
    final headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      // 'Accept': 'application/json',
      // 'Content-Type': 'application/json',
    };
    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/auth/login/'),
      headers: headers,
      body: loginRequest.toJson(),
    );

    log('Request Login : ${loginRequest.toJson()}');
    log('Response Login : ${response.body}');

    if (response.statusCode == 200 &&
        jsonDecode(response.body)['message'] == 'Login Successfull') {
      final successResponse = LoginResponseModel.fromJson(response.body);
      await AuthLocalDatasource().saveAuthData(successResponse);
      return Right(successResponse);
    } else {
      final errorMessage = jsonDecode(response.body)['message'];
      return Left(errorMessage);
    }
  }
}
