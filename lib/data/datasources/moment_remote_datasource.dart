import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../core/constants/api_constants.dart';

class MomentRemoteDataSource {
  final Dio dio;

  MomentRemoteDataSource(this.dio);

  Future<List<dynamic>> fetchMoments() async {
    final response = await dio.get("${baseUrl}tweets.json");
    debugPrint(response.data.toString());
    return response.data;
  }
}
