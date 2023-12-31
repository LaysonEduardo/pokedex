import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pokedex_colaboraapp/src/services/http/base/http_base.dart';
import '../../models/app/app_exceptions.dart';
import '../../repository/endpoints.dart';

final class DioServices implements HTTPServices {
  final Dio dio;
  DioServices(this.dio);

  @override
  Future init() async {
    dio.options = BaseOptions(baseUrl: Endpoints.baseURL);
    if (kDebugMode) {
      print("DioServices started!");
    }
  }

  @override
  Future<Response<dynamic>> get(String url) async {
    final Response response = await dio.get(url).then((value) {
      return value;
    });
    if (response.statusCode == 200) {
      return response;
    }
    throw HTTPException();
  }

  @override
  Future<Response> post(String url) async {
    final Response response = await dio.post(
      url,
    );
    if (response.statusCode == 200) {
      return response;
    }
    throw HTTPException();
  }
}
