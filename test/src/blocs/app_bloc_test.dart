import 'package:flutter_movie_deep_dive_test/src/blocs/blocs.dart';
import 'package:flutter_movie_deep_dive_test/src/models/models.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../common.dart';

main() {
  AppServiceMock serviceMock;
  AppBloc appBloc;
  MoviesResponse response;

  setUp(() {
    serviceMock = AppServiceMock();
    appBloc = AppBloc(service: serviceMock);
    response = MoviesResponse.fromJson(exampleJsonResponse);
  });

  tearDown(() {
    appBloc?.close();
  });

  test('close does not emit new app state', () {
    appBloc.close();

    //TODO: 1- Must implement and check emitsDone
    throw UnimplementedError();
  });

  group('AppState', () {
    test('AppEmpty : initialState', () {
      expect(appBloc.initialState, AppEmpty());
    });
  });
}