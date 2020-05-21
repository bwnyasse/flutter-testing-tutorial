import 'package:flutter_movie_deep_dive_test/src/models/models.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('movie.posterPathResolved', () {
    test('posterPath is null', () {
      Movie m = Movie();
      expect(m.posterPathResolved, equals('https://via.placeholder.com/300'));
    });

    test('posterPath is valid', () {
      Movie m = Movie(posterPath: 'some-value');
      expect(m.posterPathResolved,
          equals('http://image.tmdb.org/t/p/w185/some-value'));
    });
  });
}