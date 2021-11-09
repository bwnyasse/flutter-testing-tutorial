import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'main.dart' as app;

void main() {
  group('Testing App Performance Tests', () {
    final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized() as IntegrationTestWidgetsFlutterBinding;

    binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

    testWidgets('starts with topRated', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Movie 1
      final titleTextFinder1 = find.byKey(Key('1-title'));
      final overviewTextFinder1 = find.byKey(Key('1-overview'));
      final releaseTextFinder1 = find.byKey(Key('1-releaseDate'));
      // checking widget present or not
      expect(titleTextFinder1, findsOneWidget);
      expect(overviewTextFinder1, findsOneWidget);
      expect(releaseTextFinder1, findsOneWidget);

      // checking values
      expect((titleTextFinder1.evaluate().single.widget as Text).data, 'Fight Club');
      expect((overviewTextFinder1.evaluate().single.widget as Text).data, 'Overview 1');
      expect((releaseTextFinder1.evaluate().single.widget as Text).data, '1999-10-12');

      // Movie 2
      final titleTextFinder2 = find.byKey(Key('2-title'));
      final overviewTextFinder2 = find.byKey(Key('2-overview'));
      final releaseTextFinder2 = find.byKey(Key('2-releaseDate'));
      // checking widget present or not
      expect(titleTextFinder2, findsOneWidget);
      expect(overviewTextFinder2, findsOneWidget);
      expect(releaseTextFinder2, findsOneWidget);

      // checking values
      expect((titleTextFinder2.evaluate().single.widget as Text).data, 'Fight Club 2');
      expect((overviewTextFinder2.evaluate().single.widget as Text).data, 'Overview 2');
      expect((releaseTextFinder2.evaluate().single.widget as Text).data, '1999-10-20');
    });
  });
}
