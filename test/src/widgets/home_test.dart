import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_deep_dive_test/src/blocs/blocs.dart';
import 'package:flutter_movie_deep_dive_test/src/models/models.dart';
import 'package:flutter_movie_deep_dive_test/src/providers/providers.dart';
import 'package:flutter_movie_deep_dive_test/src/services/services.dart';
import 'package:flutter_movie_deep_dive_test/src/widgets/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:mockito/mockito.dart';

import '../blocs/app_bloc_test.mocks.dart';
import '../common.dart';

class UnknowState extends AppState {}

@GenerateMocks([AppService])
void main() {
  MockAppService serviceMock = MockAppService();
  late MoviesResponse response;
  setUp(() {
    response = MoviesResponse.fromJson(exampleJsonResponse2);
    when(serviceMock.loadMovies()).thenAnswer((_) => Future.value(response));
  });

  group('Display Home', () {
    testWidgets('state: AppLoading', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppProvider(
              httpClient: Client(),
              child: BlocProvider(
                create: (context) => AppBloc(service: serviceMock, initWithState: AppLoading()),
                child: MyHomePage(title: 'Test Widget'),
              ),
            ),
          ),
        ),
      );

      Finder textFinder = find.byType(CircularProgressIndicator);
      expect(textFinder, findsOneWidget);
    });

    testWidgets('state: AppLoaded', (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppProvider(
                httpClient: Client(),
                child: BlocProvider(
                  create: (context) => AppBloc(service: serviceMock, initWithState: AppLoaded(response: response)),
                  child: MyHomePage(title: 'Test Widget'),
                ),
              ),
            ),
          ),
        );

        Finder textFinder = find.byType(MoviesList);
        expect(textFinder, findsOneWidget);
      });
    });

    testWidgets('state: AppError', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppProvider(
              httpClient: Client(),
              child: BlocProvider(
                create: (context) => AppBloc(service: serviceMock, initWithState: AppError()),
                child: MyHomePage(title: 'Test Widget'),
              ),
            ),
          ),
        ),
      );

      Finder textFinder = find.text('Something went wrong!');
      expect(textFinder, findsOneWidget);
    });

    testWidgets('state: unknow', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppProvider(
              httpClient: Client(),
              child: BlocProvider(
                create: (context) => AppBloc(service: serviceMock, initWithState: UnknowState()),
                child: MyHomePage(title: 'Test Widget'),
              ),
            ),
          ),
        ),
      );

      Finder textFinder = find.text('Wait ...');
      expect(textFinder, findsOneWidget);
    });
  });
}
