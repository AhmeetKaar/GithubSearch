import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_search/search_screen.dart';
import 'package:github_search_library/githubsearchlibrary/src/github_cache.dart';
import 'package:github_search_library/githubsearchlibrary/src/github_client.dart';
import 'package:github_search_library/githubsearchlibrary/src/github_search_bloc.dart';


void main() {
  final githubRepository = GithubRepo(
    GithubCache(),
    GithubClient(),
  );

  runApp(App(githubRepository: githubRepository));
}

class App extends StatelessWidget {
  const App({required this.githubRepository, super.key});

  final GithubRepo githubRepository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Github Search',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Github Search'),),
        body: BlocProvider(
          create: (_) => GithubSearchBloc(githubRepo: githubRepository),
          child: const SearchForm(),
        ),
      ),
    );
  }
}