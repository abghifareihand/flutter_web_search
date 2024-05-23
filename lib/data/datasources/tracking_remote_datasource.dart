import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import '../../core/constants/variables.dart';
import 'package:wifipos_web/data/models/tracking_response_model.dart';

class TrackingRemoteDatasource {
  Future<Either<String, TrackingResponseModel>> getTracking() async {
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    final response = await http.get(
      Uri.parse('${Variables.baseUrl}/hasil/'),
      headers: headers,
    );

    log('Response Tracking : ${response.body}');

    if (response.statusCode == 200) {
      final successResponse = TrackingResponseModel.fromJson(response.body);
      return Right(successResponse);
    } else {
      final errorMessage = jsonDecode(response.body)['message'];
      return Left(errorMessage);
    }
  }
}
