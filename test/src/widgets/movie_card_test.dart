import 'package:flutter/material.dart';
import 'package:flutter_movie_deep_dive_test/src/models/models.dart';
import 'package:flutter_movie_deep_dive_test/src/widgets/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_test_utils/image_test_utils.dart';

import '../common.dart';

void main() {
  MoviesResponse exampleResponse;
  Movie movie;

  setUp(() {
    exampleResponse = MoviesResponse.fromJson(exampleJsonResponse);
    movie = exampleResponse.movies.first;
  });

  testWidgets('Display Movie Card', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: MovieCard(
            //TODO 1- Initialize the key with the movie.id
            data: movie,
          ),
        ),
      ),
    );

    //TODO: 2- Find objects to match
    throw UnimplementedError();
  });
}