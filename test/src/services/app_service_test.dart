import 'dart:convert';

import 'package:flutter_movie_deep_dive_test/src/models/models.dart';
import 'package:flutter_movie_deep_dive_test/src/services/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

import '../common.dart';

main() {
  test('loadMovies', () async {
    // RESOLVE 1- Must implement app_service#loadMovies
    final mockClient = MockClient((request) async {
      return Response(json.encode(exampleJsonResponse), 200);
    });
    final service = AppService(mockClient);
    final expectedResponse = MoviesResponse.fromJson(exampleJsonResponse);
    final actualResponse = await service.loadMovies();
    expect(actualResponse, equals(expectedResponse));
  });
}
