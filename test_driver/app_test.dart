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

      //TODO: 1- provide to good value for the test
      expect(await driver.getText(titleTextFinder1), '');
      expect(await driver.getText(overviewTextFinder1), '');
      expect(await driver.getText(releaseTextFinder1), '');

      // Movie 2
      //TODO: 2- initialize titleTextFinder2 , overviewTextFinder2 , releaseTextFinder2
      SerializableFinder titleTextFinder2;
      SerializableFinder overviewTextFinder2;
      SerializableFinder releaseTextFinder2;

      expect(await driver.getText(titleTextFinder2), 'Fight Club 2');
      expect(await driver.getText(overviewTextFinder2), 'Overview 2');
      expect(await driver.getText(releaseTextFinder2), '1999-10-20');
    });
  });
}