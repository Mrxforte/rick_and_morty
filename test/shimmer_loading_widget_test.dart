import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rick_and_morty/views/widgets/shimmer_loading_widget.dart';

void main() {
  group('CharacterCardShimmer', () {
    testWidgets('should render without errors', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CharacterCardShimmer(),
          ),
        ),
      );

      expect(find.byType(CharacterCardShimmer), findsOneWidget);
    });

    testWidgets('should display shimmer containers', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CharacterCardShimmer(),
          ),
        ),
      );

      // Check that the shimmer widget is present
      expect(find.byType(Container), findsWidgets);
    });
  });

  group('EpisodeShimmer', () {
    testWidgets('should render without errors', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: EpisodeShimmer(),
          ),
        ),
      );

      expect(find.byType(EpisodeShimmer), findsOneWidget);
    });

    testWidgets('should display shimmer elements in row layout', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: EpisodeShimmer(),
          ),
        ),
      );

      // Check that the row and shimmer elements are present
      expect(find.byType(Row), findsOneWidget);
      expect(find.byType(Container), findsWidgets);
    });
  });

  group('ShimmerListView', () {
    testWidgets('should render with default item count', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ShimmerListView(),
          ),
        ),
      );

      expect(find.byType(ShimmerListView), findsOneWidget);
      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets('should render with custom item count', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ShimmerListView(itemCount: 3),
          ),
        ),
      );

      expect(find.byType(ShimmerListView), findsOneWidget);
      expect(find.byType(CharacterCardShimmer), findsNWidgets(3));
    });

    testWidgets('should have non-scrollable physics', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ShimmerListView(),
          ),
        ),
      );

      final listView = tester.widget<ListView>(find.byType(ListView));
      expect(listView.physics, isA<NeverScrollableScrollPhysics>());
    });
  });
}
