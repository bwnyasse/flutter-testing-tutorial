import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_movie_deep_dive_test/src/blocs/blocs.dart';
import 'package:flutter_movie_deep_dive_test/src/models/models.dart';
import 'package:flutter_movie_deep_dive_test/src/services/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import '../common.dart';
import 'app_bloc_test.mocks.dart';

const loading = TypeMatcher<AppLoading>();
const error = TypeMatcher<AppError>();
const empty = TypeMatcher<AppEmpty>();

@GenerateMocks([AppService])
main() {
  MockAppService serviceMock = MockAppService();
  AppBloc appBloc = AppBloc(service: serviceMock, initWithState: AppEmpty());
  late MoviesResponse response;

  setUp(() {
    response = MoviesResponse.fromJson(exampleJsonResponse);
  });

  tearDown(() {
    appBloc.close();
  });

  test('App close does not emit new app state', () async {
    appBloc.close();
    //TODO: 1- Must implement and check emitsDone
    throw UnimplementedError();
  });

  test('AppEmpty is initialState', () {
    expect(appBloc.initWithState, empty);
  });
}
