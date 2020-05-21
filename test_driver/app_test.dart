// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Movies App', () {
    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('starts with topRated', () async {
      // Movie 1
      SerializableFinder titleTextFinder1 = find.byValueKey('1-title');
      SerializableFinder overviewTextFinder1 = find.byValueKey('1-overview');
      SerializableFinder releaseTextFinder1 = find.byValueKey('1-releaseDate');

      expect(await driver.getText(titleTextFinder1), 'Fight Club');
      expect(await driver.getText(overviewTextFinder1), 'Overview 1');
      expect(await driver.getText(releaseTextFinder1), '1999-10-12');

      // Movie 2
      SerializableFinder titleTextFinder2 = find.byValueKey('2-title');
      SerializableFinder overviewTextFinder2 = find.byValueKey('2-overview');
      SerializableFinder releaseTextFinder2 = find.byValueKey('2-releaseDate');

      expect(await driver.getText(titleTextFinder2), 'Fight Club 2');
      expect(await driver.getText(overviewTextFinder2), 'Overview 2');
      expect(await driver.getText(releaseTextFinder2), '1999-10-20');
    });
  });
}