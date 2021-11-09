import 'package:flutter/material.dart';
import 'package:flutter_movie_deep_dive_test/src/models/models.dart';
import 'package:flutter_movie_deep_dive_test/src/widgets/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../common.dart';

void main() {
  MoviesResponse exampleResponse;
  late Movie movie;

  setUp(() {
    exampleResponse = MoviesResponse.fromJson(exampleJsonResponse);
    movie = exampleResponse.movies.first;
  });

  testWidgets('Display Movie Card', (WidgetTester tester) async {
    mockNetworkImagesFor(() async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MovieCard(
              key: Key("${movie.id}"),
              data: movie,
            ),
          ),
        ),
      );

      final movieFinder = find.byType(MovieCard);
      expect(movieFinder, findsOneWidget);

      Finder textFinder = find.text(movie.title ?? "");
      expect(textFinder, findsOneWidget);

      textFinder = find.text(movie.overview ?? "");
      expect(textFinder, findsOneWidget);

      textFinder = find.text(movie.releaseDate ?? "");
      expect(textFinder, findsOneWidget);
    });
  });
}
