import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_search/main.dart';
import 'package:github_search/search_screen.dart';
import 'package:github_search_library/githubsearchlibrary/src/github_cache.dart';
import 'package:github_search_library/githubsearchlibrary/src/github_client.dart';

void main() {
  testWidgets('Github search form smoke test', (WidgetTester tester) async {
    final githubRepository = GithubRepo(
      GithubCache(),
      GithubClient(),
    );

    await tester.pumpWidget(App(githubRepository: githubRepository));

    expect(find.byType(SearchForm), findsOneWidget);
    expect(find.text('Search'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'flutter');

    await tester.tap(find.byType(ElevatedButton));

    await tester.pump();

    await tester.pumpAndSettle();

    expect(find.text('flutter'), findsOneWidget);
  });
}
