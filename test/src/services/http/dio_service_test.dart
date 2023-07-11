import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:pokedex_colaboraapp/src/repository/endpoints.dart';
import 'package:pokedex_colaboraapp/src/services/http/dio_service.dart';

void main() async {
  final dio = Dio();
  final dioAdapter = DioAdapter(dio: dio);
  final services = DioServices(dio);
  const path = 'https://example.com';

  setUp(() {
    dio.httpClientAdapter = dioAdapter;
  });

  group('Dio Services', () {
    dioAdapter.onGet(
      path,
      (request) => request.reply(200, {'message': 'Success!'}),
    );

    dioAdapter.onPost(
      path,
      (request) => request.reply(200, {'message': 'Success!'}),
    );

    test('init method', () async {
      await services.init();
      expect(services.dio.options.baseUrl, Endpoints.baseURL);
      debugPrint('init test passed');
    });

    test('get method', () async {
      final Response response = await services.get(path);
      debugPrint(response.statusCode.toString());
      expect(response.statusCode, 200);
      debugPrint('get test passed');
    });

    test('post method', () async {
      final Response response = await services.post(path);
      debugPrint(response.statusCode.toString());
      expect(response.statusCode, 200);
      debugPrint('post test passed');
    });
  });
}
